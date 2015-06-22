//
//  Business.m
//  Yelp
//
//  Created by Jason Huang on 6/21/15.
//  Copyright (c) 2015 Jason Huang. All rights reserved.
//

#import "Business.h"
#import <CoreLocation/CoreLocation.h>

@implementation Business

- (Business *)initWithData:(NSDictionary *)businessData {
    self = [super init];
    
    if (self) {
        self.coverImageUrl = businessData[@"image_url"];
        self.name = businessData[@"name"];
        self.ratingImageUrl = businessData[@"rating_img_url"];
        self.review = [NSString stringWithFormat:@"%@ Reviews", businessData[@"review_count"]];
        self.address = [self getAddressWithBusiness:businessData];
        self.categories = [self getCategoriesWithBusiness:businessData];
        self.miles = [self getMilesWithBusiness:businessData];
    }
    
    return self;
}

- (NSString *)getMilesWithBusiness:(NSDictionary *)businessData {
    CLLocation const *center = [[CLLocation alloc] initWithLatitude:37.78387902553055
                                                          longitude:-122.401245644026];
    double const meterToMile = 0.000621371;
    
    double businessLat = [[businessData valueForKeyPath:@"location.coordinate.latitude"] doubleValue];
    double businessLng = [[businessData valueForKeyPath:@"location.coordinate.longitude"] doubleValue];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:businessLat
                                                      longitude:businessLng];
    
    return [NSString stringWithFormat:@"%.1f mi", [location distanceFromLocation:center] * meterToMile];
}

- (NSString *)getCategoriesWithBusiness:(NSDictionary *)businessData {
    NSMutableArray *categoryTags = [NSMutableArray arrayWithArray:@[]];
    
    for (NSArray *category in businessData[@"categories"]) {
        [categoryTags addObject:category[0]];
    }
    
    return [categoryTags componentsJoinedByString:@", "];
}

- (NSString *)getAddressWithBusiness:(NSDictionary *)businessData {
    NSArray *displayAddress = [[businessData valueForKeyPath:@"location.display_address"] subarrayWithRange:NSMakeRange(0, 2)];
    return [displayAddress componentsJoinedByString:@", "];
}
@end