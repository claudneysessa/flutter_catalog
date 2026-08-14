// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_api_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyApiState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyApiState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyApiState()';
}


}

/// @nodoc
class $MyApiStateCopyWith<$Res>  {
$MyApiStateCopyWith(MyApiState _, $Res Function(MyApiState) __);
}


/// Adds pattern-matching-related methods to [MyApiState].
extension MyApiStatePatterns on MyApiState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SuccessState value)?  success,TResult Function( ErrorState value)?  error,TResult Function( LoadingState value)?  loading,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SuccessState() when success != null:
return success(_that);case ErrorState() when error != null:
return error(_that);case LoadingState() when loading != null:
return loading(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SuccessState value)  success,required TResult Function( ErrorState value)  error,required TResult Function( LoadingState value)  loading,}){
final _that = this;
switch (_that) {
case SuccessState():
return success(_that);case ErrorState():
return error(_that);case LoadingState():
return loading(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SuccessState value)?  success,TResult? Function( ErrorState value)?  error,TResult? Function( LoadingState value)?  loading,}){
final _that = this;
switch (_that) {
case SuccessState() when success != null:
return success(_that);case ErrorState() when error != null:
return error(_that);case LoadingState() when loading != null:
return loading(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<String> data)?  success,TResult Function( String errorMsg)?  error,TResult Function()?  loading,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SuccessState() when success != null:
return success(_that.data);case ErrorState() when error != null:
return error(_that.errorMsg);case LoadingState() when loading != null:
return loading();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<String> data)  success,required TResult Function( String errorMsg)  error,required TResult Function()  loading,}) {final _that = this;
switch (_that) {
case SuccessState():
return success(_that.data);case ErrorState():
return error(_that.errorMsg);case LoadingState():
return loading();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<String> data)?  success,TResult? Function( String errorMsg)?  error,TResult? Function()?  loading,}) {final _that = this;
switch (_that) {
case SuccessState() when success != null:
return success(_that.data);case ErrorState() when error != null:
return error(_that.errorMsg);case LoadingState() when loading != null:
return loading();case _:
  return null;

}
}

}

/// @nodoc


class SuccessState implements MyApiState {
   SuccessState(final  List<String> data): _data = data;
  

 final  List<String> _data;
 List<String> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of MyApiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessStateCopyWith<SuccessState> get copyWith => _$SuccessStateCopyWithImpl<SuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessState&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'MyApiState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $SuccessStateCopyWith<$Res> implements $MyApiStateCopyWith<$Res> {
  factory $SuccessStateCopyWith(SuccessState value, $Res Function(SuccessState) _then) = _$SuccessStateCopyWithImpl;
@useResult
$Res call({
 List<String> data
});




}
/// @nodoc
class _$SuccessStateCopyWithImpl<$Res>
    implements $SuccessStateCopyWith<$Res> {
  _$SuccessStateCopyWithImpl(this._self, this._then);

  final SuccessState _self;
  final $Res Function(SuccessState) _then;

/// Create a copy of MyApiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(SuccessState(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class ErrorState implements MyApiState {
   ErrorState(this.errorMsg);
  

 final  String errorMsg;

/// Create a copy of MyApiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorStateCopyWith<ErrorState> get copyWith => _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorState&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg));
}


@override
int get hashCode => Object.hash(runtimeType,errorMsg);

@override
String toString() {
  return 'MyApiState.error(errorMsg: $errorMsg)';
}


}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<$Res> implements $MyApiStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(ErrorState value, $Res Function(ErrorState) _then) = _$ErrorStateCopyWithImpl;
@useResult
$Res call({
 String errorMsg
});




}
/// @nodoc
class _$ErrorStateCopyWithImpl<$Res>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(this._self, this._then);

  final ErrorState _self;
  final $Res Function(ErrorState) _then;

/// Create a copy of MyApiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMsg = null,}) {
  return _then(ErrorState(
null == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadingState implements MyApiState {
   LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyApiState.loading()';
}


}




// dart format on
