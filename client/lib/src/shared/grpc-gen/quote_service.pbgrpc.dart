///
//  Generated code. Do not modify.
//  source: quote_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'quote_service.pb.dart' as $0;
export 'quote_service.pb.dart';

class QuoteServiceClient extends $grpc.Client {
  static final _$getQuote = $grpc.ClientMethod<$0.GetQuoteRequest, $0.Quote>(
      '/quotes.QuoteService/GetQuote',
      ($0.GetQuoteRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Quote.fromBuffer(value));
  static final _$streamQuotes =
      $grpc.ClientMethod<$0.StreamQuotesRequest, $0.Quote>(
          '/quotes.QuoteService/StreamQuotes',
          ($0.StreamQuotesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Quote.fromBuffer(value));
  static final _$listQuotes =
      $grpc.ClientMethod<$0.ListQuotesRequest, $0.ListQuotesResponse>(
          '/quotes.QuoteService/ListQuotes',
          ($0.ListQuotesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListQuotesResponse.fromBuffer(value));
  static final _$filterQuotes =
      $grpc.ClientMethod<$0.FilterQuotesRequest, $0.FilterQuotesResponse>(
          '/quotes.QuoteService/FilterQuotes',
          ($0.FilterQuotesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.FilterQuotesResponse.fromBuffer(value));
  static final _$favoriteQuotes =
      $grpc.ClientMethod<$0.Quote, $0.FavoriteQuotesResponse>(
          '/quotes.QuoteService/FavoriteQuotes',
          ($0.Quote value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.FavoriteQuotesResponse.fromBuffer(value));

  QuoteServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Quote> getQuote($0.GetQuoteRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getQuote, request, options: options);
  }

  $grpc.ResponseStream<$0.Quote> streamQuotes($0.StreamQuotesRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamQuotes, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.ListQuotesResponse> listQuotes(
      $0.ListQuotesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listQuotes, request, options: options);
  }

  $grpc.ResponseStream<$0.FilterQuotesResponse> filterQuotes(
      $async.Stream<$0.FilterQuotesRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$filterQuotes, request, options: options);
  }

  $grpc.ResponseFuture<$0.FavoriteQuotesResponse> favoriteQuotes(
      $async.Stream<$0.Quote> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$favoriteQuotes, request, options: options)
        .single;
  }
}

abstract class QuoteServiceBase extends $grpc.Service {
  $core.String get $name => 'quotes.QuoteService';

  QuoteServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetQuoteRequest, $0.Quote>(
        'GetQuote',
        getQuote_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetQuoteRequest.fromBuffer(value),
        ($0.Quote value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StreamQuotesRequest, $0.Quote>(
        'StreamQuotes',
        streamQuotes_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.StreamQuotesRequest.fromBuffer(value),
        ($0.Quote value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListQuotesRequest, $0.ListQuotesResponse>(
        'ListQuotes',
        listQuotes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListQuotesRequest.fromBuffer(value),
        ($0.ListQuotesResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.FilterQuotesRequest, $0.FilterQuotesResponse>(
            'FilterQuotes',
            filterQuotes,
            true,
            true,
            ($core.List<$core.int> value) =>
                $0.FilterQuotesRequest.fromBuffer(value),
            ($0.FilterQuotesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Quote, $0.FavoriteQuotesResponse>(
        'FavoriteQuotes',
        favoriteQuotes,
        true,
        false,
        ($core.List<$core.int> value) => $0.Quote.fromBuffer(value),
        ($0.FavoriteQuotesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.Quote> getQuote_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetQuoteRequest> request) async {
    return getQuote(call, await request);
  }

  $async.Stream<$0.Quote> streamQuotes_Pre($grpc.ServiceCall call,
      $async.Future<$0.StreamQuotesRequest> request) async* {
    yield* streamQuotes(call, await request);
  }

  $async.Future<$0.ListQuotesResponse> listQuotes_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListQuotesRequest> request) async {
    return listQuotes(call, await request);
  }

  $async.Future<$0.Quote> getQuote(
      $grpc.ServiceCall call, $0.GetQuoteRequest request);
  $async.Stream<$0.Quote> streamQuotes(
      $grpc.ServiceCall call, $0.StreamQuotesRequest request);
  $async.Future<$0.ListQuotesResponse> listQuotes(
      $grpc.ServiceCall call, $0.ListQuotesRequest request);
  $async.Stream<$0.FilterQuotesResponse> filterQuotes(
      $grpc.ServiceCall call, $async.Stream<$0.FilterQuotesRequest> request);
  $async.Future<$0.FavoriteQuotesResponse> favoriteQuotes(
      $grpc.ServiceCall call, $async.Stream<$0.Quote> request);
}
