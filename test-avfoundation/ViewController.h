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

- (IBAction)startStopRecordingHandler:(id)sender;
- (IBAction)stopRecordingHandler:(id)sender;



@property (weak, nonatomic) IBOutlet UIButton *buttonStartPausePlaying;
@property (weak, nonatomic) IBOutlet UIButton *buttonStopPlaying;

- (IBAction)startStopPlayingHandler:(id)sender;
- (IBAction)stopPlayingHandler:(id)sender;





@end

