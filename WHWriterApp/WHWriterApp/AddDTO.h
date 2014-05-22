//
//  AddDTO.h
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/14/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddDTO : NSObject

@property NSString *title;
@property NSString *subtitle;
@property NSString *body;
@property NSString *authorId;
@property NSNumber *lat;
@property NSNumber *lng;
@property NSString *categoryId;
@property NSString *accessToken;
@property NSString *imageUrl;

@end
