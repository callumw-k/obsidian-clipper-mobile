// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LinkDto _$LinkDtoFromJson(Map<String, dynamic> json) {
  return _LinkDto.fromJson(json);
}

/// @nodoc
mixin _$LinkDto {
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get id =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'original_url')
  String get originalUrl => throw _privateConstructorUsedError;

  /// Serializes this LinkDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LinkDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LinkDtoCopyWith<LinkDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkDtoCopyWith<$Res> {
  factory $LinkDtoCopyWith(LinkDto value, $Res Function(LinkDto) then) =
      _$LinkDtoCopyWithImpl<$Res, LinkDto>;
  @useResult
  $Res call(
      {String title,
      String image,
      int id,
      @JsonKey(name: 'original_url') String originalUrl});
}

/// @nodoc
class _$LinkDtoCopyWithImpl<$Res, $Val extends LinkDto>
    implements $LinkDtoCopyWith<$Res> {
  _$LinkDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LinkDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
    Object? id = null,
    Object? originalUrl = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originalUrl: null == originalUrl
          ? _value.originalUrl
          : originalUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinkDtoImplCopyWith<$Res> implements $LinkDtoCopyWith<$Res> {
  factory _$$LinkDtoImplCopyWith(
          _$LinkDtoImpl value, $Res Function(_$LinkDtoImpl) then) =
      __$$LinkDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String image,
      int id,
      @JsonKey(name: 'original_url') String originalUrl});
}

/// @nodoc
class __$$LinkDtoImplCopyWithImpl<$Res>
    extends _$LinkDtoCopyWithImpl<$Res, _$LinkDtoImpl>
    implements _$$LinkDtoImplCopyWith<$Res> {
  __$$LinkDtoImplCopyWithImpl(
      _$LinkDtoImpl _value, $Res Function(_$LinkDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LinkDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
    Object? id = null,
    Object? originalUrl = null,
  }) {
    return _then(_$LinkDtoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originalUrl: null == originalUrl
          ? _value.originalUrl
          : originalUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LinkDtoImpl implements _LinkDto {
  _$LinkDtoImpl(
      {required this.title,
      required this.image,
      required this.id,
      @JsonKey(name: 'original_url') required this.originalUrl});

  factory _$LinkDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkDtoImplFromJson(json);

  @override
  final String title;
  @override
  final String image;
  @override
  final int id;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'original_url')
  final String originalUrl;

  @override
  String toString() {
    return 'LinkDto(title: $title, image: $image, id: $id, originalUrl: $originalUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.originalUrl, originalUrl) ||
                other.originalUrl == originalUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, image, id, originalUrl);

  /// Create a copy of LinkDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkDtoImplCopyWith<_$LinkDtoImpl> get copyWith =>
      __$$LinkDtoImplCopyWithImpl<_$LinkDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkDtoImplToJson(
      this,
    );
  }
}

abstract class _LinkDto implements LinkDto {
  factory _LinkDto(
          {required final String title,
          required final String image,
          required final int id,
          @JsonKey(name: 'original_url') required final String originalUrl}) =
      _$LinkDtoImpl;

  factory _LinkDto.fromJson(Map<String, dynamic> json) = _$LinkDtoImpl.fromJson;

  @override
  String get title;
  @override
  String get image;
  @override
  int get id; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'original_url')
  String get originalUrl;

  /// Create a copy of LinkDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinkDtoImplCopyWith<_$LinkDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
