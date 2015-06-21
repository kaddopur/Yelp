//
//  Business.m
//  Yelp
//
//  Created by Jason Huang on 6/21/15.
//  Copyright (c) 2015 Jason Huang. All rights reserved.
//

#import "Business.h"

@implementation Business

- (Business *)init {
    self = [super init];
    
    if (self) {
        self.name = @"Business name";
    }
    
    return self;
}

- (void)initializeWithData:(NSDictionary *)buninessData {
    self.name = @"asdf";
}

@end
