//
//  NewToDoViewController.m
//  EveryDo
//
//  Created by Josh Endter on 6/24/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "NewToDoViewController.h"
#import "Todo.h"

@interface NewToDoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextField;
@property (weak, nonatomic) IBOutlet UIButton *createTodoButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioritySegmentedControl;


@end

@implementation NewToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.descriptionTextField.clipsToBounds = YES;
    self.descriptionTextField.layer.cornerRadius = 5.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)createNewTodo:(id)sender {
    Todo *newTodo = [Todo new];
    newTodo.title = self.titleTextField.text;
    newTodo.todoDescription = self.descriptionTextField.text;
    
    if (self.prioritySegmentedControl.selectedSegmentIndex == 0) {
        newTodo.priority = PriorityHigh;
    } else if (self.prioritySegmentedControl.selectedSegmentIndex == 1) {
        newTodo.priority = PriorityMedium;
    } else {
        newTodo.priority = PriorityLow;
    }
    
    [self.delegate createNewTodoItem:newTodo];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)viewTapped:(id)sender {
    [self.view endEditing:YES];
}

@end
