//
//  MainGameView.m
//  MafiaGame
//
//  Created by Anthony Tulai on 2016-01-20.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "MainGameViewController.h"
#import "Riddles.h"


@implementation MainGameViewController 

-(instancetype) init {
    self = [super init];
    if (self) {
        _playerType = [[NSString alloc]init];
        _didWin = NO;
    }
    return self;
  
}

-(void) viewDidLoad {
    [super viewDidLoad];
    
    self.answerText.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self attemptButton:nil];
    return YES;
}

-(void) setRandomQuestion {
    Riddles *riddleBank = [[Riddles alloc] init];
    
    NSUInteger randomNum = arc4random_uniform(6);
    
    NSString *riddleQuestion = [riddleBank.questions objectAtIndex:randomNum];
    
    self.riddleLabel.text = riddleQuestion;
    self.currentQuestionValue = randomNum;
    
}
- (IBAction)attemptButton:(id)sender {
    
    [self.answerText resignFirstResponder];
    
    NSString *playerAnswer = self.answerText.text;
    self.answerText.text = @"";
    
    Riddles *riddleBank = [[Riddles alloc] init];
    
    
    if ([playerAnswer isEqual:[riddleBank.answers objectAtIndex: self.currentQuestionValue]]) {
        self.nonPlayerCharacterCount = self.nonPlayerCharacterCount - 1;
        
        if (self.nonPlayerCharacterCount < 1) {
            self.didWin = YES;
            self.infoLabel.text = @"You won!!";
            self.riddleLabel.text = @"You won!!";
            
        }
        else
        {
            
            NSNumber *npcRemaining = @(self.nonPlayerCharacterCount);
            
            if ([self.playerType isEqualToString:@"mafia"]) {
                
            
            NSString *response = @"That is correct!: There are ";
                
                response = [response stringByAppendingFormat:@"%@ innocent villagers left to kill.", npcRemaining];
                self.infoLabel.text = response;
                [self setRandomQuestion];
                
            } else {
                
                int randomSuspect = arc4random_uniform(self.nonPlayerCharacterCount);
                
                if (randomSuspect == 0) {
                    NSString *response = @"That is correct and the suspect you interrogated was mafia!! You WIN!!";
                    self.infoLabel.text = response;
                    self.riddleLabel.text = @"You won!!";
                    
                } else {
                    
                    NSString *response = @"That is correct but the suspect was not a mafioso: There are ";
                    
                    response = [response stringByAppendingFormat:@"%@ suspects left to interrogate.", npcRemaining];
                    self.infoLabel.text = response;
                }
            }
        }
        
            
        
    }
}


@end
