//
//  NSString+URLEncoding.h
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/22/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSString_URLEncoding)

- (NSString *)urlEncodeUsingEncoding:(CFStringEncoding)encoding;
- (NSString *)urlEncode;

@end
