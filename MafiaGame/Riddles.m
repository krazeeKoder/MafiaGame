//
//  Riddles.m
//  MafiaGame
//
//  Created by Anthony Tulai on 2016-01-20.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "Riddles.h"

@implementation Riddles

-(instancetype) init {
    self = [super init];
    if (self) {
        _questions = [[NSMutableArray alloc] initWithObjects:@"Which letter of the alphabet has the most water?", @"What time of day, when written in all lower case letters, is the same forwards, backwards?", @"What has a face and two hands but no arms or legs?", @"If you say name I disappear, what am I?", @"What word becomes shorter when you add two letters to it?", @"What has a neck but no head?", nil];
        
        _answers = [[NSMutableArray alloc] initWithObjects: @"c", @"noon", @"clock", @"silence", @"short", @"bottle", nil];
    }
    return self;
}

@end
