// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kratom_calculator_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KratomCalculatorParams {
  double get weight => throw _privateConstructorUsedError;
  KratomUserStatusEnum get userStatus => throw _privateConstructorUsedError;
  KratomStateEnum get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KratomCalculatorParamsCopyWith<KratomCalculatorParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KratomCalculatorParamsCopyWith<$Res> {
  factory $KratomCalculatorParamsCopyWith(KratomCalculatorParams value,
          $Res Function(KratomCalculatorParams) then) =
      _$KratomCalculatorParamsCopyWithImpl<$Res, KratomCalculatorParams>;
  @useResult
  $Res call(
      {double weight, KratomUserStatusEnum userStatus, KratomStateEnum state});
}

/// @nodoc
class _$KratomCalculatorParamsCopyWithImpl<$Res,
        $Val extends KratomCalculatorParams>
    implements $KratomCalculatorParamsCopyWith<$Res> {
  _$KratomCalculatorParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = null,
    Object? userStatus = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      userStatus: null == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as KratomUserStatusEnum,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as KratomStateEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KratomCalculatorParamsImplCopyWith<$Res>
    implements $KratomCalculatorParamsCopyWith<$Res> {
  factory _$$KratomCalculatorParamsImplCopyWith(
          _$KratomCalculatorParamsImpl value,
          $Res Function(_$KratomCalculatorParamsImpl) then) =
      __$$KratomCalculatorParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double weight, KratomUserStatusEnum userStatus, KratomStateEnum state});
}

/// @nodoc
class __$$KratomCalculatorParamsImplCopyWithImpl<$Res>
    extends _$KratomCalculatorParamsCopyWithImpl<$Res,
        _$KratomCalculatorParamsImpl>
    implements _$$KratomCalculatorParamsImplCopyWith<$Res> {
  __$$KratomCalculatorParamsImplCopyWithImpl(
      _$KratomCalculatorParamsImpl _value,
      $Res Function(_$KratomCalculatorParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = null,
    Object? userStatus = null,
    Object? state = null,
  }) {
    return _then(_$KratomCalculatorParamsImpl(
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      userStatus: null == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as KratomUserStatusEnum,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as KratomStateEnum,
    ));
  }
}

/// @nodoc

class _$KratomCalculatorParamsImpl implements _KratomCalculatorParams {
  const _$KratomCalculatorParamsImpl(
      {required this.weight, required this.userStatus, required this.state});

  @override
  final double weight;
  @override
  final KratomUserStatusEnum userStatus;
  @override
  final KratomStateEnum state;

  @override
  String toString() {
    return 'KratomCalculatorParams(weight: $weight, userStatus: $userStatus, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KratomCalculatorParamsImpl &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weight, userStatus, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KratomCalculatorParamsImplCopyWith<_$KratomCalculatorParamsImpl>
      get copyWith => __$$KratomCalculatorParamsImplCopyWithImpl<
          _$KratomCalculatorParamsImpl>(this, _$identity);
}

abstract class _KratomCalculatorParams implements KratomCalculatorParams {
  const factory _KratomCalculatorParams(
      {required final double weight,
      required final KratomUserStatusEnum userStatus,
      required final KratomStateEnum state}) = _$KratomCalculatorParamsImpl;

  @override
  double get weight;
  @override
  KratomUserStatusEnum get userStatus;
  @override
  KratomStateEnum get state;
  @override
  @JsonKey(ignore: true)
  _$$KratomCalculatorParamsImplCopyWith<_$KratomCalculatorParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
