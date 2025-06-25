import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/products/view/controllers/product_controller.dart';
import 'package:flutter_chaitra/feature/shared/image_provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';


class AddForm extends ConsumerStatefulWidget {
  const AddForm({super.key});

  @override
  ConsumerState createState() => _AddFormState();
}

class _AddFormState extends ConsumerState<AddForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(productControllerProvider, (previous, next) {
      next.maybeWhen(
          orElse: () => null,
          data: (data) {
            ref.invalidate(getProductsProvider);
            Fluttertoast.showToast(msg: 'Product Added Successfully');
            context.pop();
          },
          error: (err, st) {
            Fluttertoast.showToast(msg: '$err');
          });
    });
    final image = ref.watch(imageControllerProvider);
    final productController = ref.watch(productControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: ListView(
              children: [
                // title, description, price, category, brand
                FormBuilderTextField(
                  name: 'title',
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                  decoration: const InputDecoration(label: Text('Title')),
                ),
                const Gap(15),
                FormBuilderTextField(
                  name: 'description',
                  maxLines: 2,
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                  decoration: const InputDecoration(label: Text('Description')),
                ),
                const Gap(15),
                FormBuilderTextField(
                  keyboardType: TextInputType.number,
                  name: 'price',
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                  decoration: const InputDecoration(label: Text('Price')),
                ),
                const Gap(15),
               FormBuilderDropdown(
                   hint: const Text('Category'),
                   name: 'category',
                   validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                   items: [
                 DropdownMenuItem(value: 'electronics', child: Text('Electronics')),
                 DropdownMenuItem(value: 'jewelery', child: Text('Jewelery')),
                 DropdownMenuItem(value: 'men\'s clothing', child: Text('Men\'s Clothing')),
                 DropdownMenuItem(value: 'women\'s clothing', child: Text('Women\'s Clothing')),
               ] ),
                const Gap(15),
                 FormBuilderDropdown(
                     hint: const Text('brand'),
                     name: 'brand',
                     validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                     items: [

                       DropdownMenuItem(value: 'Apple', child: Text('Apple')),
                       DropdownMenuItem(value: 'Samsung', child: Text('Samsung')),
                       DropdownMenuItem(value: 'Addidas', child: Text('Addidas')),
                       DropdownMenuItem(value: 'Google', child: Text('Google')),
                       DropdownMenuItem(value: 'Tanishq', child: Text('Tanishq')),
                     ]
                 ),
                const Gap(20),
                InkWell(
                  onTap: (){
                    ref.read(imageControllerProvider.notifier).pickImage();
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                    ),
                    child: image == null ? Center(child: const Text('No image selected')) : Image.file(File(image.path)),
                  ),
                ),
                const Gap(40),
                ElevatedButton(onPressed: productController.isLoading ? null : (){
                  FocusScope.of(context).unfocus();
                  if(_formKey.currentState!.saveAndValidate(focusOnInvalid: false) ) {
                    final map = _formKey.currentState!.value;
                    if(image == null) {
                      Fluttertoast.showToast(
                        msg: "Please select an image",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    }else{
                      ref.read(productControllerProvider.notifier).addProduct(map, image);
                    }

                  }
                }, child: productController.isLoading ? const CircularProgressIndicator() : Text('Submit'))

              ],
            ),
          )
      ),
    );
  }
}
