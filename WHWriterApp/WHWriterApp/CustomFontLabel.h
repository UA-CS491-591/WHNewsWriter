//
//  CustomFontLabel.h
//  WHWriterApp
//
//  Created by Tyler on 5/22/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface CustomFontLabel : UILabel
//@end

@interface UILabel(changeFont)
- (void)awakeFromNib;
-(id)initWithFrame:(CGRect)frame;
@end

