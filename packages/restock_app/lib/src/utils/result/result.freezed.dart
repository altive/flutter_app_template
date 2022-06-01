// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Result<S, F> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(S value) success,
    required TResult Function(F exception) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(S value)? success,
    TResult Function(F exception)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(S value)? success,
    TResult Function(F exception)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<S, F> value) success,
    required TResult Function(Failure<S, F> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success<S, F> value)? success,
    TResult Function(Failure<S, F> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<S, F> value)? success,
    TResult Function(Failure<S, F> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<S, F, $Res> {
  factory $ResultCopyWith(
          Result<S, F> value, $Res Function(Result<S, F>) then) =
      _$ResultCopyWithImpl<S, F, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<S, F, $Res> implements $ResultCopyWith<S, F, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<S, F> _value;
  // ignore: unused_field
  final $Res Function(Result<S, F>) _then;
}

/// @nodoc
abstract class _$$SuccessCopyWith<S, F, $Res> {
  factory _$$SuccessCopyWith(
          _$Success<S, F> value, $Res Function(_$Success<S, F>) then) =
      __$$SuccessCopyWithImpl<S, F, $Res>;
  $Res call({S value});
}

/// @nodoc
class __$$SuccessCopyWithImpl<S, F, $Res>
    extends _$ResultCopyWithImpl<S, F, $Res>
    implements _$$SuccessCopyWith<S, F, $Res> {
  __$$SuccessCopyWithImpl(
      _$Success<S, F> _value, $Res Function(_$Success<S, F>) _then)
      : super(_value, (v) => _then(v as _$Success<S, F>));

  @override
  _$Success<S, F> get _value => super._value as _$Success<S, F>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$Success<S, F>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as S,
    ));
  }
}

/// @nodoc

class _$Success<S, F> extends Success<S, F> with DiagnosticableTreeMixin {
  const _$Success(this.value) : super._();

  @override
  final S value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$S, $F>.success(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result<$S, $F>.success'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success<S, F> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$SuccessCopyWith<S, F, _$Success<S, F>> get copyWith =>
      __$$SuccessCopyWithImpl<S, F, _$Success<S, F>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(S value) success,
    required TResult Function(F exception) failure,
  }) {
    return success(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(S value)? success,
    TResult Function(F exception)? failure,
  }) {
    return success?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(S value)? success,
    TResult Function(F exception)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<S, F> value) success,
    required TResult Function(Failure<S, F> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success<S, F> value)? success,
    TResult Function(Failure<S, F> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<S, F> value)? success,
    TResult Function(Failure<S, F> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<S, F> extends Result<S, F> {
  const factory Success(final S value) = _$Success<S, F>;
  const Success._() : super._();

  S get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<S, F, _$Success<S, F>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureCopyWith<S, F, $Res> {
  factory _$$FailureCopyWith(
          _$Failure<S, F> value, $Res Function(_$Failure<S, F>) then) =
      __$$FailureCopyWithImpl<S, F, $Res>;
  $Res call({F exception});
}

/// @nodoc
class __$$FailureCopyWithImpl<S, F, $Res>
    extends _$ResultCopyWithImpl<S, F, $Res>
    implements _$$FailureCopyWith<S, F, $Res> {
  __$$FailureCopyWithImpl(
      _$Failure<S, F> _value, $Res Function(_$Failure<S, F>) _then)
      : super(_value, (v) => _then(v as _$Failure<S, F>));

  @override
  _$Failure<S, F> get _value => super._value as _$Failure<S, F>;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_$Failure<S, F>(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as F,
    ));
  }
}

/// @nodoc

class _$Failure<S, F> extends Failure<S, F> with DiagnosticableTreeMixin {
  const _$Failure(this.exception) : super._();

  @override
  final F exception;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$S, $F>.failure(exception: $exception)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result<$S, $F>.failure'))
      ..add(DiagnosticsProperty('exception', exception));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Failure<S, F> &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$FailureCopyWith<S, F, _$Failure<S, F>> get copyWith =>
      __$$FailureCopyWithImpl<S, F, _$Failure<S, F>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(S value) success,
    required TResult Function(F exception) failure,
  }) {
    return failure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(S value)? success,
    TResult Function(F exception)? failure,
  }) {
    return failure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(S value)? success,
    TResult Function(F exception)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<S, F> value) success,
    required TResult Function(Failure<S, F> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success<S, F> value)? success,
    TResult Function(Failure<S, F> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<S, F> value)? success,
    TResult Function(Failure<S, F> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<S, F> extends Result<S, F> {
  const factory Failure(final F exception) = _$Failure<S, F>;
  const Failure._() : super._();

  F get exception => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$FailureCopyWith<S, F, _$Failure<S, F>> get copyWith =>
      throw _privateConstructorUsedError;
}
