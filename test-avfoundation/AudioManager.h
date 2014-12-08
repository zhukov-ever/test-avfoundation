//
//  AudioManager.h
//  test-avfoundation
//
//  Created by Zhn on 8/12/2014.
//  Copyright (c) 2014 Zhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioManager : NSObject

+(AudioManager*)shared;

-(BOOL)isAudioFileExists;

-(void)startRecording;
-(void)pauseRecording;
-(void)stopRecording;

-(void)startPlaying;
-(void)pausePlaying;

@end
