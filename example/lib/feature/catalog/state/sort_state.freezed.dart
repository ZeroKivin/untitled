// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SortState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<Sort> sorts) data,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Set<Sort> sorts)? data,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<Sort> sorts)? data,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SortData value) data,
    required TResult Function(SortLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SortData value)? data,
    TResult? Function(SortLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SortData value)? data,
    TResult Function(SortLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortStateCopyWith<$Res> {
  factory $SortStateCopyWith(SortState value, $Res Function(SortState) then) =
      _$SortStateCopyWithImpl<$Res, SortState>;
}

/// @nodoc
class _$SortStateCopyWithImpl<$Res, $Val extends SortState>
    implements $SortStateCopyWith<$Res> {
  _$SortStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SortDataImplCopyWith<$Res> {
  factory _$$SortDataImplCopyWith(
          _$SortDataImpl value, $Res Function(_$SortDataImpl) then) =
      __$$SortDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Set<Sort> sorts});
}

/// @nodoc
class __$$SortDataImplCopyWithImpl<$Res>
    extends _$SortStateCopyWithImpl<$Res, _$SortDataImpl>
    implements _$$SortDataImplCopyWith<$Res> {
  __$$SortDataImplCopyWithImpl(
      _$SortDataImpl _value, $Res Function(_$SortDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sorts = null,
  }) {
    return _then(_$SortDataImpl(
      sorts: null == sorts
          ? _value._sorts
          : sorts // ignore: cast_nullable_to_non_nullable
              as Set<Sort>,
    ));
  }
}

/// @nodoc

class _$SortDataImpl implements SortData {
  const _$SortDataImpl({required final Set<Sort> sorts}) : _sorts = sorts;

  final Set<Sort> _sorts;
  @override
  Set<Sort> get sorts {
    if (_sorts is EqualUnmodifiableSetView) return _sorts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_sorts);
  }

  @override
  String toString() {
    return 'SortState.data(sorts: $sorts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SortDataImpl &&
            const DeepCollectionEquality().equals(other._sorts, _sorts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sorts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SortDataImplCopyWith<_$SortDataImpl> get copyWith =>
      __$$SortDataImplCopyWithImpl<_$SortDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<Sort> sorts) data,
    required TResult Function() loading,
  }) {
    return data(sorts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Set<Sort> sorts)? data,
    TResult? Function()? loading,
  }) {
    return data?.call(sorts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<Sort> sorts)? data,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(sorts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SortData value) data,
    required TResult Function(SortLoading value) loading,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SortData value)? data,
    TResult? Function(SortLoading value)? loading,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SortData value)? data,
    TResult Function(SortLoading value)? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class SortData implements SortState {
  const factory SortData({required final Set<Sort> sorts}) = _$SortDataImpl;

  Set<Sort> get sorts;
  @JsonKey(ignore: true)
  _$$SortDataImplCopyWith<_$SortDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SortLoadingImplCopyWith<$Res> {
  factory _$$SortLoadingImplCopyWith(
          _$SortLoadingImpl value, $Res Function(_$SortLoadingImpl) then) =
      __$$SortLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SortLoadingImplCopyWithImpl<$Res>
    extends _$SortStateCopyWithImpl<$Res, _$SortLoadingImpl>
    implements _$$SortLoadingImplCopyWith<$Res> {
  __$$SortLoadingImplCopyWithImpl(
      _$SortLoadingImpl _value, $Res Function(_$SortLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SortLoadingImpl implements SortLoading {
  const _$SortLoadingImpl();

  @override
  String toString() {
    return 'SortState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SortLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<Sort> sorts) data,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Set<Sort> sorts)? data,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<Sort> sorts)? data,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SortData value) data,
    required TResult Function(SortLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SortData value)? data,
    TResult? Function(SortLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SortData value)? data,
    TResult Function(SortLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SortLoading implements SortState {
  const factory SortLoading() = _$SortLoadingImpl;
}
