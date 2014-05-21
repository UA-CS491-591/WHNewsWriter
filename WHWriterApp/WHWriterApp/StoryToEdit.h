//
//  StoryToEdit.h
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/20/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthorObject.h"
#import "CategoryObject.h"

@interface StoryToEdit : NSObject

@property NSString *storyId;
@property NSString *storyTitle;
@property NSString *subtitle;
@property NSString *body;
@property NSDate *datePublished;
@property AuthorObject *author;
@property NSNumber *lat;
@property NSNumber *lng;
@property CategoryObject *category;
@property NSString *imageUrl;

+ (instancetype)sharedInstance;

@end
