//
//  NewToDoViewControllerDelegate.h
//  EveryDo
//
//  Created by Josh Endter on 6/24/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Todo;

@protocol NewToDoViewControllerDelegate <NSObject>

-(void)createNewTodoItem:(Todo *)newTodo;

@end
