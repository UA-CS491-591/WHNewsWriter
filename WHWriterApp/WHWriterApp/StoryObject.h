//
//  WHStoryObject.h
//  WHNewsReader
//
//  Created by Mason Saucier on 5/12/14.
//
//

#import <Foundation/Foundation.h>
#import "AuthorObject.h"
#import "CategoryObject.h"
#import "NSObject+ObjectMap.h"

@interface StoryObject : NSObject

@property NSString *storyId;
@property NSString *title;
@property NSString *subtitle;
@property NSString *body;
@property NSDate *datePublished;
@property AuthorObject *author;
@property NSNumber *lat;
@property NSNumber *lng;
@property CategoryObject *category;
@property NSString *imageUrl;

@end
