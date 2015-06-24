//
//  TodoTableViewCell.h
//  EveryDo
//
//  Created by Josh Endter on 6/24/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Todo;

@interface TodoTableViewCell : UITableViewCell

@property (weak,nonatomic) Todo *todoObject;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;


@end
