//
//  FilterViewController.h
//  Yelp
//
//  Created by Jason Huang on 6/21/15.
//  Copyright (c) 2015 Jason Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilterViewController;

@protocol FilterViewControllerDelegate <NSObject>

- (void)filterViewController:(FilterViewController *)filterViewController didChangeFilters:(NSDictionary *)filters;

@end

@interface FilterViewController : UIViewController

@property (weak, nonatomic) id<FilterViewControllerDelegate> delegate;

- (IBAction)onSearchButton:(id)sender;
- (IBAction)onCancelButton:(id)sender;

@end
