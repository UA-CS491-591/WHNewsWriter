//
//  JBView.m
//  WHWriterApp
//
//  Created by Jeremy on 5/12/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        _username = [[UITextField alloc] initWithFrame:CGRectMake(15, 40, 275, 30)];
        _username.placeholder = @"Username";
        _username.borderStyle = UITextBorderStyleRoundedRect;
        
        _password = [[UITextField alloc] initWithFrame:CGRectMake(15, 90, 275, 30)];
        _password.placeholder = @"Password";
        _password.borderStyle = UITextBorderStyleRoundedRect;
        
        _login = [[UIButton alloc] initWithFrame:CGRectMake(120, 170, 75, 35)];
        _login.backgroundColor = [UIColor redColor];
        [_login setTitle:@"Login" forState:UIControlStateNormal];
        
        [self addSubview:_username];
        [self addSubview:_password];
        [self addSubview:_login];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
