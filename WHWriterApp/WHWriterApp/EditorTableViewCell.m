//
//  EditorTableViewCell.m
//  WHWriterApp
//
//  Created by Jonathan Fisher on 5/15/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "EditorTableViewCell.h"
#import "StoryToEdit.h"

@implementation EditorTableViewCell

- (instancetype)init{
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([EditorTableViewCell class]) owner:nil options:nil][0];
    
    
    return self;
}

- (void)awakeFromNib
{
    //Initialization Code
    _editorTextField.delegate = self;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    [self performSelector:@selector(evaluateText) withObject:nil afterDelay:0.1];
    
    return YES;
}

- (void)evaluateText{
    if (_title){
        [StoryToEdit sharedInstance].storyTitle= _editorTextField.text;
    }
    else   {
        [StoryToEdit sharedInstance].subtitle= _editorTextField.text;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    _textFieldFinalText = textField.text;
    if (_title){
        [StoryToEdit sharedInstance].storyTitle= textField.text;
    }
    else   {
        [StoryToEdit sharedInstance].subtitle= textField.text;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
