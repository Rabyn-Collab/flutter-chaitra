// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserOrdersHash() => r'052d54f7b9e3edc411041df62d199256e0b1e6c9';

/// See also [getUserOrders].
@ProviderFor(getUserOrders)
final getUserOrdersProvider = AutoDisposeFutureProvider<List<Order>>.internal(
  getUserOrders,
  name: r'getUserOrdersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getUserOrdersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetUserOrdersRef = AutoDisposeFutureProviderRef<List<Order>>;
String _$getOrderDetailHash() => r'8c32f783320a120cd8e73c25990be4cf08ecc054';

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

/// See also [getOrderDetail].
@ProviderFor(getOrderDetail)
const getOrderDetailProvider = GetOrderDetailFamily();

/// See also [getOrderDetail].
class GetOrderDetailFamily extends Family<AsyncValue<List<Order>>> {
  /// See also [getOrderDetail].
  const GetOrderDetailFamily();

  /// See also [getOrderDetail].
  GetOrderDetailProvider call({
    required String orderId,
  }) {
    return GetOrderDetailProvider(
      orderId: orderId,
    );
  }

  @override
  GetOrderDetailProvider getProviderOverride(
    covariant GetOrderDetailProvider provider,
  ) {
    return call(
      orderId: provider.orderId,
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
  String? get name => r'getOrderDetailProvider';
}

/// See also [getOrderDetail].
class GetOrderDetailProvider extends AutoDisposeFutureProvider<List<Order>> {
  /// See also [getOrderDetail].
  GetOrderDetailProvider({
    required String orderId,
  }) : this._internal(
          (ref) => getOrderDetail(
            ref as GetOrderDetailRef,
            orderId: orderId,
          ),
          from: getOrderDetailProvider,
          name: r'getOrderDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOrderDetailHash,
          dependencies: GetOrderDetailFamily._dependencies,
          allTransitiveDependencies:
              GetOrderDetailFamily._allTransitiveDependencies,
          orderId: orderId,
        );

  GetOrderDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final String orderId;

  @override
  Override overrideWith(
    FutureOr<List<Order>> Function(GetOrderDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOrderDetailProvider._internal(
        (ref) => create(ref as GetOrderDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Order>> createElement() {
    return _GetOrderDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOrderDetailProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetOrderDetailRef on AutoDisposeFutureProviderRef<List<Order>> {
  /// The parameter `orderId` of this provider.
  String get orderId;
}

class _GetOrderDetailProviderElement
    extends AutoDisposeFutureProviderElement<List<Order>>
    with GetOrderDetailRef {
  _GetOrderDetailProviderElement(super.provider);

  @override
  String get orderId => (origin as GetOrderDetailProvider).orderId;
}

String _$orderControllerHash() => r'd47e59f91dcf46836b35bc7aec5951a788da86e1';

/// See also [OrderController].
@ProviderFor(OrderController)
final orderControllerProvider =
    AutoDisposeAsyncNotifierProvider<OrderController, void>.internal(
  OrderController.new,
  name: r'orderControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$orderControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrderController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
