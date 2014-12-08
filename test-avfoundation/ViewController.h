//
//  ViewController.h
//  test-avfoundation
//
//  Created by Zhn on 8/12/2014.
//  Copyright (c) 2014 Zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *buttonToggleRecording;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlay;


- (IBAction)toggleRecordingHandler:(id)sender;
- (IBAction)playHandler:(id)sender;




@end

