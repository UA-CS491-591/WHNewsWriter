//
//  EditorTextViewCell.m
//  WHWriterApp
//
//  Created by Jonathan Fisher on 5/19/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "EditorTextViewCell.h"
#import "StoryToEdit.h"

@implementation EditorTextViewCell

-(instancetype)init{
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([EditorTextViewCell class]) owner:nil options:nil][0];
    
    
    
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    _editorTextView.delegate = self;
    
}

#pragma mark - TextView Delegate Methods
- (void)textViewDidChange:(UITextView *)textView {
   
    [StoryToEdit sharedInstance].body= textView.text;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
   
    [StoryToEdit sharedInstance].body= textView.text;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textView
{
    //[StoryToEdit sharedInstance].body= textView.text;
    [textView resignFirstResponder];
   return YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
