//
//  EditorViewController.m
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/13/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "EditorViewController.h"

@interface EditorViewController ()
@property (weak, nonatomic) IBOutlet UITableView *EditorTableView;
@property NSMutableArray *EditorTableItems;



@end

@implementation EditorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _EditorTableItems = [NSMutableArray array];
    [_EditorTableItems addObject:@"Item 1"];
    [_EditorTableItems addObject:@"Item 2"];
    [_EditorTableItems addObject:@"Item 3"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    	    // Return the number of sections.
    	    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return self.EditorTableItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    // Configure the cell...
    /*XYZToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text=toDoItem.itemName;

    if (toDoItem.completed) {
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }*/
    
   
    
    return cell;
}


#pragma mark - Table Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [indexPath row] * 20;
}

@end
