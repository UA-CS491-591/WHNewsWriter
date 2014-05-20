//
//  EditorPickerTableViewCell.m
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/20/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "EditorPickerTableViewCell.h"

@implementation EditorPickerTableViewCell

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return [Categories sharedInstance].List.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return [[[Categories sharedInstance].List objectAtIndex:row] name];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    [StoryToEdit sharedInstance].category = [[Categories sharedInstance].List objectAtIndex:row];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
