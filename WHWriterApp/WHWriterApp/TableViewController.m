//
//  JBTableViewController.m
//  WHWriterApp
//
//  Created by Jeremy on 5/12/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "TableViewController.h"
#import "EditorViewController.h"
#import "StoryObject.h"
#import "NavController.h"
#import "ViewController.h"
#import "LoginResponseObject.h"

@interface TableViewController ()

@property NSArray *stories;
@property NSOperationQueue *operationQueue;

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _operationQueue = [[NSOperationQueue alloc]init];
    [self refreshTable];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.navigationItem.rightBarButtonItem setAction:@selector(didTapMyButton:)];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    [searchBar sizeToFit];
    searchBar.delegate = self;
    searchBar.placeholder = @"Search";
    self.tableView.tableHeaderView = searchBar;
    
    UISearchDisplayController *searchDC = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    
    // The above assigns self.searchDisplayController, but without retaining.
    // Force the read-only property to be set and retained.
    [self performSelector:@selector(setSearchDisplayController:) withObject:searchDC];
    
    searchDC.delegate = self;
    searchDC.searchResultsDataSource = self;
    searchDC.searchResultsDelegate = self;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.searchDisplayController.searchResultsTableView) {
         self.tableView.tableViewData = searchResultsData objectatindex...; //array with filtered data
    } else {
        ;//tableViewData = defaultData objectatindex...; //array with unfiltered data
    }
    return nil;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        //return searchResultsData.count;
    } else {
        // return defaultData.count;
    }
    return 0;
}
-(void)didTapMyButton:(UIButton *)sender
{
    EditorViewController *vc2 = [[EditorViewController alloc] init];
    [self.navigationController pushViewController:vc2 animated:YES];
}

-(void)refreshTable{
    
    //Create url
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@", @"https://mobileweb.caps.ua.edu/cs491/api//Story/byAuthor?token=", self.user.accessToken, @"&authorId=",self.user.user.Id]];
    
    //Create request object
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    //Let the server know that we want to interact in JSON
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //Set http method
    
    //Send asynchronous request
    [NSURLConnection sendAsynchronousRequest:request queue:_operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //Decode to string
        _stories = [NSObject arrayOfType:[StoryObject class] FromJSONData:data];
        //Hop back main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
    
}


-(IBAction)Next
{
    //NavController *Navigation = [[NavController alloc] initWithNibName:nil bundle:nil];
    //[self presentViewController:Navigation animated:YES completion:NULL];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
