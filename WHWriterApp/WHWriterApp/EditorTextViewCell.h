//
//  EditorTextViewCell.h
//  WHWriterApp
//
//  Created by Jonathan Fisher on 5/19/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVFloatLabeledTextView.h"

@interface EditorTextViewCell : UITableViewCell <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *textViewLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *scrollText;
@property (weak, nonatomic) IBOutlet UITextView *editorTextView;
//@property (weak, nonatomic) IBOutlet JVFloatLabeledTextView *editorTextView;
//@property (weak, nonatomic) IBOutlet UIButton *editButton;


@end
