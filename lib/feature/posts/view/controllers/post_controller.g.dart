// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPostsHash() => r'a41272a74cc34069b3710e7015f1682235277aa0';

/// See also [getPosts].
@ProviderFor(getPosts)
final getPostsProvider = AutoDisposeStreamProvider<List<Post>>.internal(
  getPosts,
  name: r'getPostsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getPostsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetPostsRef = AutoDisposeStreamProviderRef<List<Post>>;
String _$postControllerHash() => r'789416791d00944eec6bb0ab5041005e500389d6';

/// See also [PostController].
@ProviderFor(PostController)
final postControllerProvider =
    AutoDisposeAsyncNotifierProvider<PostController, void>.internal(
  PostController.new,
  name: r'postControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PostController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
