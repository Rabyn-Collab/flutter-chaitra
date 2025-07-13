// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pass_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$passControllerHash() => r'98b5e7872d3bc1f8bc22bbbb205cb6c616a7a084';

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

abstract class _$PassController extends BuildlessAutoDisposeNotifier<bool> {
  late final int index;

  bool build(
    int index,
  );
}

/// See also [PassController].
@ProviderFor(PassController)
const passControllerProvider = PassControllerFamily();

/// See also [PassController].
class PassControllerFamily extends Family<bool> {
  /// See also [PassController].
  const PassControllerFamily();

  /// See also [PassController].
  PassControllerProvider call(
    int index,
  ) {
    return PassControllerProvider(
      index,
    );
  }

  @override
  PassControllerProvider getProviderOverride(
    covariant PassControllerProvider provider,
  ) {
    return call(
      provider.index,
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
  String? get name => r'passControllerProvider';
}

/// See also [PassController].
class PassControllerProvider
    extends AutoDisposeNotifierProviderImpl<PassController, bool> {
  /// See also [PassController].
  PassControllerProvider(
    int index,
  ) : this._internal(
          () => PassController()..index = index,
          from: passControllerProvider,
          name: r'passControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$passControllerHash,
          dependencies: PassControllerFamily._dependencies,
          allTransitiveDependencies:
              PassControllerFamily._allTransitiveDependencies,
          index: index,
        );

  PassControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  bool runNotifierBuild(
    covariant PassController notifier,
  ) {
    return notifier.build(
      index,
    );
  }

  @override
  Override overrideWith(PassController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PassControllerProvider._internal(
        () => create()..index = index,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PassController, bool> createElement() {
    return _PassControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PassControllerProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PassControllerRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `index` of this provider.
  int get index;
}

class _PassControllerProviderElement
    extends AutoDisposeNotifierProviderElement<PassController, bool>
    with PassControllerRef {
  _PassControllerProviderElement(super.provider);

  @override
  int get index => (origin as PassControllerProvider).index;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
