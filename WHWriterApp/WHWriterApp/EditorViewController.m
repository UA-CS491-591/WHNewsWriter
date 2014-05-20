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
#import "EditorPickerTableViewCell.h"
#import "TokenAuthorIdObject.h"
#import "StoryObject.h"
#import "NSObject+ObjectMap.h"
#import "AddDTO.h"
#import "EditDTO.h"
#import "Categories.h"

const static CGFloat kJVFieldHeight = 35.0f;
const static CGFloat kJVFieldHMargin = 0.0f;//10.0f;
const static CGFloat kJVFieldFontSize = 18.0f;
const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;

@interface EditorViewController ()
@property (weak, nonatomic) IBOutlet UITableView *EditorTableView;
@property NSMutableArray *EditorTableItems;
@property NSString *StoryId;
@property NSOperationQueue *operationQueue;
@property StoryObject *Story;



@end

@implementation EditorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Compose";
        _EditorTableItems = [NSMutableArray array];
        [_EditorTableItems addObject:@"Title\nTitle"];
        [_EditorTableItems addObject:@"Category"];
        [_EditorTableItems addObject:@"Subtitle"];
        [_EditorTableItems addObject:@"Body"];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(didTapSave:)];
    }
    return self;
}

- (id)initForEdit:(NSString *)storyId
{
    _operationQueue = [[NSOperationQueue alloc]init];
    _EditorTableItems = [NSMutableArray array];
        // Custom initialization
        _StoryId = storyId;
        self.title=@"Edit";
    [self seedData:storyId];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(didTapSaveEdit:)];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_EditorTableView reloadData];
}

-(void)seedData:(NSString *)StoryID
{
    
    //Create url
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@", @"https://mobileweb.caps.ua.edu/cs491/api/Story/byId?token=", [TokenAuthorIdObject sharedInstance].accessToken, @"&storyId=",StoryID]];
    
    //Create request object
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    //Let the server know that we want to interact in JSON
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //Set http method
    [request setHTTPMethod:@"GET"];
    //Send asynchronous request
    [NSURLConnection sendAsynchronousRequest:request queue:_operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //Decode to string
        _Story = [[StoryObject alloc]initWithJSONData:data];
        //Hop back main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_EditorTableItems addObject:_Story.title];
            [_EditorTableItems addObject:@"Category"];
            [_EditorTableItems addObject:@"Subtitle"];
            [_EditorTableItems addObject:@"Body"];
        });
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return self.EditorTableItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row<3){
        if(indexPath.row==1){
            EditorPickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditorPickerTableViewCell"];
            if(!cell){
                cell = [[EditorPickerTableViewCell alloc] init];
            }
            
            return cell;
        }
        else if (indexPath.row==0){
            
            //Custom Cells
            EditorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditorTableViewCell"];
            if (!cell) {
                cell = [[EditorTableViewCell alloc] init];
            }
            
            cell.title = YES;
            //Initial styling for add button.
            cell.editorTextField.placeholder = _EditorTableItems[indexPath.row];
            [cell.editorTextField setFrame:CGRectMake(kJVFieldHMargin, 30.0f, cell.editorTextField.frame.size.width - 2 * kJVFieldHMargin, kJVFieldHeight)];
            cell.editorTextField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
            cell.editorTextField.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
            cell.editorTextField.floatingLabelTextColor = [UIColor darkGrayColor];
            cell.editorTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            cell.editorTextField.returnKeyType = UIReturnKeyNext;
            //[cell addSubview:cell.editorTextField];
            
            //Set Title field as firstResponder
            
            if (indexPath.row ==0){ // STILL NEED TO ADD CONDITION BASED ON NAV CONTROLLER INSTANCE ("Edit" or "Add")
                [cell.editorTextField becomeFirstResponder];
            }
            return cell;
        }
        else {
            
            //Custom Cells
            EditorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditorTableViewCell"];
            if (!cell) {
                cell = [[EditorTableViewCell alloc] init];
            }
            
            cell.title = NO;
            //Initial styling for add button.
            cell.editorTextField.placeholder = _EditorTableItems[indexPath.row];
            [cell.editorTextField setFrame:CGRectMake(kJVFieldHMargin, 30.0f, cell.editorTextField.frame.size.width - 2 * kJVFieldHMargin, kJVFieldHeight)];
            cell.editorTextField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
            cell.editorTextField.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
            cell.editorTextField.floatingLabelTextColor = [UIColor darkGrayColor];
            cell.editorTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            cell.editorTextField.returnKeyType = UIReturnKeyNext;
            //[cell addSubview:cell.editorTextField];
            
            //Set Title field as firstResponder
            
            if (indexPath.row ==0){ // STILL NEED TO ADD CONDITION BASED ON NAV CONTROLLER INSTANCE ("Edit" or "Add")
                [cell.editorTextField becomeFirstResponder];
            }
            return cell;
        }
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
       // cell.editorTextView.delegate = self;
        //valTxtField.returnKeyType = UIReturnKeyDone;
        
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




#pragma mark - Actions to return to "TableViewController"
-(void)didTapSave:(UIButton *)sender
{
    [self SaveNewStory];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)didTapSaveEdit:(UIButton *)sender
{
    [self SaveEditedStory];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)SaveNewStory
{
    //Create url
    NSURL *url = [NSURL URLWithString:@"https://mobileweb.caps.ua.edu/cs491/api/Story/add"];    
    //Create request object
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    //Let the server know that we want to interact in JSON
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //Set http method
    [request setHTTPMethod:@"POST"];
    AddDTO *addStory = [[AddDTO alloc]init];
    addStory.title = _EditorTableItems[0];
    addStory.subtitle = _EditorTableItems[2];
    addStory.body = _EditorTableItems[3];
    addStory.authorId = [TokenAuthorIdObject sharedInstance].user.Id;
    addStory.lat = [[NSNumber alloc] initWithDouble:1.1];
    addStory.lng = [[NSNumber alloc] initWithDouble:1.1];
    addStory.categoryId = @"bc6af052-6c8e-4893-9c82-224d002add06";
    addStory.accessToken = [TokenAuthorIdObject sharedInstance].accessToken;
    //Specify the string to get sent to the server
    
    //Make that string into raw data
    NSData *storyData = [addStory JSONData];
    //Set that raw data as the HTTP Body for the request
    [request setHTTPBody:storyData];
    
    //Send asynchronous request
    [NSURLConnection sendAsynchronousRequest:request queue:_operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //Decode to string
        StoryObject *storyResponse = [[StoryObject alloc]initWithJSONData:data];
        if (storyResponse != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
            });
        }
    }];
}
-(void)SaveEditedStory
{
    //Create url
    NSURL *url = [NSURL URLWithString:@"https://mobileweb.caps.ua.edu/cs491/api/Story/edit"];
    //Create request object
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    //Let the server know that we want to interact in JSON
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //Set http method
    [request setHTTPMethod:@"PUT"];
    
    EditDTO *editStory = [[EditDTO alloc]init];
    editStory.accessToken =[TokenAuthorIdObject sharedInstance].accessToken;
    editStory.story.title = _EditorTableItems[0];
    editStory.story.subtitle = _EditorTableItems[2];
    editStory.story.body = _EditorTableItems[3];
    editStory.story.author = [TokenAuthorIdObject sharedInstance].user;
    editStory.story.lat = [[NSNumber alloc] initWithDouble:1.1];
    editStory.story.lng = [[NSNumber alloc] initWithDouble:1.1];
    editStory.story.category = [Categories sharedInstance].List[0];
    editStory.story.datePublished = _Story.datePublished;
    //Specify the string to get sent to the server
    
    //Make that string into raw data
    NSData *storyData = [editStory JSONData];
    //Set that raw data as the HTTP Body for the request
    [request setHTTPBody:storyData];
    
    //Send asynchronous request
    [NSURLConnection sendAsynchronousRequest:request queue:_operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //Decode to string
        NSString *storyResponse = [[NSString alloc] initWithJSONData:data];
        if (storyResponse != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
            });
        }
    }];
}


@end
