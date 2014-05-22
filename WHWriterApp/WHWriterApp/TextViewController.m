//
//  TextViewController.m
//  WHWriterApp
//
//  Created by Jonathan Fisher on 5/21/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "TextViewController.h"
#import "StoryToEdit.h"

@interface TextViewController ()

@end

@implementation TextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(didTapDone:)];
    
    [_editorTextView becomeFirstResponder];
    // Do any additional setup after loading the view from its nib.
    if([_fieldName isEqual:@"Title"]){
        [_editorTextView setFont:[UIFont fontWithName:@"DIN Alternated Bold" size:50.0f]];
        [_editorTextView setText:[StoryToEdit sharedInstance].storyTitle];
    }
    else if([_fieldName isEqual:@"Subtitle"]){
        [_editorTextView setText:[StoryToEdit sharedInstance].subtitle];
    }
    else if([_fieldName isEqual:@"Body"]){
        [_editorTextView setText:[StoryToEdit sharedInstance].body];
    }
}

- (void)viewDidAppear:(BOOL)animated{
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Text View Delegate Methods
/*- (void)textViewDidBeginEditing:(UITextView *)textView {
    CGRect textViewFrame = CGRectInset(self.view.bounds, 20.0, 20.0);
    textViewFrame.size.height -= 216;
    textView.frame = textViewFrame;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGRect textViewFrame = CGRectInset(self.view.bounds, 20.0, 20.0);
    _editorTextView.frame = textViewFrame;
    [_editorTextView endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}*/


#pragma mark - Button Actions
-(void)didTapDone:(UIButton *)sender
{
    
    if([_fieldName isEqual:@"Title"]){
        [StoryToEdit sharedInstance].storyTitle= _editorTextView.text;
    }
    else if([_fieldName isEqual:@"Subtitle"]){
        [StoryToEdit sharedInstance].subtitle= _editorTextView.text;
        NSLog(@"%@", [StoryToEdit sharedInstance].subtitle);
    }
    else if([_fieldName isEqual:@"Body"]){
        [StoryToEdit sharedInstance].body= _editorTextView.text;
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
