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
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LoginView class]) owner:nil options:nil][0];
    
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        _username.placeholder = @"Username";
        _username.borderStyle = UITextBorderStyleRoundedRect;
    
        _password.placeholder = @"Password";
        _password.borderStyle = UITextBorderStyleRoundedRect;
        
        //[_login setTitle:@"Login" forState:UIControlStateNormal];
        [_login.layer setBorderWidth:1.0];
        [_login.layer setBorderColor:[[UIColor blackColor] CGColor]];
        
        //[self addSubview:_username];
        //[self addSubview:_password];
        //[self addSubview:_login];
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
