//
//  EditDTO.h
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/14/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+ObjectMap.h"
#import "StoryObject.h"

@interface EditDTO : NSObject

@property StoryObject *story;
@property NSString *accessToken;

@end
