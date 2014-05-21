//
//  EditorPickerTableViewCell.h
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/20/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Categories.h"
#import "StoryToEdit.h"

@interface EditorPickerTableViewCell : UITableViewCell <UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end
