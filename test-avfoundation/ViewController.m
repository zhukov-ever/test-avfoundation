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

- (IBAction)startStopRecordingHandler:(id)sender {
    self.buttonStartPauseRecording.selected = !self.buttonStartPauseRecording.selected;
    self.buttonStopRecording.enabled = YES;
    
    if (self.buttonStartPauseRecording.selected)
    {
        [[AudioManager shared] startRecording];
    }
    else
    {
        [[AudioManager shared] pauseRecording];
    }
    
    self.cellPlayer.userInteractionEnabled = NO;
    self.cellPlayer.contentView.backgroundColor = [UIColor lightGrayColor];
}

- (IBAction)stopRecordingHandler:(id)sender
{
    self.buttonStartPauseRecording.selected = NO;
    self.buttonStopRecording.enabled = NO;
    
    [[AudioManager shared] stopRecording];
    
    self.cellPlayer.userInteractionEnabled = YES;
    self.cellPlayer.contentView.backgroundColor = [UIColor whiteColor];
}



- (IBAction)startStopPlayingHandler:(id)sender
{
    self.buttonStartPausePlaying.selected = !self.buttonStartPausePlaying.selected;
    self.buttonStopPlaying.enabled = YES;
    
    if (self.buttonStartPausePlaying.selected)
    {
        [[AudioManager shared] startPlaying];
    }
    else
    {
        [[AudioManager shared] pausePlaying];
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
}





@end
