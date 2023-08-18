///
//  Generated code. Do not modify.
//  source: quote_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Quote extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Quote', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quotes'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'author')
    ..hasRequiredFields = false
  ;

  Quote._() : super();
  factory Quote({
    $core.String? id,
    $core.String? text,
    $core.String? author,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (text != null) {
      _result.text = text;
    }
    if (author != null) {
      _result.author = author;
    }
    return _result;
  }
  factory Quote.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Quote.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Quote clone() => Quote()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Quote copyWith(void Function(Quote) updates) => super.copyWith((message) => updates(message as Quote)) as Quote; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Quote create() => Quote._();
  Quote createEmptyInstance() => create();
  static $pb.PbList<Quote> createRepeated() => $pb.PbList<Quote>();
  @$core.pragma('dart2js:noInline')
  static Quote getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Quote>(create);
  static Quote? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get author => $_getSZ(2);
  @$pb.TagNumber(3)
  set author($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthor() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthor() => clearField(3);
}

class GetQuoteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetQuoteRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quotes'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetQuoteRequest._() : super();
  factory GetQuoteRequest() => create();
  factory GetQuoteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetQuoteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetQuoteRequest clone() => GetQuoteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetQuoteRequest copyWith(void Function(GetQuoteRequest) updates) => super.copyWith((message) => updates(message as GetQuoteRequest)) as GetQuoteRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetQuoteRequest create() => GetQuoteRequest._();
  GetQuoteRequest createEmptyInstance() => create();
  static $pb.PbList<GetQuoteRequest> createRepeated() => $pb.PbList<GetQuoteRequest>();
  @$core.pragma('dart2js:noInline')
  static GetQuoteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetQuoteRequest>(create);
  static GetQuoteRequest? _defaultInstance;
}

class StreamQuotesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StreamQuotesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quotes'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'streamIntervalInSeconds', $pb.PbFieldType.O3, protoName: 'streamIntervalInSeconds')
    ..hasRequiredFields = false
  ;

  StreamQuotesRequest._() : super();
  factory StreamQuotesRequest({
    $core.int? streamIntervalInSeconds,
  }) {
    final _result = create();
    if (streamIntervalInSeconds != null) {
      _result.streamIntervalInSeconds = streamIntervalInSeconds;
    }
    return _result;
  }
  factory StreamQuotesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamQuotesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamQuotesRequest clone() => StreamQuotesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamQuotesRequest copyWith(void Function(StreamQuotesRequest) updates) => super.copyWith((message) => updates(message as StreamQuotesRequest)) as StreamQuotesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamQuotesRequest create() => StreamQuotesRequest._();
  StreamQuotesRequest createEmptyInstance() => create();
  static $pb.PbList<StreamQuotesRequest> createRepeated() => $pb.PbList<StreamQuotesRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamQuotesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamQuotesRequest>(create);
  static StreamQuotesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get streamIntervalInSeconds => $_getIZ(0);
  @$pb.TagNumber(1)
  set streamIntervalInSeconds($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStreamIntervalInSeconds() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreamIntervalInSeconds() => clearField(1);
}

class ListQuotesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListQuotesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quotes'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberOfQuotes', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ListQuotesRequest._() : super();
  factory ListQuotesRequest({
    $core.int? numberOfQuotes,
  }) {
    final _result = create();
    if (numberOfQuotes != null) {
      _result.numberOfQuotes = numberOfQuotes;
    }
    return _result;
  }
  factory ListQuotesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListQuotesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListQuotesRequest clone() => ListQuotesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListQuotesRequest copyWith(void Function(ListQuotesRequest) updates) => super.copyWith((message) => updates(message as ListQuotesRequest)) as ListQuotesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListQuotesRequest create() => ListQuotesRequest._();
  ListQuotesRequest createEmptyInstance() => create();
  static $pb.PbList<ListQuotesRequest> createRepeated() => $pb.PbList<ListQuotesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListQuotesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListQuotesRequest>(create);
  static ListQuotesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get numberOfQuotes => $_getIZ(0);
  @$pb.TagNumber(1)
  set numberOfQuotes($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumberOfQuotes() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumberOfQuotes() => clearField(1);
}

class ListQuotesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListQuotesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quotes'), createEmptyInstance: create)
    ..pc<Quote>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'quotes', $pb.PbFieldType.PM, subBuilder: Quote.create)
    ..hasRequiredFields = false
  ;

  ListQuotesResponse._() : super();
  factory ListQuotesResponse({
    $core.Iterable<Quote>? quotes,
  }) {
    final _result = create();
    if (quotes != null) {
      _result.quotes.addAll(quotes);
    }
    return _result;
  }
  factory ListQuotesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListQuotesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListQuotesResponse clone() => ListQuotesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListQuotesResponse copyWith(void Function(ListQuotesResponse) updates) => super.copyWith((message) => updates(message as ListQuotesResponse)) as ListQuotesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListQuotesResponse create() => ListQuotesResponse._();
  ListQuotesResponse createEmptyInstance() => create();
  static $pb.PbList<ListQuotesResponse> createRepeated() => $pb.PbList<ListQuotesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListQuotesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListQuotesResponse>(create);
  static ListQuotesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Quote> get quotes => $_getList(0);
}

class FilterQuotesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FilterQuotesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quotes'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keyword')
    ..hasRequiredFields = false
  ;

  FilterQuotesRequest._() : super();
  factory FilterQuotesRequest({
    $core.String? keyword,
  }) {
    final _result = create();
    if (keyword != null) {
      _result.keyword = keyword;
    }
    return _result;
  }
  factory FilterQuotesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterQuotesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterQuotesRequest clone() => FilterQuotesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterQuotesRequest copyWith(void Function(FilterQuotesRequest) updates) => super.copyWith((message) => updates(message as FilterQuotesRequest)) as FilterQuotesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FilterQuotesRequest create() => FilterQuotesRequest._();
  FilterQuotesRequest createEmptyInstance() => create();
  static $pb.PbList<FilterQuotesRequest> createRepeated() => $pb.PbList<FilterQuotesRequest>();
  @$core.pragma('dart2js:noInline')
  static FilterQuotesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterQuotesRequest>(create);
  static FilterQuotesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get keyword => $_getSZ(0);
  @$pb.TagNumber(1)
  set keyword($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKeyword() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeyword() => clearField(1);
}

class FilterQuotesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FilterQuotesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quotes'), createEmptyInstance: create)
    ..pc<Quote>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'quotes', $pb.PbFieldType.PM, subBuilder: Quote.create)
    ..hasRequiredFields = false
  ;

  FilterQuotesResponse._() : super();
  factory FilterQuotesResponse({
    $core.Iterable<Quote>? quotes,
  }) {
    final _result = create();
    if (quotes != null) {
      _result.quotes.addAll(quotes);
    }
    return _result;
  }
  factory FilterQuotesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterQuotesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterQuotesResponse clone() => FilterQuotesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterQuotesResponse copyWith(void Function(FilterQuotesResponse) updates) => super.copyWith((message) => updates(message as FilterQuotesResponse)) as FilterQuotesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FilterQuotesResponse create() => FilterQuotesResponse._();
  FilterQuotesResponse createEmptyInstance() => create();
  static $pb.PbList<FilterQuotesResponse> createRepeated() => $pb.PbList<FilterQuotesResponse>();
  @$core.pragma('dart2js:noInline')
  static FilterQuotesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterQuotesResponse>(create);
  static FilterQuotesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Quote> get quotes => $_getList(0);
}

class FavoriteQuoteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FavoriteQuoteRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quotes'), createEmptyInstance: create)
    ..pc<Quote>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'quote', $pb.PbFieldType.PM, subBuilder: Quote.create)
    ..hasRequiredFields = false
  ;

  FavoriteQuoteRequest._() : super();
  factory FavoriteQuoteRequest({
    $core.Iterable<Quote>? quote,
  }) {
    final _result = create();
    if (quote != null) {
      _result.quote.addAll(quote);
    }
    return _result;
  }
  factory FavoriteQuoteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteQuoteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoriteQuoteRequest clone() => FavoriteQuoteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoriteQuoteRequest copyWith(void Function(FavoriteQuoteRequest) updates) => super.copyWith((message) => updates(message as FavoriteQuoteRequest)) as FavoriteQuoteRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FavoriteQuoteRequest create() => FavoriteQuoteRequest._();
  FavoriteQuoteRequest createEmptyInstance() => create();
  static $pb.PbList<FavoriteQuoteRequest> createRepeated() => $pb.PbList<FavoriteQuoteRequest>();
  @$core.pragma('dart2js:noInline')
  static FavoriteQuoteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteQuoteRequest>(create);
  static FavoriteQuoteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Quote> get quote => $_getList(0);
}

class FavoriteQuotesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FavoriteQuotesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'quotes'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<Quote>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorites', $pb.PbFieldType.PM, subBuilder: Quote.create)
    ..hasRequiredFields = false
  ;

  FavoriteQuotesResponse._() : super();
  factory FavoriteQuotesResponse({
    $core.String? message,
    $core.Iterable<Quote>? favorites,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (favorites != null) {
      _result.favorites.addAll(favorites);
    }
    return _result;
  }
  factory FavoriteQuotesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteQuotesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoriteQuotesResponse clone() => FavoriteQuotesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoriteQuotesResponse copyWith(void Function(FavoriteQuotesResponse) updates) => super.copyWith((message) => updates(message as FavoriteQuotesResponse)) as FavoriteQuotesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FavoriteQuotesResponse create() => FavoriteQuotesResponse._();
  FavoriteQuotesResponse createEmptyInstance() => create();
  static $pb.PbList<FavoriteQuotesResponse> createRepeated() => $pb.PbList<FavoriteQuotesResponse>();
  @$core.pragma('dart2js:noInline')
  static FavoriteQuotesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteQuotesResponse>(create);
  static FavoriteQuotesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Quote> get favorites => $_getList(1);
}

