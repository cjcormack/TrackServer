// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: trackNotify.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import <stdatomic.h>

#import "TrackNotify.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - TRKTrackNotifyRoot

@implementation TRKTrackNotifyRoot

// No extensions in the file and none of the imports (direct or indirect)
// defined extensions, so no need to generate +extensionRegistry.

@end

#pragma mark - TRKTrackNotifyRoot_FileDescriptor

static GPBFileDescriptor *TRKTrackNotifyRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"track"
                                                 objcPrefix:@"TRK"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Enum TRKPlayerState

GPBEnumDescriptor *TRKPlayerState_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "Handshake\000Ping\000Playing\000Paused\000";
    static const int32_t values[] = {
        TRKPlayerState_Handshake,
        TRKPlayerState_Ping,
        TRKPlayerState_Playing,
        TRKPlayerState_Paused,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(TRKPlayerState)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:TRKPlayerState_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL TRKPlayerState_IsValidValue(int32_t value__) {
  switch (value__) {
    case TRKPlayerState_Handshake:
    case TRKPlayerState_Ping:
    case TRKPlayerState_Playing:
    case TRKPlayerState_Paused:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - TRKTrackState

@implementation TRKTrackState

@dynamic playerState;

typedef struct TRKTrackState__storage_ {
  uint32_t _has_storage_[1];
  TRKPlayerState playerState;
} TRKTrackState__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "playerState",
        .dataTypeSpecific.enumDescFunc = TRKPlayerState_EnumDescriptor,
        .number = TRKTrackState_FieldNumber_PlayerState,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(TRKTrackState__storage_, playerState),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldHasEnumDescriptor | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[TRKTrackState class]
                                     rootClass:[TRKTrackNotifyRoot class]
                                          file:TRKTrackNotifyRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(TRKTrackState__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\001\013\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t TRKTrackState_PlayerState_RawValue(TRKTrackState *message) {
  GPBDescriptor *descriptor = [TRKTrackState descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:TRKTrackState_FieldNumber_PlayerState];
  return GPBGetMessageRawEnumField(message, field);
}

void SetTRKTrackState_PlayerState_RawValue(TRKTrackState *message, int32_t value) {
  GPBDescriptor *descriptor = [TRKTrackState descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:TRKTrackState_FieldNumber_PlayerState];
  GPBSetMessageRawEnumField(message, field, value);
}

#pragma mark - TRKTrackDetails

@implementation TRKTrackDetails

@dynamic playerState;
@dynamic title;
@dynamic artist;

typedef struct TRKTrackDetails__storage_ {
  uint32_t _has_storage_[1];
  TRKPlayerState playerState;
  NSString *title;
  NSString *artist;
} TRKTrackDetails__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "playerState",
        .dataTypeSpecific.enumDescFunc = TRKPlayerState_EnumDescriptor,
        .number = TRKTrackDetails_FieldNumber_PlayerState,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(TRKTrackDetails__storage_, playerState),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldHasEnumDescriptor | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "title",
        .dataTypeSpecific.clazz = Nil,
        .number = TRKTrackDetails_FieldNumber_Title,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(TRKTrackDetails__storage_, title),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "artist",
        .dataTypeSpecific.clazz = Nil,
        .number = TRKTrackDetails_FieldNumber_Artist,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(TRKTrackDetails__storage_, artist),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[TRKTrackDetails class]
                                     rootClass:[TRKTrackNotifyRoot class]
                                          file:TRKTrackNotifyRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(TRKTrackDetails__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\001\013\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t TRKTrackDetails_PlayerState_RawValue(TRKTrackDetails *message) {
  GPBDescriptor *descriptor = [TRKTrackDetails descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:TRKTrackDetails_FieldNumber_PlayerState];
  return GPBGetMessageRawEnumField(message, field);
}

void SetTRKTrackDetails_PlayerState_RawValue(TRKTrackDetails *message, int32_t value) {
  GPBDescriptor *descriptor = [TRKTrackDetails descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:TRKTrackDetails_FieldNumber_PlayerState];
  GPBSetMessageRawEnumField(message, field, value);
}


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
