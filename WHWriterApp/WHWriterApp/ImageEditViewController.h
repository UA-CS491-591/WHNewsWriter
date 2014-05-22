//
//  ImageViewController.h
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/22/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "ViewController.h"

@interface ImageEditViewController : UIViewController <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *editorTextView;
@property (weak, nonatomic) IBOutlet UIImageView *editorImageView;
@property NSString *fieldName;

@end
