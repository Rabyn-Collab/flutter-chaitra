// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$validateModeHash() => r'455a0a0d902883be09c64efb0fa80c932fed4291';

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

abstract class _$ValidateMode
    extends BuildlessAutoDisposeNotifier<AutovalidateMode> {
  late final String label;

  AutovalidateMode build(
    String label,
  );
}

/// See also [ValidateMode].
@ProviderFor(ValidateMode)
const validateModeProvider = ValidateModeFamily();

/// See also [ValidateMode].
class ValidateModeFamily extends Family<AutovalidateMode> {
  /// See also [ValidateMode].
  const ValidateModeFamily();

  /// See also [ValidateMode].
  ValidateModeProvider call(
    String label,
  ) {
    return ValidateModeProvider(
      label,
    );
  }

  @override
  ValidateModeProvider getProviderOverride(
    covariant ValidateModeProvider provider,
  ) {
    return call(
      provider.label,
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
  String? get name => r'validateModeProvider';
}

/// See also [ValidateMode].
class ValidateModeProvider
    extends AutoDisposeNotifierProviderImpl<ValidateMode, AutovalidateMode> {
  /// See also [ValidateMode].
  ValidateModeProvider(
    String label,
  ) : this._internal(
          () => ValidateMode()..label = label,
          from: validateModeProvider,
          name: r'validateModeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$validateModeHash,
          dependencies: ValidateModeFamily._dependencies,
          allTransitiveDependencies:
              ValidateModeFamily._allTransitiveDependencies,
          label: label,
        );

  ValidateModeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.label,
  }) : super.internal();

  final String label;

  @override
  AutovalidateMode runNotifierBuild(
    covariant ValidateMode notifier,
  ) {
    return notifier.build(
      label,
    );
  }

  @override
  Override overrideWith(ValidateMode Function() create) {
    return ProviderOverride(
      origin: this,
      override: ValidateModeProvider._internal(
        () => create()..label = label,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        label: label,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ValidateMode, AutovalidateMode>
      createElement() {
    return _ValidateModeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ValidateModeProvider && other.label == label;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, label.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ValidateModeRef on AutoDisposeNotifierProviderRef<AutovalidateMode> {
  /// The parameter `label` of this provider.
  String get label;
}

class _ValidateModeProviderElement
    extends AutoDisposeNotifierProviderElement<ValidateMode, AutovalidateMode>
    with ValidateModeRef {
  _ValidateModeProviderElement(super.provider);

  @override
  String get label => (origin as ValidateModeProvider).label;
}

String _$passControllerHash() => r'02efa50b602454cdc0dbaa2547232c4de1e21eb0';

abstract class _$PassController extends BuildlessAutoDisposeNotifier<bool> {
  late final String label;

  bool build(
    String label,
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
    String label,
  ) {
    return PassControllerProvider(
      label,
    );
  }

  @override
  PassControllerProvider getProviderOverride(
    covariant PassControllerProvider provider,
  ) {
    return call(
      provider.label,
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
    String label,
  ) : this._internal(
          () => PassController()..label = label,
          from: passControllerProvider,
          name: r'passControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$passControllerHash,
          dependencies: PassControllerFamily._dependencies,
          allTransitiveDependencies:
              PassControllerFamily._allTransitiveDependencies,
          label: label,
        );

  PassControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.label,
  }) : super.internal();

  final String label;

  @override
  bool runNotifierBuild(
    covariant PassController notifier,
  ) {
    return notifier.build(
      label,
    );
  }

  @override
  Override overrideWith(PassController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PassControllerProvider._internal(
        () => create()..label = label,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        label: label,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PassController, bool> createElement() {
    return _PassControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PassControllerProvider && other.label == label;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, label.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PassControllerRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `label` of this provider.
  String get label;
}

class _PassControllerProviderElement
    extends AutoDisposeNotifierProviderElement<PassController, bool>
    with PassControllerRef {
  _PassControllerProviderElement(super.provider);

  @override
  String get label => (origin as PassControllerProvider).label;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
