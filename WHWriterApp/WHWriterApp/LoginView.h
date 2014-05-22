//
//  JBView.h
//  WHWriterApp
//
//  Created by Jeremy on 5/12/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView

@property IBOutlet UITextField *username;
@property IBOutlet UITextField *password;
@property IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end
