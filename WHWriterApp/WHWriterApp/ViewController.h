//
//  JBViewController.h
//  WHWriterApp
//
//  Created by Jeremy on 5/12/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"

@interface ViewController : UIViewController

@property(strong, nonatomic) LoginView *loginView;
-(IBAction)Next;

@end
