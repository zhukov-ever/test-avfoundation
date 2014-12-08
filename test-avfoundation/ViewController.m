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

- (IBAction)toggleRecordingHandler:(id)sender {
    self.buttonToggleRecording.selected = !self.buttonToggleRecording.selected;
    
    if (self.buttonToggleRecording.selected)
    {
        [[AudioManager shared] startRecording];
    }
    else
    {
        [[AudioManager shared] stopRecording];
    }
}

- (IBAction)playHandler:(id)sender
{
    self.buttonPlay.selected = !self.buttonPlay.selected;
    
    if (self.buttonPlay.selected)
    {
        [[AudioManager shared] startPlaying];
    }
    else
    {
        [[AudioManager shared] pausePlaying];
    }
}





@end