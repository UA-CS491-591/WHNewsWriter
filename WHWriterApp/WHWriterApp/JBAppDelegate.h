//
//  JBAppDelegate.h
//  WHWriterApp
//
//  Created by Jeremy on 5/12/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBViewController.h"
#import "JBNavController.h"

@interface JBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property JBViewController *ViewController;
@property JBNavController *NavController;

@end
