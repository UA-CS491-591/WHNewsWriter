//
//  Categories.m
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/20/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "Categories.h"

@implementation Categories

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

@end
