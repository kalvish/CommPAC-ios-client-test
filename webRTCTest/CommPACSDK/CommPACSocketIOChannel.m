//
//  CommPACSocketIOChannel.m
//  webRTCTest
//
//  Created by Kalan Nawarathne on 17/7/16.
//  Copyright © 2016 ganuka. All rights reserved.
//

#import "CommPACSocketIOChannel.h"

@implementation CommPACSocketIOChannel {
    NSURL *_url;
    
}

- (instancetype)initWithURL:(NSURL *)url
                    restURL:(NSURL *)restURL
                   delegate:(id<ARDWebSocketChannelDelegate>)delegate {
    if (self = [super init]) {
        _url = url;
        _restURL = restURL;
        _delegate = delegate;
        _socket = [[SRWebSocket alloc] initWithURL:url];
        _socket.delegate = self;
        NSLog(@"Opening WebSocket.");
        [_socket open];
    }
    return self;
}

@end
