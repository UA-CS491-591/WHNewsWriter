//
//  EditorViewController.m
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/13/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "EditorViewController.h"
#import "EditorTableViewCell.h"
#import "EditorTextViewCell.h"

const static CGFloat kJVFieldHeight = 35.0f;
const static CGFloat kJVFieldHMargin = 0.0f;//10.0f;
const static CGFloat kJVFieldFontSize = 18.0f;
const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;

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
        self.title=@"Compose";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    /*At load of EditorViewController, only load cells with Preview Labels communicating
     object to be modified.
    */
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(didTapSave:)];
    
    
    
    //self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _EditorTableItems = [NSMutableArray array];
    [_EditorTableItems addObject:@"Title"];
    [_EditorTableItems addObject:@"Category"];
    [_EditorTableItems addObject:@"Subtitle"];
    [_EditorTableItems addObject:@"Body"];
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
    
    if(indexPath.row<3){
        //Custom Cells
        EditorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditorTableViewCell"];
        if (!cell) {
            cell = [[EditorTableViewCell alloc] init];
        }
        
        
        //Initial styling for add button.
        cell.editorTextField.placeholder = _EditorTableItems[indexPath.row];
        [cell.editorTextField setFrame:CGRectMake(kJVFieldHMargin, 30.0f, cell.editorTextField.frame.size.width - 2 * kJVFieldHMargin, kJVFieldHeight)];
        cell.editorTextField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
        cell.editorTextField.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
        cell.editorTextField.floatingLabelTextColor = [UIColor darkGrayColor];
        cell.editorTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        //[cell addSubview:cell.editorTextField];
        
        //Set Title field as firstResponder
        
        if (indexPath.row ==0){ // STILL NEED TO ADD CONDITION BASED ON NAV CONTROLLER INSTANCE ("Edit" or "Add")
            [cell.editorTextField becomeFirstResponder];
        }
        return cell;
    }
    else { //Body Text View instantiating
        EditorTextViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"EditorTextViewCell"];
        if (!cell) {
            //It's at least instantiating the cell!
            cell = [[EditorTextViewCell alloc] init];
        }
        
        
        //Initial styling
        /*JVFloatLabeledTextView *bodyField = [[JVFloatLabeledTextView alloc] initWithFrame:CGRectZero];
        bodyField.frame = CGRectMake(kJVFieldHMargin - bodyField.textContainer.lineFragmentPadding,
                                     div3.frame.origin.y + div3.frame.size.height,
                                     self.view.frame.size.width - 2*kJVFieldHMargin + bodyField.textContainer.lineFragmentPadding,
                                     kJVFieldHeight*3);*/
        
        [cell.editorTextView setFrame:CGRectMake(kJVFieldHMargin - cell.editorTextView.textContainer.lineFragmentPadding, 30.0f, cell.editorTextView.frame.size.width - 2 * kJVFieldHMargin, kJVFieldHeight)];
        cell.editorTextView.placeholder = _EditorTableItems[indexPath.row];
        cell.editorTextView.font = [UIFont systemFontOfSize:kJVFieldFontSize];
        cell.editorTextView.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
        cell.editorTextView.floatingLabelTextColor = [UIColor darkGrayColor];
        return cell;
    }
    
}


#pragma mark - Table Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //CGFloat *height;
    if(indexPath.row<3){
        return 35.0f;
    } else {
        return 320;
    }
    
}

#pragma mark - TextViewDelegate


#pragma mark - Actions to return to "TableViewController"
-(void)didTapSave:(UIButton *)sender
{
    //Still no functionality on Save except to pop the view controller
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
