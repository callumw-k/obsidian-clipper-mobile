// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LinkImpl _$$LinkImplFromJson(Map<String, dynamic> json) => _$LinkImpl(
      title: json['title'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$LinkImplToJson(_$LinkImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchLinksHash() => r'd9933cad363b010cbc8d1db473a5c4f2ae62f391';

/// See also [fetchLinks].
@ProviderFor(fetchLinks)
final fetchLinksProvider = AutoDisposeFutureProvider<List<Link>>.internal(
  fetchLinks,
  name: r'fetchLinksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchLinksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchLinksRef = AutoDisposeFutureProviderRef<List<Link>>;
String _$linkNotifierHash() => r'4159ee0789a93c719d493da70dff28094a10877d';

/// See also [LinkNotifier].
@ProviderFor(LinkNotifier)
final linkNotifierProvider =
    AutoDisposeNotifierProvider<LinkNotifier, List<Link>>.internal(
  LinkNotifier.new,
  name: r'linkNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$linkNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LinkNotifier = AutoDisposeNotifier<List<Link>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
