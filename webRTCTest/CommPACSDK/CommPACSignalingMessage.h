//
//  CommPACSignalingMessage.h
//  webRTCTest
//
//  Created by Kalan Nawarathne on 19/7/16.
//  Copyright © 2016 ganuka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <libjingle_peerconnection/RTCICECandidate.h>
#import <libjingle_peerconnection/RTCSessionDescription.h>

typedef enum {
    kCommPACSignalingMessageTypeCandidate,
    kCommPACSignalingMessageTypeOffer,
    kCommPACSignalingMessageTypeAnswer,
    kCommPACSignalingMessageTypeBye,
} CommPACSignalingMessageType;

@interface CommPACSignalingMessage : NSObject

@property(nonatomic, readonly) CommPACSignalingMessageType type;

+ (CommPACSignalingMessage *)messageFromJSONString:(NSString *)jsonString;
- (NSData *)JSONData;

@end

@interface CommPACICECandidateMessage : CommPACSignalingMessage

@property(nonatomic, readonly) RTCICECandidate *candidate;

- (instancetype)initWithCandidate:(RTCICECandidate *)candidate;

@end

@interface CommPACSessionDescriptionMessage : CommPACSignalingMessage

@property(nonatomic, readonly) RTCSessionDescription *sessionDescription;

- (instancetype)initWithDescription:(RTCSessionDescription *)description;

@end

@interface CommPACByeMessage : CommPACSignalingMessage
@end