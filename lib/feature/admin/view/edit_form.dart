import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_chaitra/feature/products/models/product.dart';
import 'package:flutter_chaitra/feature/products/view/controllers/product_controller.dart';
import 'package:flutter_chaitra/feature/shared/image_provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';


class EditForm extends ConsumerStatefulWidget {
  final Product product;
  const EditForm({super.key, required this.product});

  @override
  ConsumerState createState() => _EditFormState();
}

class _EditFormState extends ConsumerState<EditForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(productControllerProvider, (previous, next) {
      next.maybeWhen(
          orElse: () => null,
          data: (data) {
            ref.invalidate(getProductsProvider);
            Fluttertoast.showToast(msg: 'Product Updated Successfully');
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
                  initialValue: widget.product.title ,
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                  decoration: const InputDecoration(label: Text('Title')),
                ),
                const Gap(15),
                FormBuilderTextField(
                  name: 'description',
                  initialValue: widget.product.description ,
                  maxLines: 2,
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                  decoration: const InputDecoration(label: Text('Description')),
                ),
                const Gap(15),
                FormBuilderTextField(
                  initialValue: widget.product.price.toString(),
                  keyboardType: TextInputType.number,
                  name: 'price',
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                  decoration: const InputDecoration(label: Text('Price')),
                ),
                const Gap(15),
                FormBuilderDropdown(
                    hint: const Text('Category'),
                    name: 'category',
                    initialValue: widget.product.category,
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
                    initialValue: widget.product.brand,
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
                    child: image == null ? CachedNetworkImage(imageUrl: '$base${widget.product.image}') : Image.file(File(image.path)),
                  ),
                ),
                const Gap(40),
                ElevatedButton(onPressed: productController.isLoading ? null : (){
                  FocusScope.of(context).unfocus();
                  if(_formKey.currentState!.saveAndValidate(focusOnInvalid: false) ) {
                    final map = _formKey.currentState!.value;
                    if(image == null) {
                      ref.read(productControllerProvider.notifier).updateProduct(
                          data: map,
                          id: widget.product.id,
                      );

                    }else{
                      ref.read(productControllerProvider.notifier).updateProduct(
                          data: map,
                          id: widget.product.id,
                          image: image
                      );
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
