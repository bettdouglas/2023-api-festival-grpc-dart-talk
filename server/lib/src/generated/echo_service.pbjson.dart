///
//  Generated code. Do not modify.
//  source: echo_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use echoRequestDescriptor instead')
const EchoRequest$json = const {
  '1': 'EchoRequest',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'extra_times', '3': 2, '4': 1, '5': 13, '10': 'extraTimes'},
  ],
};

/// Descriptor for `EchoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List echoRequestDescriptor = $convert.base64Decode('CgtFY2hvUmVxdWVzdBIUCgV2YWx1ZRgBIAEoCVIFdmFsdWUSHwoLZXh0cmFfdGltZXMYAiABKA1SCmV4dHJhVGltZXM=');
@$core.Deprecated('Use echoResponseDescriptor instead')
const EchoResponse$json = const {
  '1': 'EchoResponse',
  '2': const [
    const {'1': 'values', '3': 1, '4': 3, '5': 9, '10': 'values'},
  ],
};

/// Descriptor for `EchoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List echoResponseDescriptor = $convert.base64Decode('CgxFY2hvUmVzcG9uc2USFgoGdmFsdWVzGAEgAygJUgZ2YWx1ZXM=');
@$core.Deprecated('Use echoStreamResponseDescriptor instead')
const EchoStreamResponse$json = const {
  '1': 'EchoStreamResponse',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `EchoStreamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List echoStreamResponseDescriptor = $convert.base64Decode('ChJFY2hvU3RyZWFtUmVzcG9uc2USFAoFdmFsdWUYASABKAlSBXZhbHVl');
