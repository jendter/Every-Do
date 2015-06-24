//
//  DetailViewController.m
//  EveryDo
//
//  Created by Josh Endter on 6/24/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "DetailViewController.h"
#import "Todo.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(Todo *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        Todo *currentTodoItem = self.detailItem;
        self.titleLabel.text = currentTodoItem.title;
        self.descriptionLabel.text = currentTodoItem.todoDescription;
        self.priorityLabel.text = [currentTodoItem priorityString];
        
        //[self.descriptionLabel setFont:[UIFont fontWithName:self.descriptionLabel.font.fontName size:self.titleLabel.font.pointSize/2.3]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
