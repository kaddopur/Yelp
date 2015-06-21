//
//  Business.h
//  Yelp
//
//  Created by Jason Huang on 6/21/15.
//  Copyright (c) 2015 Jason Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Business : NSObject

@property (strong, nonatomic) NSString *name;

- (void)initializeWithData:(NSDictionary *)buninessData;

@end
