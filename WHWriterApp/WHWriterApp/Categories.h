//
//  Categories.h
//  WHWriterApp
//
//  Created by Jack Gerrity on 5/20/14.
//  Copyright (c) 2014 CS491. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryObject.h"

@interface Categories : NSObject

@property NSArray *List;

+ (instancetype)sharedInstance;

@end
