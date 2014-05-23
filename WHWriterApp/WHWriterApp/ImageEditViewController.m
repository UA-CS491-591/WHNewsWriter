//
//  ImageViewController.m
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/22/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "ImageEditViewController.h"
#import "StoryToEdit.h"

@interface ImageEditViewController ()

@end

@implementation ImageEditViewController

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
    self.navigationItem.rightBarButtonItems = [[NSArray alloc]initWithObjects: [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(didTapDone:)], [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(didTapAction:)],nil ];
    [_editorTextView becomeFirstResponder];
    [_editorTextView setText:[StoryToEdit sharedInstance].imageUrl];
    _editorImageView.image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[StoryToEdit sharedInstance].imageUrl]]];
}

- (void)viewDidAppear:(BOOL)animated{
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Text View Delegate Methods
- (void)textViewDidBeginEditing:(UITextView *)textView {
    //CGRect textViewFrame = CGRectInset(self.view.bounds, 20.0, 20.0);
    //textViewFrame.size.height -= 216;
    //textView.frame = textViewFrame;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //CGRect textViewFrame = CGRectInset(self.view.bounds, 20.0, 20.0);
    //_editorTextView.frame = textViewFrame;
    //[_editorTextView endEditing:YES];
    //[super touchesBegan:touches withEvent:event];
}


#pragma mark - Button Actions
-(void)didTapDone:(UIButton *)sender
{
    [StoryToEdit sharedInstance].imageUrl= _editorTextView.text;
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)didTapAction:(UIButton *)sender
{
    _editorImageView.image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_editorTextView.text]]];
}

@end
