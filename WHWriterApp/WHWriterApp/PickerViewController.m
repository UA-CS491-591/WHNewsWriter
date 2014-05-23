//
//  PickerViewController.m
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/22/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "PickerViewController.h"
#import "CategoryObject.h"


@interface PickerViewController ()

@end

@implementation PickerViewController

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
    // Do any additional setup after loading the view from its nib.
    [_picker reloadAllComponents];
    [[Categories sharedInstance].List enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([((CategoryObject *)obj).categoryId isEqualToString:[StoryToEdit sharedInstance].category.categoryId]) {
            [_picker selectRow:idx inComponent:0 animated:NO];
            *stop = YES;
        }
    }];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return [Categories sharedInstance].List.count;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 44)];
    //label.backgroundColor = [UIColor lightGrayColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont fontWithName:@"American Typewriter" size:18];
    //label.text = [NSString stringWithFormat:@"  %d", row+1];
    label.text = [[[Categories sharedInstance].List objectAtIndex:row] name];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return [[[Categories sharedInstance].List objectAtIndex:row] name];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    [StoryToEdit sharedInstance].category = [[Categories sharedInstance].List objectAtIndex:row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
