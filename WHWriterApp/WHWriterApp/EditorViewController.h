//
//  EditorViewController.h
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/13/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryToEdit.h"

@interface EditorViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>;
-(void)didTapSave:(UIButton *)sender;
-(id)initForEdit:(NSString *)storyId;

@end
