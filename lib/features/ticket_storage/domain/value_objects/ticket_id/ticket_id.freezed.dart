// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TicketID {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketIDCopyWith<TicketID> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketIDCopyWith<$Res> {
  factory $TicketIDCopyWith(TicketID value, $Res Function(TicketID) then) =
      _$TicketIDCopyWithImpl<$Res, TicketID>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$TicketIDCopyWithImpl<$Res, $Val extends TicketID>
    implements $TicketIDCopyWith<$Res> {
  _$TicketIDCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TicketIDCopyWith<$Res> implements $TicketIDCopyWith<$Res> {
  factory _$$_TicketIDCopyWith(
          _$_TicketID value, $Res Function(_$_TicketID) then) =
      __$$_TicketIDCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_TicketIDCopyWithImpl<$Res>
    extends _$TicketIDCopyWithImpl<$Res, _$_TicketID>
    implements _$$_TicketIDCopyWith<$Res> {
  __$$_TicketIDCopyWithImpl(
      _$_TicketID _value, $Res Function(_$_TicketID) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_TicketID(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TicketID extends _TicketID {
  const _$_TicketID(this.value) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'TicketID(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TicketID &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketIDCopyWith<_$_TicketID> get copyWith =>
      __$$_TicketIDCopyWithImpl<_$_TicketID>(this, _$identity);
}

abstract class _TicketID extends TicketID {
  const factory _TicketID(final String value) = _$_TicketID;
  const _TicketID._() : super._();

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_TicketIDCopyWith<_$_TicketID> get copyWith =>
      throw _privateConstructorUsedError;
}
