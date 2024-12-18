// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LinkDtoImpl _$$LinkDtoImplFromJson(Map<String, dynamic> json) =>
    _$LinkDtoImpl(
      title: json['title'] as String,
      image: json['image'] as String,
      id: (json['id'] as num).toInt(),
      originalUrl: json['original_url'] as String,
    );

Map<String, dynamic> _$$LinkDtoImplToJson(_$LinkDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'id': instance.id,
      'original_url': instance.originalUrl,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$linkNotifierHash() => r'8ff0fd4aecb307286fe3fe6559d94ded374e67a3';

/// See also [LinkNotifier].
@ProviderFor(LinkNotifier)
final linkNotifierProvider =
    AutoDisposeAsyncNotifierProvider<LinkNotifier, List<Link>>.internal(
  LinkNotifier.new,
  name: r'linkNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$linkNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LinkNotifier = AutoDisposeAsyncNotifier<List<Link>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
