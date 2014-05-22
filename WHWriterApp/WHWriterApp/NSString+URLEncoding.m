//
//  NSString+URLEncoding.m
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/22/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "NSString+URLEncoding.h"

@implementation NSString (NSString_URLEncoding)

- (NSString *)urlEncodeUsingEncoding:(CFStringEncoding)encoding {
    
    return CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
        (__bridge CFStringRef)self, NULL, CFSTR("!*'();:@&=+$,/?%#[]"), encoding));
}

- (NSString *)urlEncode {
    
    return [self urlEncodeUsingEncoding:kCFStringEncodingUTF8];
}
@end