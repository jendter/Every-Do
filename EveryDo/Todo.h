//
//  Todo.h
//  EveryDo
//
//  Created by Josh Endter on 6/24/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    PriorityLow,
    PriorityMedium,
    PriorityHigh
} Priority;

@interface Todo : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *todoDescription;
@property (nonatomic) Priority priority;
@property (nonatomic, getter=isCompleted) BOOL completed;

-(NSString *)priorityString;

@end
