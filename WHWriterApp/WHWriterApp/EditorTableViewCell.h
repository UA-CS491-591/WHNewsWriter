//
//  EditorTableViewCell.h
//  WHWriterApp
//
//  Created by Jonathan Fisher on 5/15/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVFloatLabeledTextField.h"

@interface EditorTableViewCell : UITableViewCell <UITextFieldDelegate>
//@property (weak, nonatomic) IBOutlet UILabel *EditorPreviewLabel;
//@property (weak, nonatomic) NSString *EditorPlaceholder;
@property JVFloatLabeledTextField *editorTextField;
//@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *editorTextField;
@property NSString *textFieldFinalText;
@property bool title;

@end
