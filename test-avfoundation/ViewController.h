//
//  ViewController.h
//  test-avfoundation
//
//  Created by Zhn on 8/12/2014.
//  Copyright (c) 2014 Zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIButton *buttonStartPauseRecording;
@property (weak, nonatomic) IBOutlet UIButton *buttonStopRecording;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellRecorder;

- (IBAction)startStopRecordingHandler:(id)sender;
- (IBAction)stopRecordingHandler:(id)sender;



@property (weak, nonatomic) IBOutlet UIButton *buttonStartPausePlaying;
@property (weak, nonatomic) IBOutlet UIButton *buttonStopPlaying;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellPlayer;

- (IBAction)startStopPlayingHandler:(id)sender;
- (IBAction)stopPlayingHandler:(id)sender;



@property (weak, nonatomic) IBOutlet UISlider *slider;


@end

