// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TicketVM {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  TicketLoadingState get loadingState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketVMCopyWith<TicketVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketVMCopyWith<$Res> {
  factory $TicketVMCopyWith(TicketVM value, $Res Function(TicketVM) then) =
      _$TicketVMCopyWithImpl<$Res, TicketVM>;
  @useResult
  $Res call(
      {String id, String name, String url, TicketLoadingState loadingState});
}

/// @nodoc
class _$TicketVMCopyWithImpl<$Res, $Val extends TicketVM>
    implements $TicketVMCopyWith<$Res> {
  _$TicketVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? loadingState = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as TicketLoadingState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TicketVMCopyWith<$Res> implements $TicketVMCopyWith<$Res> {
  factory _$$_TicketVMCopyWith(
          _$_TicketVM value, $Res Function(_$_TicketVM) then) =
      __$$_TicketVMCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String url, TicketLoadingState loadingState});
}

/// @nodoc
class __$$_TicketVMCopyWithImpl<$Res>
    extends _$TicketVMCopyWithImpl<$Res, _$_TicketVM>
    implements _$$_TicketVMCopyWith<$Res> {
  __$$_TicketVMCopyWithImpl(
      _$_TicketVM _value, $Res Function(_$_TicketVM) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? loadingState = null,
  }) {
    return _then(_$_TicketVM(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as TicketLoadingState,
    ));
  }
}

/// @nodoc

class _$_TicketVM implements _TicketVM {
  const _$_TicketVM(
      {required this.id,
      required this.name,
      required this.url,
      required this.loadingState});

  @override
  final String id;
  @override
  final String name;
  @override
  final String url;
  @override
  final TicketLoadingState loadingState;

  @override
  String toString() {
    return 'TicketVM(id: $id, name: $name, url: $url, loadingState: $loadingState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TicketVM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, url, loadingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketVMCopyWith<_$_TicketVM> get copyWith =>
      __$$_TicketVMCopyWithImpl<_$_TicketVM>(this, _$identity);
}

abstract class _TicketVM implements TicketVM {
  const factory _TicketVM(
      {required final String id,
      required final String name,
      required final String url,
      required final TicketLoadingState loadingState}) = _$_TicketVM;

  @override
  String get id;
  @override
  String get name;
  @override
  String get url;
  @override
  TicketLoadingState get loadingState;
  @override
  @JsonKey(ignore: true)
  _$$_TicketVMCopyWith<_$_TicketVM> get copyWith =>
      throw _privateConstructorUsedError;
}
