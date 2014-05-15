//
//  MainTableViewCell.m
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/15/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

-(instancetype)init{
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MainTableViewCell class]) owner:nil options:nil][0];
    
    
    
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
