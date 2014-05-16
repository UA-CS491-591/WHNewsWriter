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
    /*JVFloatLabeledTextField *titleField = [[JVFloatLabeledTextField alloc] initWithFrame:
                                           CGRectMake(kJVFieldHMargin, 0, self.frame.size.width - 2 * kJVFieldHMargin, kJVFieldHeight)];*/
    [[_editorTextField alloc] initWithFrame:
     CGRectMake(kJVFieldHMargin, 0, self.frame.size.width - 2 * kJVFieldHMargin, kJVFieldHeight)];
    titleField.placeholder = NSLocalizedString(@"Title", @"");//NSLocalizedString(_EditorPlaceholder, @"");
    titleField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    titleField.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    titleField.floatingLabelTextColor = floatingLabelColor;
    titleField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 30.0f, 30.0f)];
    //    titleField.leftView = leftView;
    //    titleField.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview:titleField];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
