//
//  WHStoryObject.h
//  WHNewsReader
//
//  Created by Mason Saucier on 5/12/14.
//
//

#import <Foundation/Foundation.h>
#import "WHAuthorObject.h"
#import "WHCategoryObject.h"
#import "NSObject+ObjectMap.h"

@interface WHStoryObject : NSObject

@property NSString *title;
@property NSString *subtitle;
@property NSString *body;
@property NSDate *datePublished;
@property WHAuthorObject *author;
@property NSNumber *lat;
@property NSNumber *lng;
@property WHCategoryObject *category;
@property NSString *accessToken;
@property NSString *imageUrl;

@end
