//
//  JBViewController.m
//  WHWriterApp
//
//  Created by Jeremy on 5/12/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "NavController.h"
#import "ViewController.h"
#import "LoginRequestObject.h"
#import "LoginResponseObject.h"
#import "NSObject+ObjectMap.h"
#import "TokenAuthorIdObject.h"
#import "AuthorInfoViewController.h"
#import "Categories.h"
//#import "CustomFontLabel.h"

@interface ViewController ()

@property NSOperationQueue *operationQueue;
@property LoginRequestObject *loginRequest;
@property LoginResponseObject *loginResponse;

@end

@implementation ViewController

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
    _operationQueue = [[NSOperationQueue alloc]init];
    _loginRequest = [[LoginRequestObject alloc]init];
    _loginResponse = [[LoginResponseObject alloc]init];
    _loginView = [[LoginView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [_loginView.login addTarget:self action:@selector(didTapMyButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginView];

    // Do any additional setup after loading the view.
}

-(void)didTapMyButton:(UIButton *)sender
{
    //Create url
    NSURL *url = [NSURL URLWithString:@"https://mobileweb.caps.ua.edu/cs491/api/Account/login"];
    
    //Create request object
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    //Let the server know that we want to interact in JSON
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //Set http method
    [request setHTTPMethod:@"POST"];
    
    _loginRequest.username = _loginView.username.text;
    _loginRequest.password = _loginView.password.text;
    //Specify the string to get sent to the server
    
    //Make that string into raw data
    NSData *loginData = [_loginRequest JSONData];
    //Set that raw data as the HTTP Body for the request
    [request setHTTPBody:loginData];
    
    //Send asynchronous request
    [NSURLConnection sendAsynchronousRequest:request queue:_operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //Decode to string
        _loginResponse = [[LoginResponseObject alloc]initWithJSONData:data];
        if (_loginResponse.accessToken != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NavController *Navigation = [[NavController alloc] initWithNibName:nil bundle:nil];
                AuthorInfoViewController *AuthorVC = [[AuthorInfoViewController alloc] initWithNibName:NSStringFromClass([AuthorInfoViewController class]) bundle:nil];
                UINavigationController *AuthorNavController = [[UINavigationController alloc] init];
                [AuthorNavController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"American Typewriter" size:20]}];
                [AuthorNavController pushViewController:AuthorVC animated:NO];
                _tabBarController = [[UITabBarController alloc] init];
                _tabBarController.viewControllers = @[Navigation, AuthorNavController];
                [TokenAuthorIdObject sharedInstance].user = _loginResponse.user;
                [TokenAuthorIdObject sharedInstance].accessToken = _loginResponse.accessToken;
                [self loadCategories];
            });
        }
    }];
}

-(void)loadCategories
{
    //Create url
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", @"https://mobileweb.caps.ua.edu/cs491/api/Category/categories?token=", [TokenAuthorIdObject sharedInstance].accessToken]];
    //Create request object
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    //Let the server know that we want to interact in JSON
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //Set http method
    [request setHTTPMethod:@"GET"];
    //Send asynchronous request
    [NSURLConnection sendAsynchronousRequest:request queue:_operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //Decode to string
        [Categories sharedInstance].List = [NSObject arrayOfType:[CategoryObject class] FromJSONData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:_tabBarController animated:YES completion:NULL];
        });
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
