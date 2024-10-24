// Code generated by gRPC proto compiler.  DO NOT EDIT!
// source: trackNotify.proto

#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import "TrackNotify.pbrpc.h"
#import "TrackNotify.pbobjc.h"
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriter+Immediate.h>

#if defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS) && GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
#import <Protobuf/GPBEmpty.pbobjc.h>
#else
#import "GPBEmpty.pbobjc.h"
#endif

@implementation TRKTrackNotify

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

// Designated initializer
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [super initWithHost:host
                 packageName:@"track"
                 serviceName:@"TrackNotify"
                 callOptions:callOptions];
}

- (instancetype)initWithHost:(NSString *)host {
  return [super initWithHost:host
                 packageName:@"track"
                 serviceName:@"TrackNotify"];
}

#pragma clang diagnostic pop

// Override superclass initializer to disallow different package and service names.
- (instancetype)initWithHost:(NSString *)host
                 packageName:(NSString *)packageName
                 serviceName:(NSString *)serviceName {
  return [self initWithHost:host];
}

- (instancetype)initWithHost:(NSString *)host
                 packageName:(NSString *)packageName
                 serviceName:(NSString *)serviceName
                 callOptions:(GRPCCallOptions *)callOptions {
  return [self initWithHost:host callOptions:callOptions];
}

#pragma mark - Class Methods

+ (instancetype)serviceWithHost:(NSString *)host {
  return [[self alloc] initWithHost:host];
}

+ (instancetype)serviceWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [[self alloc] initWithHost:host callOptions:callOptions];
}

#pragma mark - Method Implementations

#pragma mark NotifyCurrentTrack(TrackDetails) returns (Empty)

- (void)notifyCurrentTrackWithRequest:(TRKTrackDetails *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToNotifyCurrentTrackWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
- (GRPCProtoCall *)RPCToNotifyCurrentTrackWithRequest:(TRKTrackDetails *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"NotifyCurrentTrack"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[GPBEmpty class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
- (GRPCUnaryProtoCall *)notifyCurrentTrackWithMessage:(TRKTrackDetails *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"NotifyCurrentTrack"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[GPBEmpty class]];
}

#pragma mark PlayerStateNotifier(Empty) returns (stream TrackState)

- (void)playerStateNotifierWithRequest:(GPBEmpty *)request eventHandler:(void(^)(BOOL done, TRKTrackState *_Nullable response, NSError *_Nullable error))eventHandler{
  [[self RPCToPlayerStateNotifierWithRequest:request eventHandler:eventHandler] start];
}
// Returns a not-yet-started RPC object.
- (GRPCProtoCall *)RPCToPlayerStateNotifierWithRequest:(GPBEmpty *)request eventHandler:(void(^)(BOOL done, TRKTrackState *_Nullable response, NSError *_Nullable error))eventHandler{
  return [self RPCToMethod:@"PlayerStateNotifier"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[TRKTrackState class]
        responsesWriteable:[GRXWriteable writeableWithEventHandler:eventHandler]];
}
- (GRPCUnaryProtoCall *)playerStateNotifierWithMessage:(GPBEmpty *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"PlayerStateNotifier"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[TRKTrackState class]];
}

@end
#endif
