//
//  Todo.m
//  EveryDo
//
//  Created by Josh Endter on 6/24/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "Todo.h"

@implementation Todo


- (instancetype)init
{
    self = [super init];
    if (self) {
        _completed = NO;
        _priority = PriorityMedium;
    }
    return self;
}

-(NSString *)priorityString {
    if (self.priority == PriorityHigh) {
        return @"High";
    } else if (self.priority == PriorityMedium) {
        return @"Medium";
    } else {
        return @"Low";
    }
}

@end
