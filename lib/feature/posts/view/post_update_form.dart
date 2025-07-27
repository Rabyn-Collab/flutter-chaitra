import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/common/show_toasts.dart';
import 'package:flutter_chaitra/feature/posts/model/post.dart';
import 'package:flutter_chaitra/feature/posts/view/controllers/post_controller.dart';
import 'package:flutter_chaitra/feature/shared/common_provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class PostUpdateForm extends ConsumerStatefulWidget {
  final Post post;
  const PostUpdateForm({super.key, required this.post});

  @override
  ConsumerState createState() => _PostUpdateFormState();
}

class _PostUpdateFormState extends ConsumerState<PostUpdateForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(postUpdateControllerProvider, (prev, next) {
      next.maybeWhen(
        loading: () => context.loaderOverlay.show(),
        data: (value) {
          context.loaderOverlay.hide();
          Toasting.showSuccessToast('post updated success');
          context.pop();
        },
        error: (err, stackTrace) {
          context.loaderOverlay.hide();
          Toasting.showErrorToast(err.toString());
        },
        orElse: () => null,
      );
    });

    final mode = ref.watch(validateModeProvider('post-update'));
    final image = ref.watch(imageControllerProvider);
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Post Add Form'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FormBuilder(
              key: _formKey,
              autovalidateMode: mode,
              child: ListView(
                children: [

                  Gap(40),
                  FormBuilderTextField(
                    name: 'title',
                    initialValue: widget.post.title ,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Title',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  Gap(20),
                  FormBuilderTextField(
                    name: 'body',
                    initialValue: widget.post.body ,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Detail',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  Gap(20),
                  InkWell(
                    onTap: (){
                      ref.read(imageControllerProvider.notifier).pickImage();
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: image == null
                          ? CachedNetworkImage(imageUrl: widget.post.image): Image.file(File(image.path)),

                    ),
                  ),
                  Gap(20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.saveAndValidate(focusOnInvalid: false)) {
                        final map = _formKey.currentState!.value;

                        if(image == null){
                          ref.read(postUpdateControllerProvider.notifier).updatePost(
                              body: map['body'] ,
                              title: map['title'] ,
                             postId: widget.post.id
                          );
                        }else{
                          ref.read(postUpdateControllerProvider.notifier).updatePost(
                              body: map['body'] ,
                              title: map['title'] ,
                              postId: widget.post.id,
                            image: image,
                            imageId: widget.post.imageId
                          );
                        }


                      }else{
                        ref.read(validateModeProvider('post-update').notifier).change();
                      }
                    },
                    child: Text('Submit'),
                  ),
                  Gap(20),



                ],
              )
          ),
        ),
      ),
    );
  }
}
