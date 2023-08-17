///
//  Generated code. Do not modify.
//  source: event_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createEventRequestDescriptor instead')
const CreateEventRequest$json = const {
  '1': 'CreateEventRequest',
  '2': const [
    const {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.events.Event', '10': 'event'},
  ],
};

/// Descriptor for `CreateEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createEventRequestDescriptor = $convert.base64Decode('ChJDcmVhdGVFdmVudFJlcXVlc3QSIwoFZXZlbnQYASABKAsyDS5ldmVudHMuRXZlbnRSBWV2ZW50');
@$core.Deprecated('Use getEventRequestDescriptor instead')
const GetEventRequest$json = const {
  '1': 'GetEventRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `GetEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEventRequestDescriptor = $convert.base64Decode('Cg9HZXRFdmVudFJlcXVlc3QSDgoCaWQYASABKAVSAmlk');
@$core.Deprecated('Use eventDescriptor instead')
const Event$json = const {
  '1': 'Event',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'location', '3': 4, '4': 1, '5': 9, '10': 'location'},
    const {'1': 'time', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'time'},
    const {'1': 'image', '3': 7, '4': 1, '5': 9, '10': 'image'},
    const {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `Event`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventDescriptor = $convert.base64Decode('CgVFdmVudBIOCgJpZBgBIAEoBVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIaCghsb2NhdGlvbhgEIAEoCVIIbG9jYXRpb24SLgoEdGltZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBHRpbWUSFAoFaW1hZ2UYByABKAlSBWltYWdlEjkKCmNyZWF0ZWRfYXQYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQ=');
@$core.Deprecated('Use listEventsRequestDescriptor instead')
const ListEventsRequest$json = const {
  '1': 'ListEventsRequest',
  '2': const [
    const {'1': 'page_token', '3': 1, '4': 1, '5': 9, '10': 'pageToken'},
    const {'1': 'page_size', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
  ],
};

/// Descriptor for `ListEventsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEventsRequestDescriptor = $convert.base64Decode('ChFMaXN0RXZlbnRzUmVxdWVzdBIdCgpwYWdlX3Rva2VuGAEgASgJUglwYWdlVG9rZW4SGwoJcGFnZV9zaXplGAIgASgFUghwYWdlU2l6ZQ==');
@$core.Deprecated('Use listEventsResponseDescriptor instead')
const ListEventsResponse$json = const {
  '1': 'ListEventsResponse',
  '2': const [
    const {'1': 'events', '3': 1, '4': 3, '5': 11, '6': '.events.Event', '10': 'events'},
    const {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListEventsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEventsResponseDescriptor = $convert.base64Decode('ChJMaXN0RXZlbnRzUmVzcG9uc2USJQoGZXZlbnRzGAEgAygLMg0uZXZlbnRzLkV2ZW50UgZldmVudHMSJgoPbmV4dF9wYWdlX3Rva2VuGAIgASgJUg1uZXh0UGFnZVRva2Vu');
@$core.Deprecated('Use streamEventsRequestDescriptor instead')
const StreamEventsRequest$json = const {
  '1': 'StreamEventsRequest',
  '2': const [
    const {'1': 'page_token', '3': 1, '4': 1, '5': 9, '10': 'pageToken'},
    const {'1': 'page_size', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
  ],
};

/// Descriptor for `StreamEventsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamEventsRequestDescriptor = $convert.base64Decode('ChNTdHJlYW1FdmVudHNSZXF1ZXN0Eh0KCnBhZ2VfdG9rZW4YASABKAlSCXBhZ2VUb2tlbhIbCglwYWdlX3NpemUYAiABKAVSCHBhZ2VTaXpl');
@$core.Deprecated('Use streamEventsResponseDescriptor instead')
const StreamEventsResponse$json = const {
  '1': 'StreamEventsResponse',
  '2': const [
    const {'1': 'events', '3': 1, '4': 3, '5': 11, '6': '.events.Event', '10': 'events'},
  ],
};

/// Descriptor for `StreamEventsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamEventsResponseDescriptor = $convert.base64Decode('ChRTdHJlYW1FdmVudHNSZXNwb25zZRIlCgZldmVudHMYASADKAsyDS5ldmVudHMuRXZlbnRSBmV2ZW50cw==');
@$core.Deprecated('Use deleteEventRequestDescriptor instead')
const DeleteEventRequest$json = const {
  '1': 'DeleteEventRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `DeleteEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteEventRequestDescriptor = $convert.base64Decode('ChJEZWxldGVFdmVudFJlcXVlc3QSDgoCaWQYASABKAVSAmlk');
@$core.Deprecated('Use deleteEventResponseDescriptor instead')
const DeleteEventResponse$json = const {
  '1': 'DeleteEventResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `DeleteEventResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteEventResponseDescriptor = $convert.base64Decode('ChNEZWxldGVFdmVudFJlc3BvbnNlEg4KAmlkGAEgASgFUgJpZA==');
