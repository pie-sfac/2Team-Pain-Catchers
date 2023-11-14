// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apiResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return _ApiResponse.fromJson(json);
}

/// @nodoc
mixin _$ApiResponse {
  String get uuid => throw _privateConstructorUsedError;
  UserModel get writer => throw _privateConstructorUsedError;
  CenterModel get center => throw _privateConstructorUsedError;
  MemberModel get member => throw _privateConstructorUsedError;
  CommentModel get comment => throw _privateConstructorUsedError;
  List<MediaRecordModel> get media => throw _privateConstructorUsedError;
  List<ArchiveLinkModel> get archiveLink => throw _privateConstructorUsedError;
  List<PainHistoryModel> get painHistory => throw _privateConstructorUsedError;
  List<ConditionModel> get condition => throw _privateConstructorUsedError;
  List<ExerciseRecordModel> get exercise => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseCopyWith<ApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<$Res> {
  factory $ApiResponseCopyWith(
          ApiResponse value, $Res Function(ApiResponse) then) =
      _$ApiResponseCopyWithImpl<$Res, ApiResponse>;
  @useResult
  $Res call(
      {String uuid,
      UserModel writer,
      CenterModel center,
      MemberModel member,
      CommentModel comment,
      List<MediaRecordModel> media,
      List<ArchiveLinkModel> archiveLink,
      List<PainHistoryModel> painHistory,
      List<ConditionModel> condition,
      List<ExerciseRecordModel> exercise});

  $UserModelCopyWith<$Res> get writer;
  $CenterModelCopyWith<$Res> get center;
  $MemberModelCopyWith<$Res> get member;
  $CommentModelCopyWith<$Res> get comment;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<$Res, $Val extends ApiResponse>
    implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? writer = null,
    Object? center = null,
    Object? member = null,
    Object? comment = null,
    Object? media = null,
    Object? archiveLink = null,
    Object? painHistory = null,
    Object? condition = null,
    Object? exercise = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      writer: null == writer
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as UserModel,
      center: null == center
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as CenterModel,
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as MemberModel,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as CommentModel,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaRecordModel>,
      archiveLink: null == archiveLink
          ? _value.archiveLink
          : archiveLink // ignore: cast_nullable_to_non_nullable
              as List<ArchiveLinkModel>,
      painHistory: null == painHistory
          ? _value.painHistory
          : painHistory // ignore: cast_nullable_to_non_nullable
              as List<PainHistoryModel>,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as List<ConditionModel>,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as List<ExerciseRecordModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get writer {
    return $UserModelCopyWith<$Res>(_value.writer, (value) {
      return _then(_value.copyWith(writer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CenterModelCopyWith<$Res> get center {
    return $CenterModelCopyWith<$Res>(_value.center, (value) {
      return _then(_value.copyWith(center: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberModelCopyWith<$Res> get member {
    return $MemberModelCopyWith<$Res>(_value.member, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentModelCopyWith<$Res> get comment {
    return $CommentModelCopyWith<$Res>(_value.comment, (value) {
      return _then(_value.copyWith(comment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$ApiResponseImplCopyWith(
          _$ApiResponseImpl value, $Res Function(_$ApiResponseImpl) then) =
      __$$ApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      UserModel writer,
      CenterModel center,
      MemberModel member,
      CommentModel comment,
      List<MediaRecordModel> media,
      List<ArchiveLinkModel> archiveLink,
      List<PainHistoryModel> painHistory,
      List<ConditionModel> condition,
      List<ExerciseRecordModel> exercise});

  @override
  $UserModelCopyWith<$Res> get writer;
  @override
  $CenterModelCopyWith<$Res> get center;
  @override
  $MemberModelCopyWith<$Res> get member;
  @override
  $CommentModelCopyWith<$Res> get comment;
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res, _$ApiResponseImpl>
    implements _$$ApiResponseImplCopyWith<$Res> {
  __$$ApiResponseImplCopyWithImpl(
      _$ApiResponseImpl _value, $Res Function(_$ApiResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? writer = null,
    Object? center = null,
    Object? member = null,
    Object? comment = null,
    Object? media = null,
    Object? archiveLink = null,
    Object? painHistory = null,
    Object? condition = null,
    Object? exercise = null,
  }) {
    return _then(_$ApiResponseImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      writer: null == writer
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as UserModel,
      center: null == center
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as CenterModel,
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as MemberModel,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as CommentModel,
      media: null == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaRecordModel>,
      archiveLink: null == archiveLink
          ? _value._archiveLink
          : archiveLink // ignore: cast_nullable_to_non_nullable
              as List<ArchiveLinkModel>,
      painHistory: null == painHistory
          ? _value._painHistory
          : painHistory // ignore: cast_nullable_to_non_nullable
              as List<PainHistoryModel>,
      condition: null == condition
          ? _value._condition
          : condition // ignore: cast_nullable_to_non_nullable
              as List<ConditionModel>,
      exercise: null == exercise
          ? _value._exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as List<ExerciseRecordModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiResponseImpl implements _ApiResponse {
  const _$ApiResponseImpl(
      {required this.uuid,
      required this.writer,
      required this.center,
      required this.member,
      required this.comment,
      required final List<MediaRecordModel> media,
      required final List<ArchiveLinkModel> archiveLink,
      required final List<PainHistoryModel> painHistory,
      required final List<ConditionModel> condition,
      required final List<ExerciseRecordModel> exercise})
      : _media = media,
        _archiveLink = archiveLink,
        _painHistory = painHistory,
        _condition = condition,
        _exercise = exercise;

  factory _$ApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiResponseImplFromJson(json);

  @override
  final String uuid;
  @override
  final UserModel writer;
  @override
  final CenterModel center;
  @override
  final MemberModel member;
  @override
  final CommentModel comment;
  final List<MediaRecordModel> _media;
  @override
  List<MediaRecordModel> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  final List<ArchiveLinkModel> _archiveLink;
  @override
  List<ArchiveLinkModel> get archiveLink {
    if (_archiveLink is EqualUnmodifiableListView) return _archiveLink;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_archiveLink);
  }

  final List<PainHistoryModel> _painHistory;
  @override
  List<PainHistoryModel> get painHistory {
    if (_painHistory is EqualUnmodifiableListView) return _painHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_painHistory);
  }

  final List<ConditionModel> _condition;
  @override
  List<ConditionModel> get condition {
    if (_condition is EqualUnmodifiableListView) return _condition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_condition);
  }

  final List<ExerciseRecordModel> _exercise;
  @override
  List<ExerciseRecordModel> get exercise {
    if (_exercise is EqualUnmodifiableListView) return _exercise;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercise);
  }

  @override
  String toString() {
    return 'ApiResponse(uuid: $uuid, writer: $writer, center: $center, member: $member, comment: $comment, media: $media, archiveLink: $archiveLink, painHistory: $painHistory, condition: $condition, exercise: $exercise)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.writer, writer) || other.writer == writer) &&
            (identical(other.center, center) || other.center == center) &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            const DeepCollectionEquality()
                .equals(other._archiveLink, _archiveLink) &&
            const DeepCollectionEquality()
                .equals(other._painHistory, _painHistory) &&
            const DeepCollectionEquality()
                .equals(other._condition, _condition) &&
            const DeepCollectionEquality().equals(other._exercise, _exercise));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      writer,
      center,
      member,
      comment,
      const DeepCollectionEquality().hash(_media),
      const DeepCollectionEquality().hash(_archiveLink),
      const DeepCollectionEquality().hash(_painHistory),
      const DeepCollectionEquality().hash(_condition),
      const DeepCollectionEquality().hash(_exercise));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<_$ApiResponseImpl> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<_$ApiResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiResponseImplToJson(
      this,
    );
  }
}

abstract class _ApiResponse implements ApiResponse {
  const factory _ApiResponse(
      {required final String uuid,
      required final UserModel writer,
      required final CenterModel center,
      required final MemberModel member,
      required final CommentModel comment,
      required final List<MediaRecordModel> media,
      required final List<ArchiveLinkModel> archiveLink,
      required final List<PainHistoryModel> painHistory,
      required final List<ConditionModel> condition,
      required final List<ExerciseRecordModel> exercise}) = _$ApiResponseImpl;

  factory _ApiResponse.fromJson(Map<String, dynamic> json) =
      _$ApiResponseImpl.fromJson;

  @override
  String get uuid;
  @override
  UserModel get writer;
  @override
  CenterModel get center;
  @override
  MemberModel get member;
  @override
  CommentModel get comment;
  @override
  List<MediaRecordModel> get media;
  @override
  List<ArchiveLinkModel> get archiveLink;
  @override
  List<PainHistoryModel> get painHistory;
  @override
  List<ConditionModel> get condition;
  @override
  List<ExerciseRecordModel> get exercise;
  @override
  @JsonKey(ignore: true)
  _$$ApiResponseImplCopyWith<_$ApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
