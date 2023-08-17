///
//  Generated code. Do not modify.
//  source: quote_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use quoteDescriptor instead')
const Quote$json = const {
  '1': 'Quote',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'author', '3': 3, '4': 1, '5': 9, '10': 'author'},
  ],
};

/// Descriptor for `Quote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List quoteDescriptor = $convert.base64Decode('CgVRdW90ZRIOCgJpZBgBIAEoCVICaWQSEgoEdGV4dBgCIAEoCVIEdGV4dBIWCgZhdXRob3IYAyABKAlSBmF1dGhvcg==');
@$core.Deprecated('Use getQuoteRequestDescriptor instead')
const GetQuoteRequest$json = const {
  '1': 'GetQuoteRequest',
};

/// Descriptor for `GetQuoteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getQuoteRequestDescriptor = $convert.base64Decode('Cg9HZXRRdW90ZVJlcXVlc3Q=');
@$core.Deprecated('Use streamQuotesRequestDescriptor instead')
const StreamQuotesRequest$json = const {
  '1': 'StreamQuotesRequest',
  '2': const [
    const {'1': 'streamIntervalInSeconds', '3': 1, '4': 1, '5': 5, '10': 'streamIntervalInSeconds'},
  ],
};

/// Descriptor for `StreamQuotesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamQuotesRequestDescriptor = $convert.base64Decode('ChNTdHJlYW1RdW90ZXNSZXF1ZXN0EjgKF3N0cmVhbUludGVydmFsSW5TZWNvbmRzGAEgASgFUhdzdHJlYW1JbnRlcnZhbEluU2Vjb25kcw==');
@$core.Deprecated('Use listQuotesRequestDescriptor instead')
const ListQuotesRequest$json = const {
  '1': 'ListQuotesRequest',
  '2': const [
    const {'1': 'number_of_quotes', '3': 1, '4': 1, '5': 5, '10': 'numberOfQuotes'},
  ],
};

/// Descriptor for `ListQuotesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listQuotesRequestDescriptor = $convert.base64Decode('ChFMaXN0UXVvdGVzUmVxdWVzdBIoChBudW1iZXJfb2ZfcXVvdGVzGAEgASgFUg5udW1iZXJPZlF1b3Rlcw==');
@$core.Deprecated('Use listQuotesResponseDescriptor instead')
const ListQuotesResponse$json = const {
  '1': 'ListQuotesResponse',
  '2': const [
    const {'1': 'quotes', '3': 1, '4': 3, '5': 11, '6': '.quotes.Quote', '10': 'quotes'},
  ],
};

/// Descriptor for `ListQuotesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listQuotesResponseDescriptor = $convert.base64Decode('ChJMaXN0UXVvdGVzUmVzcG9uc2USJQoGcXVvdGVzGAEgAygLMg0ucXVvdGVzLlF1b3RlUgZxdW90ZXM=');
@$core.Deprecated('Use filterQuotesRequestDescriptor instead')
const FilterQuotesRequest$json = const {
  '1': 'FilterQuotesRequest',
  '2': const [
    const {'1': 'keyword', '3': 1, '4': 1, '5': 9, '10': 'keyword'},
  ],
};

/// Descriptor for `FilterQuotesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterQuotesRequestDescriptor = $convert.base64Decode('ChNGaWx0ZXJRdW90ZXNSZXF1ZXN0EhgKB2tleXdvcmQYASABKAlSB2tleXdvcmQ=');
@$core.Deprecated('Use filterQuotesResponseDescriptor instead')
const FilterQuotesResponse$json = const {
  '1': 'FilterQuotesResponse',
  '2': const [
    const {'1': 'quotes', '3': 1, '4': 3, '5': 11, '6': '.quotes.Quote', '10': 'quotes'},
  ],
};

/// Descriptor for `FilterQuotesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterQuotesResponseDescriptor = $convert.base64Decode('ChRGaWx0ZXJRdW90ZXNSZXNwb25zZRIlCgZxdW90ZXMYASADKAsyDS5xdW90ZXMuUXVvdGVSBnF1b3Rlcw==');
