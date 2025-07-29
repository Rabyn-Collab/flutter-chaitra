// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getRoomsHash() => r'e2680bcd947c58c68d08981ece548bc95c784cdd';

/// See also [getRooms].
@ProviderFor(getRooms)
final getRoomsProvider = AutoDisposeStreamProvider<List<types.Room>>.internal(
  getRooms,
  name: r'getRoomsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getRoomsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetRoomsRef = AutoDisposeStreamProviderRef<List<types.Room>>;
String _$roomControllerHash() => r'ad311bce166b30fbfbc374666c172c4c6407fafa';

/// See also [RoomController].
@ProviderFor(RoomController)
final roomControllerProvider =
    AutoDisposeAsyncNotifierProvider<RoomController, types.Room?>.internal(
  RoomController.new,
  name: r'roomControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$roomControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RoomController = AutoDisposeAsyncNotifier<types.Room?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
