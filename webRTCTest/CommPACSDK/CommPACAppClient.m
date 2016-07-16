//
//  CommPACAppClient.m
//  webRTCTest
//
//  Created by Kalan Nawarathne on 16/7/16.
//  Copyright © 2016 CommPAC. All rights reserved.
//

#import "CommPACAppClient.h"
#import <libjingle_peerconnection/RTCPeerConnection.h>
#import <libjingle_peerconnection/RTCPeerConnectionDelegate.h>
#import <libjingle_peerconnection/RTCPeerConnectionFactory.h>
#import <libjingle_peerconnection/RTCSessionDescriptionDelegate.h>

static NSString *kCommPACRoomServerHostUrl =
@"http://54.186.253.62:8080";

@interface CommPACAppClient () <RTCDataChannelDelegate,RTCPeerConnectionDelegate,RTCSessionDescriptionDelegate>

@property(nonatomic, strong) RTCPeerConnection *peerConnection;
@property(nonatomic, strong) RTCDataChannel *dataChannel;
@property(nonatomic, strong) RTCPeerConnectionFactory *factory;
@property(nonatomic, strong) NSMutableArray *messageQueue;

@property(nonatomic, strong) NSMutableArray *iceServers;
@end
@implementation CommPACAppClient

@synthesize delegate = _delegate;
@synthesize state = _state;
@synthesize serverHostUrl = _serverHostUrl;
@synthesize peerConnection = _peerConnection;
@synthesize dataChannel = _dataChannel;
@synthesize factory = _factory;
@synthesize messageQueue = _messageQueue;

@synthesize iceServers = _iceServers;

- (instancetype)initWithDelegate:(id<CommPACAppClientDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _factory = [[RTCPeerConnectionFactory alloc] init];
        _messageQueue = [NSMutableArray array];
        _iceServers = [NSMutableArray arrayWithObject:[self defaultSTUNServer]];
        _serverHostUrl = kCommPACRoomServerHostUrl;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(orientationChanged:)
                                                     name:@"UIDeviceOrientationDidChangeNotification"
                                                   object:nil];
    }
    return self;
}

#pragma mark RTCDataChannelDelegate
// Called when the data channel state has changed.
- (void)channelDidChangeState:(RTCDataChannel*)channel {
    
}

// Called when a data buffer was successfully received.
- (void)channel:(RTCDataChannel*)channel
didReceiveMessageWithBuffer:(RTCDataBuffer*)buffer {
    
}

#pragma mark RTCPeerConnectionDelegate
// Triggered when the SignalingState changed.
- (void)peerConnection:(RTCPeerConnection *)peerConnection
 signalingStateChanged:(RTCSignalingState)stateChanged {
    
}

// Triggered when media is received on a new stream from remote peer.
- (void)peerConnection:(RTCPeerConnection *)peerConnection
           addedStream:(RTCMediaStream *)stream {
    
}

// Triggered when a remote peer close a stream.
- (void)peerConnection:(RTCPeerConnection *)peerConnection
         removedStream:(RTCMediaStream *)stream {
    
}

// Triggered when renegotiation is needed, for example the ICE has restarted.
- (void)peerConnectionOnRenegotiationNeeded:(RTCPeerConnection *)peerConnection {
    
}

// Called any time the ICEConnectionState changes.
- (void)peerConnection:(RTCPeerConnection *)peerConnection
  iceConnectionChanged:(RTCICEConnectionState)newState {
    
}

// Called any time the ICEGatheringState changes.
- (void)peerConnection:(RTCPeerConnection *)peerConnection
   iceGatheringChanged:(RTCICEGatheringState)newState {
    
}

// New Ice candidate have been found.
- (void)peerConnection:(RTCPeerConnection *)peerConnection
       gotICECandidate:(RTCICECandidate *)candidate {
    
}

// New data channel has been opened.
- (void)peerConnection:(RTCPeerConnection*)peerConnection
    didOpenDataChannel:(RTCDataChannel*)dataChannel {
    
}

#pragma mark RTCSessionDescriptionDelegate
// Called when creating a session.
- (void)peerConnection:(RTCPeerConnection *)peerConnection
didCreateSessionDescription:(RTCSessionDescription *)sdp
                 error:(NSError *)error {
    
}

// Called when setting a local or remote description.
- (void)peerConnection:(RTCPeerConnection *)peerConnection
didSetSessionDescriptionWithError:(NSError *)error {
    
}
@end
