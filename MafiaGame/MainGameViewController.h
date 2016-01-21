//
//  MainGameView.h
//  MafiaGame
//
//  Created by Anthony Tulai on 2016-01-20.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainGameViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *riddleLabel;
@property (assign) int nonPlayerCharacterCount;
@property (strong) NSString *playerType;

@property (assign) NSUInteger currentQuestionValue;
@property (strong, nonatomic) IBOutlet UITextField *answerText;
@property (strong, nonatomic) IBOutlet UILabel *infoLabel;

@property (strong, nonatomic) IBOutlet UIButton *buttonLabel;

@property (assign) bool didWin;

-(void) setRandomQuestion;
@end
