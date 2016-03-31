//
//  ViewController.m
//  Tap Me
//
//  Created by Mehta on 13/01/16.
//  Copyright © 2016 Mehta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self SetUpGame];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)TapMeButtonClicked:(id)sender {
    ScoreCount++;
    ScoreLabel.text = [NSString stringWithFormat:@"Score: %li", ScoreCount];
    
    
}
-(void)SetUpGame{
    ScoreCount=0;
    TimerCount=30;
    TimerLabel.text=[NSString stringWithFormat:@"Time: %li", TimerCount];
    ScoreLabel.text=[NSString stringWithFormat:@"Score: %li", ScoreCount];
    
    highscore = [[NSUserDefaults standardUserDefaults] integerForKey: @"highScore"];
    HighScoreLabel.text = [NSString stringWithFormat:@"HighScore : %li", highscore];
    
    Timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(SubtractTime) userInfo:nil repeats:YES];

}

-(void)HighScore{
    if (ScoreCount>HighScoreCount) {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreCount forKey:@"highScore"];
        HighScoreLabel.text = [NSString stringWithFormat:@"HighScore : %li", (long)highscore];
    }
}


-(void)SubtractTime{
    TimerCount--;
    TimerLabel.text =[NSString stringWithFormat:@"Time: %i", (int)TimerCount];
    if (TimerCount==0) {
        [Timer invalidate];
        [self HighScore];
        
        UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Time Over" message:[NSString stringWithFormat:@"You have scored %i", (int) ScoreCount] preferredStyle:UIAlertControllerStyleAlert];
       
        UIAlertAction * PlayAgain = [UIAlertAction actionWithTitle:@"Play Again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * alert) {
            [self SetUpGame];
        }];
        
        [alert addAction:PlayAgain];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}
@end
