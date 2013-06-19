//
//  MTSAudioManager.m
//  MessageToSanta
//
//  Created by Admin on 6/19/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "MTSAudioManager.h"
#import <AVFoundation/AVFoundation.h>

@implementation MTSAudioManager
+ (MTSAudioManager *) sharedAudioManager {
    static dispatch_once_t pred;
    static MTSAudioManager *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[MTSAudioManager alloc] init];
    });
    
    return shared;
}

- (void) putOnSounds {
    
}

- (void) startPlayingBackgroundMusic {
    NSError *activationError = nil;
    if ([[AVAudioSession sharedInstance] isInputAvailable]) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"jingle" ofType:@"mp3"];
        AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
        audioPlayer.numberOfLoops = -1;
        [audioPlayer play];
    }
}

- (void) stopPlayingBackgroundMusic {
    
}

@end
