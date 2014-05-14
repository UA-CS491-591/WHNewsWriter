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
        dispatch_async(dispatch_get_main_queue(), ^{
            NavController *Navigation = [[NavController alloc] initWithNibName:nil bundle:nil];
            Navigation.user = _loginResponse;
            [self presentViewController:Navigation animated:YES completion:NULL];
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
