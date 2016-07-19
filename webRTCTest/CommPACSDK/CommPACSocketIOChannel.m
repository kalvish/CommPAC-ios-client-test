//
//  CommPACSocketIOChannel.m
//  webRTCTest
//
//  Created by Kalan Nawarathne on 17/7/16.
//  Copyright © 2016 ganuka. All rights reserved.
//

#import "CommPACSocketIOChannel.h"
#import "webRTCTest-swift.h"

// TODO: move these to a configuration object.
static NSString const *kARDWSSMessageErrorKey = @"error";
static NSString const *kARDWSSMessagePayloadKey = @"msg";

@interface CommPACSocketIOChannel ()
@end

@implementation CommPACSocketIOChannel {
    NSURL *_url;
    
}

@synthesize delegate = _delegate;
@synthesize state = _state;
@synthesize roomId = _roomId;
@synthesize clientId = _clientId;

- (instancetype)initWithURL:(NSURL *)url
                    restURL:(NSURL *)restURL
                   delegate:(id<CommPACSocketIOChannelDelegate>)delegate {
    if (self = [super init]) {
        _url = url;
        _delegate = delegate;
        //_socket = [[SRWebSocket alloc] initWithURL:url];
        //_socket.delegate = self;
        //NSLog(@"Opening WebSocket.");
        //[_socket open];
        
        NSURL* url = [[NSURL alloc] initWithString:@"http://localhost:8080"];
        SocketIOClient* socket = [[SocketIOClient alloc] initWithSocketURL:url options:@{@"log": @YES, @"forcePolling": @YES}];

    }
    return self;
}

@end
