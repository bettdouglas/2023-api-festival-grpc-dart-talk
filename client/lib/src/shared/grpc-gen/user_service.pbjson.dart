///
//  Generated code. Do not modify.
//  source: user_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'created_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEjkKCmNyZWF0ZWRfYXQYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQ=');
@$core.Deprecated('Use listUsersRequestDescriptor instead')
const ListUsersRequest$json = const {
  '1': 'ListUsersRequest',
  '2': const [
    const {'1': 'parent', '3': 1, '4': 1, '5': 9, '10': 'parent'},
    const {'1': 'page_size', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
    const {'1': 'page_token', '3': 3, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersRequestDescriptor = $convert.base64Decode('ChBMaXN0VXNlcnNSZXF1ZXN0EhYKBnBhcmVudBgBIAEoCVIGcGFyZW50EhsKCXBhZ2Vfc2l6ZRgCIAEoBVIIcGFnZVNpemUSHQoKcGFnZV90b2tlbhgDIAEoCVIJcGFnZVRva2Vu');
@$core.Deprecated('Use listUsersResponseDescriptor instead')
const ListUsersResponse$json = const {
  '1': 'ListUsersResponse',
  '2': const [
    const {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.events.User', '10': 'users'},
    const {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersResponseDescriptor = $convert.base64Decode('ChFMaXN0VXNlcnNSZXNwb25zZRIiCgV1c2VycxgBIAMoCzIMLmV2ZW50cy5Vc2VyUgV1c2VycxImCg9uZXh0X3BhZ2VfdG9rZW4YAiABKAlSDW5leHRQYWdlVG9rZW4=');
@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = const {
  '1': 'GetUserRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode('Cg5HZXRVc2VyUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQ=');
@$core.Deprecated('Use createUserRequestDescriptor instead')
const CreateUserRequest$json = const {
  '1': 'CreateUserRequest',
  '2': const [
    const {'1': 'parent', '3': 1, '4': 1, '5': 9, '10': 'parent'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'user', '3': 3, '4': 1, '5': 11, '6': '.events.User', '10': 'user'},
  ],
};

/// Descriptor for `CreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVVc2VyUmVxdWVzdBIWCgZwYXJlbnQYASABKAlSBnBhcmVudBIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySWQSIAoEdXNlchgDIAEoCzIMLmV2ZW50cy5Vc2VyUgR1c2Vy');
@$core.Deprecated('Use updateUserRequestDescriptor instead')
const UpdateUserRequest$json = const {
  '1': 'UpdateUserRequest',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.events.User', '10': 'user'},
    const {'1': 'update_mask', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'updateMask'},
  ],
};

/// Descriptor for `UpdateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRequestDescriptor = $convert.base64Decode('ChFVcGRhdGVVc2VyUmVxdWVzdBIgCgR1c2VyGAEgASgLMgwuZXZlbnRzLlVzZXJSBHVzZXISOwoLdXBkYXRlX21hc2sYAiABKAsyGi5nb29nbGUucHJvdG9idWYuRmllbGRNYXNrUgp1cGRhdGVNYXNr');
@$core.Deprecated('Use deleteUserRequestDescriptor instead')
const DeleteUserRequest$json = const {
  '1': 'DeleteUserRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `DeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserRequestDescriptor = $convert.base64Decode('ChFEZWxldGVVc2VyUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQ=');
@$core.Deprecated('Use streamUserRequestDescriptor instead')
const StreamUserRequest$json = const {
  '1': 'StreamUserRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `StreamUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamUserRequestDescriptor = $convert.base64Decode('ChFTdHJlYW1Vc2VyUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQ=');
@$core.Deprecated('Use streamUserResponseDescriptor instead')
const StreamUserResponse$json = const {
  '1': 'StreamUserResponse',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.events.User', '10': 'user'},
  ],
};

/// Descriptor for `StreamUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamUserResponseDescriptor = $convert.base64Decode('ChJTdHJlYW1Vc2VyUmVzcG9uc2USIAoEdXNlchgBIAEoCzIMLmV2ZW50cy5Vc2VyUgR1c2Vy');
@$core.Deprecated('Use streamUsersRequestDescriptor instead')
const StreamUsersRequest$json = const {
  '1': 'StreamUsersRequest',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 5, '10': 'ids'},
  ],
};

/// Descriptor for `StreamUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamUsersRequestDescriptor = $convert.base64Decode('ChJTdHJlYW1Vc2Vyc1JlcXVlc3QSEAoDaWRzGAEgAygFUgNpZHM=');
@$core.Deprecated('Use streamUsersResponseDescriptor instead')
const StreamUsersResponse$json = const {
  '1': 'StreamUsersResponse',
  '2': const [
    const {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.events.User', '10': 'users'},
  ],
};

/// Descriptor for `StreamUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamUsersResponseDescriptor = $convert.base64Decode('ChNTdHJlYW1Vc2Vyc1Jlc3BvbnNlEiIKBXVzZXJzGAEgAygLMgwuZXZlbnRzLlVzZXJSBXVzZXJz');
