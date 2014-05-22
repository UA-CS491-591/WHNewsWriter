//
//  CustomFontLabel.m
//  WHWriterApp
//
//  Created by Tyler on 5/22/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "CustomFontLabel.h"

@implementation UILabel(changeFont)
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setFont:[UIFont fontWithName:@"American Typewriter" size:12.0]];
}

-(id)initWithFrame:(CGRect)frame
{
    id result = [super initWithFrame:frame];
    if (result) {
        [self setFont:[UIFont fontWithName:@"American Typewriter" size:12.0]];
    }
    return result;
}
@end

/*
@implementation CustomFontLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

//@end

