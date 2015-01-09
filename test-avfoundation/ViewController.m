//
//  ViewController.m
//  test-avfoundation
//
//  Created by Zhn on 8/12/2014.
//  Copyright (c) 2014 Zhn. All rights reserved.
//

#import "ViewController.h"
#import "AudioManager.h"

@interface ViewController ()
{
    NSTimer* m_playerTimer;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishPlayingHandler:) name:FINISH_PLAYING object:nil];
    
}

- (void) finishPlayingHandler:(id)sender
{
    [self stopPlayingHandler:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startPauseRecordingHandler:(id)sender {
    self.buttonStartPauseRecording.selected = !self.buttonStartPauseRecording.selected;
    self.buttonStopRecording.enabled = YES;
    
    if (self.buttonStartPauseRecording.selected)
    {
        self.slider.userInteractionEnabled = NO;
        [[AudioManager shared] startRecording];
    }
    else
    {
        self.slider.userInteractionEnabled = YES;
        [[AudioManager shared] pauseRecording];
    }
    
    self.cellPlayer.userInteractionEnabled = NO;
    self.cellPlayer.contentView.backgroundColor = [UIColor lightGrayColor];
}

- (IBAction)stopRecordingHandler:(id)sender
{
    self.buttonStartPauseRecording.selected = NO;
    self.buttonStopRecording.enabled = NO;
    self.slider.userInteractionEnabled = YES;
    
    [[AudioManager shared] stopRecording];
    
    self.cellPlayer.userInteractionEnabled = YES;
    self.cellPlayer.contentView.backgroundColor = [UIColor whiteColor];
    
}


- (void)updateTime:(NSTimer *)timer
{
    self.slider.value = [[AudioManager shared] currentTime] / [[AudioManager shared] duration];
}

- (IBAction)startPausePlayingHandler:(id)sender
{
    self.buttonStartPausePlaying.selected = !self.buttonStartPausePlaying.selected;
    self.buttonStopPlaying.enabled = YES;
    
    if (self.buttonStartPausePlaying.selected)
    {
        [[AudioManager shared] startPlaying];
        
        m_playerTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
        
    }
    else
    {
        [[AudioManager shared] pausePlaying];
        
        [m_playerTimer invalidate];
    }
    
    self.cellRecorder.userInteractionEnabled = NO;
    self.cellRecorder.contentView.backgroundColor = [UIColor lightGrayColor];
    
}

- (IBAction)stopPlayingHandler:(id)sender
{
    self.buttonStartPausePlaying.selected = NO;
    self.buttonStopPlaying.enabled = NO;
    
    [[AudioManager shared] stopPlaying];
    
    self.cellRecorder.userInteractionEnabled = YES;
    self.cellRecorder.contentView.backgroundColor = [UIColor whiteColor];
    
    [m_playerTimer invalidate];
    
    self.slider.value = 0;
    [self.slider.layer removeAllAnimations];
}

- (IBAction)sliderValueChangeHandler:(id)sender
{
    [[AudioManager shared] setCurrentTime:self.slider.value * [[AudioManager shared] duration]];
}

@end
