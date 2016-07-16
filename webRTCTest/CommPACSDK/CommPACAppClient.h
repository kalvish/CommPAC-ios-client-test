//
//  CommPACAppClient.h
//  webRTCTest
//
//  Created by Kalan Nawarathne on 16/7/16.
//  Copyright © 2016 CommPAC. All rights reserved.
//

//CommPACAppClient

#import <Foundation/Foundation.h>
#import <libjingle_peerconnection/RTCDataChannel.h>

typedef NS_ENUM(NSInteger, CommPACAppClientState) {
    // Disconnected from servers.
    kCommPACAppClientStateDisconnected,
    // Connecting to servers.
    kCommPACAppClientStateConnecting,
    // Connected to servers.
    kCommPACAppClientStateConnected,
};

@class CommPACAppClient;
@protocol CommPACAppClientDelegate <NSObject>

- (void)appClient:(CommPACAppClient *)client
   didChangeState:(CommPACAppClientState)state;

- (void)appClient:(CommPACAppClient *)client
   rtcDataChannel:(RTCDataChannel *)rtcDC
didReceiveRCTDataBufer:(RTCDataBuffer *)rtcDataBuffer;

- (void)appClient:(CommPACAppClient *)client
         didError:(NSError *)error;

@end

@interface CommPACAppClient : NSObject

@property(nonatomic, readonly) CommPACAppClientState state;
@property(nonatomic, weak) id<CommPACAppClientDelegate> delegate;
@property(nonatomic, strong) NSString *serverHostUrl;

- (instancetype)initWithDelegate:(id<CommPACAppClientDelegate>)delegate;

@end
