// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controllers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userStreamHash() => r'90834336948411188ffc47623ef6b77c15b5ec9e';

/// See also [userStream].
@ProviderFor(userStream)
final userStreamProvider = AutoDisposeStreamProvider<User?>.internal(
  userStream,
  name: r'userStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserStreamRef = AutoDisposeStreamProviderRef<User?>;
String _$allUserStreamHash() => r'ee605838dd3b4af2d36b4c5bfcc23b963a7e6006';

/// See also [allUserStream].
@ProviderFor(allUserStream)
final allUserStreamProvider =
    AutoDisposeStreamProvider<List<types.User>>.internal(
  allUserStream,
  name: r'allUserStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allUserStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AllUserStreamRef = AutoDisposeStreamProviderRef<List<types.User>>;
String _$userProfileStreamHash() => r'e38b9de45dcddf2892a82022a5f6fa459cee251c';

/// See also [userProfileStream].
@ProviderFor(userProfileStream)
final userProfileStreamProvider =
    AutoDisposeStreamProvider<types.User>.internal(
  userProfileStream,
  name: r'userProfileStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userProfileStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserProfileStreamRef = AutoDisposeStreamProviderRef<types.User>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
