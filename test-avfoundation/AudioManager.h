//
//  AudioManager.h
//  test-avfoundation
//
//  Created by Zhn on 8/12/2014.
//  Copyright (c) 2014 Zhn. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* FINISH_PLAYING=@"FINISH_PLAYING";

@interface AudioManager : NSObject

+(AudioManager*)shared;

-(BOOL)isAudioFileExists;
@property (nonatomic, readonly) float duration;
@property (nonatomic) float currentTime;

-(void)startRecording;
-(void)pauseRecording;
-(void)stopRecording;

-(void)startPlaying;
-(void)pausePlaying;
-(void)stopPlaying;

@end
