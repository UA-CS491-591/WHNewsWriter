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
#import "TextViewController.h"
#import "CategoryButtonCell.h"
#import "TokenAuthorIdObject.h"
#import "StoryObject.h"
#import "NSObject+ObjectMap.h"
#import "AddDTO.h"
#import "EditDTO.h"
#import "Categories.h"
#import "PickerViewController.h"

//const static CGFloat kJVFieldHeight = 35.0f;
//const static CGFloat kJVFieldHMargin = 0.0f;//10.0f;
//const static CGFloat kJVFieldFontSize = 14.0f;
//const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;

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
        _operationQueue = [[NSOperationQueue alloc]init];
        // Custom initialization
        self.title=@"Compose";
        _EditorTableItems = [NSMutableArray array];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(didTapSave:)];
        [StoryToEdit sharedInstance].storyTitle = nil;
        [StoryToEdit sharedInstance].category =[Categories sharedInstance].List[0];
        [StoryToEdit sharedInstance].subtitle = nil;
        [StoryToEdit sharedInstance].body = nil;
        [StoryToEdit sharedInstance].storyId = nil;
        [StoryToEdit sharedInstance].imageUrl = nil;
        [_EditorTableView reloadData];
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
    //[_EditorTableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated{
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
            [StoryToEdit sharedInstance].storyTitle = _Story.title;
            [StoryToEdit sharedInstance].category = _Story.category;
            [StoryToEdit sharedInstance].subtitle = _Story.subtitle;
            [StoryToEdit sharedInstance].body = _Story.body;
            [StoryToEdit sharedInstance].storyId = _Story.storyId;
            [StoryToEdit sharedInstance].imageUrl = _Story.imageUrl;
            [_EditorTableView reloadData];
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
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Title
    if(indexPath.row==0) {
        EditorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditorTableViewCell"];
        if (!cell) {
            cell = [[EditorTableViewCell alloc] init];
        }
        cell.title = YES; //Knowing which object to update for the
                          //two instances of TextField
        
        cell.fieldLabel.text=@"title";
        cell.field.text =[StoryToEdit sharedInstance].storyTitle;
        /*
        //Styling for text field
        
        //cell.textLabel=[StoryToEdit sharedInstance].storyTitle;
        
        cell.editorTextField.placeholder = @"";
        [cell.editorTextField setFrame:CGRectMake(kJVFieldHMargin, 30.0f, cell.editorTextField.frame.size.width - 2 * kJVFieldHMargin, kJVFieldHeight)];
        cell.editorTextField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
        cell.editorTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        [cell.editorTextField setText:[StoryToEdit sharedInstance].storyTitle];
        */
        NSLog(@"%@", cell.editorTextField.text);
        //[StoryToEdit sharedInstance].storyTitle = cell.editorTextField.text;
        NSLog(@"%@", [StoryToEdit sharedInstance].storyTitle );
        
        //jas;elfk[StoryToEdit sharedInstance].subtitle = _Story.subtitle;
        
        return cell;
        
    }
    
    //Category
    else if(indexPath.row==2){
        CategoryButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryButtonCell"];
        if(!cell){
            cell = [[CategoryButtonCell alloc] init];
        }
        cell.categoryLabel.text=@"category";
        cell.categoryName.text = [StoryToEdit sharedInstance].category.name;
        
        return cell;
    }
    
    //Subtitle
    else if(indexPath.row==1){
        EditorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditorTableViewCell"];
        if (!cell) {
            cell = [[EditorTableViewCell alloc] init];
        }
        //cell.title = NO; //Knowing which object to update for the
        //two instances of TextField
        
        
        cell.fieldLabel.text=@"subtitle";
        cell.field.text =[StoryToEdit sharedInstance].subtitle;
        
    
        //[StoryToEdit sharedInstance].subtitle = _Story.subtitle;
    
        return cell;
    }
    else if(indexPath.row==3){
        EditorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditorTableViewCell"];
        if (!cell) {
            cell = [[EditorTableViewCell alloc] init];
        }
        //cell.title = NO; //Knowing which object to update for the
        //two instances of TextField
        
        
        cell.fieldLabel.text=@"image";
        cell.field.text =[StoryToEdit sharedInstance].imageUrl;
        
        
        //[StoryToEdit sharedInstance].subtitle = _Story.subtitle;
        
        return cell;
    }
    //Body
    else {
        
        EditorTextViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"EditorTextViewCell"];
        if (!cell) {
            //It's at least instantiating the cell!
            cell = [[EditorTextViewCell alloc] init];
        }
        
        cell.textViewLabel.text=@"body";
        //cell.scrollText.numberOfLines = 0;
        //cell.scrollText.text=[StoryToEdit sharedInstance].body;
        //Still need to figure out to resize label!
        
        cell.editorTextView.text=[StoryToEdit sharedInstance].body;
        
        return cell;
    }
    
}


#pragma mark - Table Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	//Title
    if(indexPath.row==0) {
        TextViewController *vc4 = [[TextViewController alloc] init];
        vc4.title = @"Title";
        vc4.fieldName= vc4.title;
        [self.navigationController pushViewController:vc4 animated:YES];
        
    }
    
    //Category
    else if(indexPath.row==2){
        PickerViewController *vc5 = [[PickerViewController alloc] init];
        [self.navigationController pushViewController:vc5 animated:YES];
        vc5.title = @"Category";
    }
    
    //Subtitle
    else if(indexPath.row==1){
        TextViewController *vc6 = [[TextViewController alloc] init];
        vc6.title = @"Subtitle";
        vc6.fieldName = vc6.title;
        [self.navigationController pushViewController:vc6 animated:YES];
    }
    
    //ImageURL
    else if(indexPath.row==3){
        TextViewController *vc8 = [[TextViewController alloc] init];
        vc8.title = @"ImageUrl";
        vc8.fieldName = vc8.title;
        [self.navigationController pushViewController:vc8 animated:YES];
        
    }
    
    //Body
    else if(indexPath.row==4){
        TextViewController *vc7 = [[TextViewController alloc] init];
        vc7.title = @"Body";
        vc7.fieldName = vc7.title;
        [self.navigationController pushViewController:vc7 animated:YES];
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //CGFloat *height;
    if(indexPath.row == 2){
        //return 168;
        return 35.0f;
    }
    else if(indexPath.row<4){
        return 35.0f;
    } else {
        return 340;
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
    addStory.title = [StoryToEdit sharedInstance].storyTitle;
    addStory.subtitle = [StoryToEdit sharedInstance].subtitle;
    addStory.body = [StoryToEdit sharedInstance].body;
    addStory.authorId = [TokenAuthorIdObject sharedInstance].user.Id;
    addStory.lat = [[NSNumber alloc] initWithDouble:1.1];
    addStory.lng = [[NSNumber alloc] initWithDouble:1.1];
    addStory.categoryId = [StoryToEdit sharedInstance].category.categoryId;
    addStory.accessToken = [TokenAuthorIdObject sharedInstance].accessToken;
    addStory.imageUrl = [StoryToEdit sharedInstance].imageUrl;
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
    editStory.story = [[StoryObject alloc]init];
    editStory.story.storyId =[StoryToEdit sharedInstance].storyId;
    editStory.accessToken =[TokenAuthorIdObject sharedInstance].accessToken;
    editStory.story.title = [StoryToEdit sharedInstance].storyTitle;
    editStory.story.subtitle = [StoryToEdit sharedInstance].subtitle;
    editStory.story.body = [StoryToEdit sharedInstance].body;
    editStory.story.author = [TokenAuthorIdObject sharedInstance].user;
    editStory.story.lat = [[NSNumber alloc] initWithDouble:1.1];
    editStory.story.lng = [[NSNumber alloc] initWithDouble:1.1];
    editStory.story.category = [StoryToEdit sharedInstance].category;
    editStory.story.datePublished = _Story.datePublished;
    editStory.story.imageUrl = [StoryToEdit sharedInstance].imageUrl;
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
