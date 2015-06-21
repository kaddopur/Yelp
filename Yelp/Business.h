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
@property (strong, nonatomic) NSString *review;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *categories;
@property (strong, nonatomic) NSString *coverImageUrl;
@property (strong, nonatomic) NSString *ratingImageUrl;

- (Business *)initWithData:(NSDictionary *)businessData;

@end
