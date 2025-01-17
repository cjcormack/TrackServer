// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: trackNotify.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30004
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30004 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum TRKPlayerState

typedef GPB_ENUM(TRKPlayerState) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  TRKPlayerState_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  TRKPlayerState_Handshake = 0,
  TRKPlayerState_Ping = 1,
  TRKPlayerState_Playing = 2,
  TRKPlayerState_Paused = 3,
};

GPBEnumDescriptor *TRKPlayerState_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL TRKPlayerState_IsValidValue(int32_t value);

#pragma mark - TRKTrackNotifyRoot

/**
 * Exposes the extension registry for this file.
 *
 * The base class provides:
 * @code
 *   + (GPBExtensionRegistry *)extensionRegistry;
 * @endcode
 * which is a @c GPBExtensionRegistry that includes all the extensions defined by
 * this file and all files that it depends on.
 **/
GPB_FINAL @interface TRKTrackNotifyRoot : GPBRootObject
@end

#pragma mark - TRKTrackState

typedef GPB_ENUM(TRKTrackState_FieldNumber) {
  TRKTrackState_FieldNumber_PlayerState = 1,
};

GPB_FINAL @interface TRKTrackState : GPBMessage

@property(nonatomic, readwrite) TRKPlayerState playerState;

@end

/**
 * Fetches the raw value of a @c TRKTrackState's @c playerState property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t TRKTrackState_PlayerState_RawValue(TRKTrackState *message);
/**
 * Sets the raw value of an @c TRKTrackState's @c playerState property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetTRKTrackState_PlayerState_RawValue(TRKTrackState *message, int32_t value);

#pragma mark - TRKTrackDetails

typedef GPB_ENUM(TRKTrackDetails_FieldNumber) {
  TRKTrackDetails_FieldNumber_PlayerState = 1,
  TRKTrackDetails_FieldNumber_Title = 2,
  TRKTrackDetails_FieldNumber_Artist = 3,
};

GPB_FINAL @interface TRKTrackDetails : GPBMessage

@property(nonatomic, readwrite) TRKPlayerState playerState;

@property(nonatomic, readwrite, copy, null_resettable) NSString *title;

@property(nonatomic, readwrite, copy, null_resettable) NSString *artist;

@end

/**
 * Fetches the raw value of a @c TRKTrackDetails's @c playerState property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t TRKTrackDetails_PlayerState_RawValue(TRKTrackDetails *message);
/**
 * Sets the raw value of an @c TRKTrackDetails's @c playerState property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetTRKTrackDetails_PlayerState_RawValue(TRKTrackDetails *message, int32_t value);

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
