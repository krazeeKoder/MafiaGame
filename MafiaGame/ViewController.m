//
//  ViewController.m
//  MafiaGame
//
//  Created by Anthony Tulai on 2016-01-20.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "ViewController.h"
#import "MainGameViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playAsMafia:(id)sender {
    [self performSegueWithIdentifier:@"mafia" sender:sender];
    
}

- (IBAction)playAsSheriff:(id)sender {
    [self performSegueWithIdentifier:@"sheriff" sender:sender];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"mafia"]) {
        MainGameViewController *gameView = segue.destinationViewController;
        
        gameView.playerType = @"mafia";
        gameView.nonPlayerCharacterCount = 6;
        gameView.view.backgroundColor = [UIColor redColor];
        [gameView.buttonLabel setTitle:@"Attempt to Kill Innocent Villager" forState:UIControlStateNormal];
        
        gameView.infoLabel.text = @"You have 6 villagers left to kill.";
        [gameView setRandomQuestion];
        
    }
    
    if ([[segue identifier] isEqualToString: @"sheriff"]) {
        MainGameViewController *gameView = segue.destinationViewController;
        
        gameView.playerType = @"sheriff";
        gameView.nonPlayerCharacterCount = 3;
        gameView.view.backgroundColor = [UIColor grayColor];
        [gameView.buttonLabel setTitle:@"Attempt to interrogate suspect" forState:UIControlStateNormal];
        gameView.infoLabel.text = @"You Have 3 suspects left to interrogate";
        
        [gameView setRandomQuestion];
    }
}


@end
