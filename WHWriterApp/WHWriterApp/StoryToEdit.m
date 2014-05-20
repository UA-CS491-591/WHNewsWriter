//
//  StoryToEdit.m
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/20/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import "StoryToEdit.h"

@implementation StoryToEdit

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        CategoryObject *_category = [[CategoryObject alloc] init];
        AuthorObject *_author = [[AuthorObject alloc] init];
    });
    
    return sharedInstance;
}

@end
