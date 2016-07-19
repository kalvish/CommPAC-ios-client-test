//
//  CommPACSocketIOChannel.h
//  webRTCTest
//
//  Created by Kalan Nawarathne on 17/7/16.
//  Copyright © 2016 ganuka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommPACSignalingMessage.h"

typedef NS_ENUM(NSInteger, CommPACSocketIOChannelState) {
    // State when disconnected.
    kCommPACSocketIOChannelStateClosed,
    // State when connection is established but not ready for use.
    kCommPACSocketIOChannelStateOpen,
    // State when connection is established and registered.
    kCommPACSocketIOChannelStateRegistered,
    // State when connection encounters a fatal error.
    kCommPACSocketIOChannelStateError
};

@class CommPACSocketIOChannel;

@protocol CommPACSocketIOChannelDelegate <NSObject>

- (void)channel:(CommPACSocketIOChannel *)channel
 didChangeState:(CommPACSocketIOChannelState)state;

- (void)channel:(CommPACSocketIOChannel *)channel
didReceiveMessage:(CommPACSignalingMessage *)message;

@end

@interface CommPACSocketIOChannel : NSObject

@property(nonatomic, readonly) NSString *roomId;
@property(nonatomic, readonly) NSString *clientId;
@property(nonatomic, readonly) CommPACSocketIOChannelState state;
@property(nonatomic, weak) id<CommPACSocketIOChannelDelegate> delegate;

- (instancetype)initWithURL:(NSURL *)url
                    restURL:(NSURL *)restURL
                   delegate:(id<CommPACSocketIOChannelDelegate>)delegate;

// Registers with the WebSocket server for the given room and client id once
// the web socket connection is open.
- (void)registerForRoomId:(NSString *)roomId
                 clientId:(NSString *)clientId;

// Sends data over the WebSocket connection if registered, otherwise POSTs to
// the web socket server instead.
- (void)sendData:(NSData *)data;

@end
