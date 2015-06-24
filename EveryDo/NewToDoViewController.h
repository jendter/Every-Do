//
//  NewToDoViewController.h
//  EveryDo
//
//  Created by Josh Endter on 6/24/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewToDoViewControllerDelegate.h"

@interface NewToDoViewController : UIViewController

//@property (weak, nonatomic) NSMutableArray *currentTodoList;

@property (weak, nonatomic) id<NewToDoViewControllerDelegate> delegate;

@end
