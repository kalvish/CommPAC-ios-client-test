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

#import <AppRTC/RTCICEServer+JSON.h>

//static NSString *kCommPACRoomServerHostUrl =
//@"http://54.186.253.62:8080";

static NSString *kCommPACDefaultSTUNServerUrl =
@"stun:stun.l.google.com:19302";

static NSString *kCommPACTurnRequestUrl =
@"https://computeengineondemand.appspot.com"
@"/turn?username=iapprtc&key=4080218913";

@interface CommPACAppClient () <RTCDataChannelDelegate,RTCPeerConnectionDelegate,RTCSessionDescriptionDelegate>

@property(nonatomic, strong) RTCPeerConnection *peerConnection;
@property(nonatomic, strong) RTCDataChannel *dataChannel;
@property(nonatomic, strong) RTCPeerConnectionFactory *factory;
@property(nonatomic, strong) NSMutableArray *messageQueue;

@property(nonatomic, assign) BOOL isTurnComplete;
@property(nonatomic, assign) BOOL hasReceivedSdp;
//@property(nonatomic, readonly) BOOL isRegisteredWithRoomServer;

@property(nonatomic, strong) NSString *roomId;
@property(nonatomic, strong) NSString *clientId;
@property(nonatomic, assign) BOOL isInitiator;
@property(nonatomic, strong) NSMutableArray *iceServers;

@end
@implementation CommPACAppClient

@synthesize delegate = _delegate;
@synthesize state = _state;
//@synthesize serverHostUrl = _serverHostUrl;
@synthesize peerConnection = _peerConnection;
@synthesize dataChannel = _dataChannel;
@synthesize factory = _factory;
@synthesize messageQueue = _messageQueue;

@synthesize isTurnComplete = _isTurnComplete;
@synthesize hasReceivedSdp  = _hasReceivedSdp;
@synthesize roomId = _roomId;
@synthesize clientId = _clientId;
@synthesize isInitiator = _isInitiator;
@synthesize iceServers = _iceServers;

#pragma mark CommPACAppClient public methods
- (instancetype)initWithDelegate:(id<CommPACAppClientDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _factory = [[RTCPeerConnectionFactory alloc] init];
        _messageQueue = [NSMutableArray array];
        _iceServers = [NSMutableArray arrayWithObject:[self defaultSTUNServer]];
        //_serverHostUrl = kCommPACRoomServerHostUrl;
    }
    return self;
}

- (void)disconnect {
    if (_state == kCommPACAppClientStateDisconnected) {
        return;
    }
    //    if (self.isRegisteredWithRoomServer) {
    //        [self unregisterWithRoomServer];
    //    }
//    if (_channel) {
//        if (_channel.state == kARDWebSocketChannelStateRegistered) {
//            // Tell the other client we're hanging up.
//            ARDByeMessage *byeMessage = [[ARDByeMessage alloc] init];
//            NSData *byeData = [byeMessage JSONData];
//            [_channel sendData:byeData];
//        }
//        // Disconnect from collider.
//        _channel = nil;
//    }
    _clientId = nil;
    _roomId = nil;
    _isInitiator = NO;
    _hasReceivedSdp = NO;
    _messageQueue = [NSMutableArray array];
    _peerConnection = nil;
    self.state = kCommPACAppClientStateDisconnected;
}

- (void)connectToRoomWithId:(NSString *)roomId
                    options:(NSDictionary *)options {
    NSParameterAssert(roomId.length);
    NSParameterAssert(_state == kCommPACAppClientStateDisconnected);
    self.state = kCommPACAppClientStateConnecting;
    
    [self startSignalingIfReady];
}

#pragma mark CommPACAppClient private methods
- (void)dealloc {
    [self disconnect];
}

- (void)setState:(CommPACAppClientState)state {
    if (_state == state) {
        return;
    }
    _state = state;
    if(_delegate){
       [_delegate appClient:self didChangeState:_state];
    }
}

- (void)startSignalingIfReady {
   
//    self.state = kARDAppClientStateConnected;
//    
//    // Create peer connection.
//    RTCMediaConstraints *constraints = [self defaultPeerConnectionConstraints];
//    _peerConnection = [_factory peerConnectionWithICEServers:_iceServers
//                                                 constraints:constraints
//                                                    delegate:self];
//    //RTCMediaStream *localStream = [self createLocalMediaStream];
//    //[_peerConnection addStream:localStream];
//    if (_isInitiator) {
//        
//        //Create data channel
//        RTCDataChannelInit *initData = [[RTCDataChannelInit alloc] init];
//        _dataChannel = [_peerConnection createDataChannelWithLabel:@"BoardPACDataChannel" config:initData];
//        _dataChannel.delegate = self;
//        
//        [self sendOffer];
//    } else {
//        [self waitForAnswer];
//        
//        
//    }
}

#pragma mark socket methods
- (void)registerWithColliderIfReady {

    // Open SocketIO connection.
//    _channel =
//    [[ARDWebSocketChannel alloc] initWithURL:_websocketURL
//                                     restURL:_websocketRestURL
//                                    delegate:self];
//    [_channel registerForRoomId:_roomId clientId:_clientId];
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

#pragma mark Defaults
- (RTCICEServer *)defaultSTUNServer {
    NSURL *defaultSTUNServerURL = [NSURL URLWithString:kCommPACDefaultSTUNServerUrl];
    return [[RTCICEServer alloc] initWithURI:defaultSTUNServerURL
                                    username:@""
                                    password:@""];
}

@end
