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
String _$userPostStreamHash() => r'1f5c2e04b24e4a61fef86c864ca9e07ead68fec0';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [userPostStream].
@ProviderFor(userPostStream)
const userPostStreamProvider = UserPostStreamFamily();

/// See also [userPostStream].
class UserPostStreamFamily extends Family<AsyncValue<List<Post>>> {
  /// See also [userPostStream].
  const UserPostStreamFamily();

  /// See also [userPostStream].
  UserPostStreamProvider call({
    required String userId,
  }) {
    return UserPostStreamProvider(
      userId: userId,
    );
  }

  @override
  UserPostStreamProvider getProviderOverride(
    covariant UserPostStreamProvider provider,
  ) {
    return call(
      userId: provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userPostStreamProvider';
}

/// See also [userPostStream].
class UserPostStreamProvider extends AutoDisposeStreamProvider<List<Post>> {
  /// See also [userPostStream].
  UserPostStreamProvider({
    required String userId,
  }) : this._internal(
          (ref) => userPostStream(
            ref as UserPostStreamRef,
            userId: userId,
          ),
          from: userPostStreamProvider,
          name: r'userPostStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userPostStreamHash,
          dependencies: UserPostStreamFamily._dependencies,
          allTransitiveDependencies:
              UserPostStreamFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserPostStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<List<Post>> Function(UserPostStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserPostStreamProvider._internal(
        (ref) => create(ref as UserPostStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Post>> createElement() {
    return _UserPostStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserPostStreamProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserPostStreamRef on AutoDisposeStreamProviderRef<List<Post>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserPostStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<Post>>
    with UserPostStreamRef {
  _UserPostStreamProviderElement(super.provider);

  @override
  String get userId => (origin as UserPostStreamProvider).userId;
}

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
String _$userProfileStreamHash() => r'333204ac6fe2e3fb05ab8dd9393ccee4372db005';

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
