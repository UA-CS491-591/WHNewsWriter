//
//  TokenAuthorIdObject.h
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/16/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TokenAuthorIdObject : NSObject

@property NSString *authorId;
@property NSString *accessToken;

+ (instancetype)sharedInstance;

@end
