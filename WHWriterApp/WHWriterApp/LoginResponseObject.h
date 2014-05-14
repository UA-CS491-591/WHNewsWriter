//
//  LoginResponseObject.h
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/14/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthorObject.h"
#import "NSObject+ObjectMap.h"

@interface LoginResponseObject : NSObject

@property NSString *accessToken;
@property AuthorObject *user;

@end
