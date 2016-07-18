//
//  CommPACSocketIOChannel.h
//  webRTCTest
//
//  Created by Kalan Nawarathne on 17/7/16.
//  Copyright © 2016 ganuka. All rights reserved.
//

#import <Foundation/Foundation.h>

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

- (void)channel:(ARDWebSocketChannel *)channel
 didChangeState:(ARDWebSocketChannelState)state;

- (void)channel:(ARDWebSocketChannel *)channel
didReceiveMessage:(ARDSignalingMessage *)message;

@end

@end
@interface CommPACSocketIOChannel : NSObject

@end
