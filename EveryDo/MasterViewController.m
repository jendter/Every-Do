//
//  MasterViewController.m
//  EveryDo
//
//  Created by Josh Endter on 6/24/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "TodoTableViewCell.h"
#import "NewToDoViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    [self setupDefaultTodoList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
//    [self.objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self performSegueWithIdentifier:@"newToDo" sender:self];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
    
    if ([[segue identifier] isEqualToString:@"newToDo"]) {
        [[segue destinationViewController] setCurrentTodoList:self.objects];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];

    Todo *todo = self.objects[indexPath.row];
    cell.titleLabel.text = todo.title;
    cell.descriptionLabel.text = todo.todoDescription;
    cell.priorityLabel.text = [todo priorityString];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(void)setupDefaultTodoList {
    Todo *todo1 = [Todo new];
    todo1.title = @"Remember the milk";
    todo1.todoDescription = @"It's important. I have cereal to eat.";
    todo1.priority = PriorityHigh;
    
    Todo *todo2 = [Todo new];
    todo2.title = @"Get some new headphones";
    todo2.todoDescription = @"Time to get some nicer headphones.";
    todo2.priority = PriorityLow;
    
    Todo *todo3 = [Todo new];
    todo3.title = @"See sunlight";
    todo3.todoDescription = @"It would be nice. Oh well.";
    todo3.priority = PriorityMedium;
    
    NSArray *todoArray = @[todo1, todo2, todo3];
    self.objects = [todoArray mutableCopy];
}


@end
