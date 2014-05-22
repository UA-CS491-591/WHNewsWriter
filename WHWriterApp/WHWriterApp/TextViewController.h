//
//  TextViewController.h
//  WHWriterApp
//
//  Created by Jonathan Fisher on 5/21/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewController : UIViewController <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *editorTextView;
@property NSString *fieldName;


@end
