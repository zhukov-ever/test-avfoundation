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

- (void)viewDidLoad {
    [super viewDidLoad];
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
}

- (IBAction)stopRecordingHandler:(id)sender
{
    self.buttonStartPauseRecording.selected = NO;
    self.buttonStopRecording.enabled = NO;
    
    [[AudioManager shared] stopRecording];
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
}

- (IBAction)stopPlayingHandler:(id)sender
{
    self.buttonStartPausePlaying.selected = NO;
    self.buttonStopPlaying.enabled = NO;
    
    [[AudioManager shared] stopPlaying];
}





@end
