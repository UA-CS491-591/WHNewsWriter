//
//  AuthorInfoViewController.h
//  WHWriterApp
//
//  Created by Student on 5/16/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthorInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *FirstNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *LastNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *EmailLbl;
@property (weak, nonatomic) IBOutlet UILabel *PositionLbl;
@property (weak, nonatomic) IBOutlet UILabel *ImageLbl;
@property (weak, nonatomic) IBOutlet UILabel *ObjectFirstNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *ObjectLastNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *ObjectEmailLbl;
@property (weak, nonatomic) IBOutlet UILabel *ObjectPositionLbl;
@property (weak, nonatomic) IBOutlet UILabel *ObjectImageLbl;

@end
