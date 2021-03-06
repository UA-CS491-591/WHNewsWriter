//
//  AuthorInfoViewController.m
//  WHWriterApp
//
//  Created by Student on 5/16/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "AuthorInfoViewController.h"
#import "TokenAuthorIdObject.h"

@interface AuthorInfoViewController ()

@end

@implementation AuthorInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Author Info";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //UINavigationController *AuthorNavController = [[UINavigationController alloc] init];
    // Do any additional setup after loading the view from its nib.
    
    //TabBarIcon
    //[[[self.tabBarController.viewControllers objectAtIndex:1] tabBarItem]setFinishedSelectedImage:[UIImage imageNamed:@"authorProfileIcon35S.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"authorProfileIcon35.png"]];
    
    
    _ObjectFirstNameLbl.text = [TokenAuthorIdObject sharedInstance].user.firstName;
    _ObjectLastNameLbl.text = [TokenAuthorIdObject sharedInstance].user.lastName;
    _ObjectEmailLbl.text = [TokenAuthorIdObject sharedInstance].user.email;
    _ObjectPositionLbl.text = [TokenAuthorIdObject sharedInstance].user.position;
    _AuthorImage.image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[TokenAuthorIdObject sharedInstance].user.imageUrl]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
