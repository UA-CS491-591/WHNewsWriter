//
//  EditorTableViewCell.m
//  WHWriterApp
//
//  Created by Jonathan Fisher on 5/15/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "EditorTableViewCell.h"
#import "JVFloatLabeledTextField.h"

const static CGFloat kJVFieldHeight = 44.0f;
const static CGFloat kJVFieldHMargin = 10.0f;
const static CGFloat kJVFieldFontSize = 16.0f;
const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;


@implementation EditorTableViewCell

-(instancetype)init{
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([EditorTableViewCell class]) owner:nil options:nil][0];
    
    
    
    return self;
}

- (void)awakeFromNib
{
    UIColor *floatingLabelColor = [UIColor grayColor];
    
    // Initialization code
   /* JVFloatLabeledTextField *titleField = [[JVFloatLabeledTextField alloc] initWithFrame:
                                           CGRectMake(kJVFieldHMargin, 0, self.frame.size.width - 2 * kJVFieldHMargin, kJVFieldHeight)];*/
    
    //[titleField setFrame:CGRectMake(kJVFieldHMargin, 0, self.frame.size.width - 2 * kJVFieldHMargin, kJVFieldHeight)];
    //[_editorTextField setFrame:CGRectMake(kJVFieldHMargin, 30.0f, self.frame.size.width - 2 * kJVFieldHMargin, kJVFieldHeight)];
    //_editorTextField.placeholder = ;//NSLocalizedString(@"Title", @"");
    //_editorTextField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    //_editorTextField.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    //_editorTextField.floatingLabelTextColor = floatingLabelColor;
    //_editorTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 30.0f, 30.0f)];
    //    _editorTextField.leftView = leftView;
    //    _editorTextField.leftViewMode = UITextFieldViewModeAlways;
    //[self addSubview:_editorTextField];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
