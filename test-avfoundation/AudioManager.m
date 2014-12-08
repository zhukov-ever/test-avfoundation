//
//  AudioManager.m
//  test-avfoundation
//
//  Created by Zhn on 8/12/2014.
//  Copyright (c) 2014 Zhn. All rights reserved.
//

#import "AudioManager.h"
#import <AVFoundation/AVFoundation.h>

@interface AudioManager() <AVAudioRecorderDelegate, AVAudioPlayerDelegate>
{
    AVAudioRecorder* m_recorder;
    AVAudioPlayer* m_player;
    AVAudioSession *m_session;
}

@end

@implementation AudioManager

static AudioManager* m_shared;
+(AudioManager*)shared
{
    if (!m_shared)
    {
        m_shared = [AudioManager new];
    }
    return m_shared;
}

-(instancetype)init
{
    if (self = [super init])
    {
        [self initSession];
        [self initRecorder];
    }
    return self;
}

-(BOOL)isAudioFileExists
{
    NSFileManager* _fm = [NSFileManager defaultManager];
    if ([_fm fileExistsAtPath:[self pathForFile]])
        return YES;
    return NO;
}


-(void)startRecording
{
    NSError* _error;
    [m_session setActive:YES error:&_error];
    [m_recorder record];
}

-(void)pauseRecording
{
    [m_recorder pause];
}

-(void)stopRecording
{
    [m_recorder stop];
    NSError* _error;
    [m_session setActive:NO error:&_error];
}

-(void)startPlaying
{
    if (!m_recorder.recording)
    {
        [self initPlayer];
        [m_player prepareToPlay];
        [m_player play];
    }
}

-(void)pausePlaying
{
    [m_player pause];
}



#pragma mark - private

- (void) initSession
{
    m_session = [AVAudioSession sharedInstance];
    NSError* _error;
    [m_session setCategory:AVAudioSessionCategoryPlayAndRecord error:&_error];
}

- (void) initRecorder
{
    NSMutableDictionary* _recordSetting = [[NSMutableDictionary alloc] init];
    
    [_recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [_recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [_recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    NSURL* _urlPath = [NSURL URLWithString:[self pathForFile]];
    NSLog(@"path for audio file: %@", [self pathForFile]);
    
    NSError* _error;
    m_recorder = [[AVAudioRecorder alloc] initWithURL:_urlPath settings:_recordSetting error:&_error];
    m_recorder.delegate = self;
    m_recorder.meteringEnabled = YES;
    [m_recorder prepareToRecord];
}

- (void) initPlayer
{
    NSError* _error;
    NSURL* _urlPath = [NSURL URLWithString:[self pathForFile]];
    m_player = [[AVAudioPlayer alloc] initWithContentsOfURL:_urlPath error:&_error];
    [m_player setDelegate:self];
}

- (NSString*)pathForFile
{
    NSString* _path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    return [[_path stringByAppendingPathComponent:@"audio_file"] stringByAppendingPathExtension:@"m4a"];
}


#pragma mark - AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"audioPlayerDidFinishPlaying");
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    NSLog(@"audioPlayerDecodeErrorDidOccur");
}



@end
