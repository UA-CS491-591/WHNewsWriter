//
//  JBNavController.m
//  WHWriterApp
//
//  Created by Jeremy on 5/12/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "NavController.h"
#import "TableViewController.h"

@interface NavController ()
@property TableViewController *TableVC;

@end

@implementation NavController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //[self.navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"American Typewriter" size:20]}];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _TableVC = [[TableViewController alloc] initWithNibName:nil bundle:nil];
    _TableVC.title = @"Your Articles";
    
    
    //TabBarIcon
    UIImage *img1 = [UIImage imageNamed:@"articlesIcon1.png"];
    UIImage *img2 = [UIImage imageNamed:@"authorIcon1.png"];
    UIImage *img3 = [UIImage imageNamed:@"articlesIcon2.png"];
    UIImage *img4 = [UIImage imageNamed:@"authorIcon2.png"];
    img1 = [img1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    img2 = [img2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [[[[self.tabBarController.viewControllers objectAtIndex:0] tabBarItem]initWithTitle:@"Your Articles" image:img1 selectedImage:img3] image];
    [[[[self.tabBarController.viewControllers objectAtIndex:1] tabBarItem]initWithTitle:@"Author Profile" image:img2 selectedImage:img4] image];
    
    //[[[self.tabBarController.viewControllers objectAtIndex:0] tabBarItem]setFinishedSelectedImage:img2 withFinishedUnselectedImage:img1];
    //[[[self.tabBarController.viewControllers objectAtIndex:1] tabBarItem]setFinishedSelectedImage:img4 withFinishedUnselectedImage:img3];
    //UIImage *image = [UIImage imageNamed:@"yourArticlesIcon35.png"];
    //self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"string" image:image tag:0] self];
    
    [self pushViewController:_TableVC animated:YES];
    
    
    // Do any additional setup after loading the view.
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


