//
//  CategoryButtonCell.m
//  WHWriterApp
//
//  Created by Jonathan Fisher on 5/21/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "CategoryButtonCell.h"
#import "StoryToEdit.h"

@implementation CategoryButtonCell

- (instancetype)init{
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([CategoryButtonCell class]) owner:nil options:nil][0];
    return self;
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
