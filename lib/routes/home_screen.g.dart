// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LinkImpl _$$LinkImplFromJson(Map<String, dynamic> json) => _$LinkImpl(
      title: json['title'] as String,
      image: json['image'] as String,
      originalUrl: json['original_url'] as String,
    );

Map<String, dynamic> _$$LinkImplToJson(_$LinkImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'original_url': instance.originalUrl,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$linkNotifierHash() => r'5b318ad4f147fea41dab0b935f6fa6d024736490';

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
