//
//  JBTableViewController.h
//  WHWriterApp
//
//  Created by Jeremy on 5/12/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginResponseObject.h"

@interface TableViewController : UITableViewController
@property LoginResponseObject *user;
-(void)didTapMyButton:(UIButton *)sender;
@end
