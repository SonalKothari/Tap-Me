//
//  ViewController.h
//  Tap Me
//
//  Created by Mehta on 13/01/16.
//  Copyright © 2016 Mehta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{

IBOutlet UILabel *ScoreLabel;
IBOutlet UILabel *TimerLabel;
IBOutlet UILabel *HighScoreLabel;
}

- (IBAction)TapMeButtonClicked:(id)sender;

@end

NSInteger ScoreCount;
NSInteger TimerCount;
NSInteger HighScoreCount;
NSTimer *Timer;
NSInteger highscore;



