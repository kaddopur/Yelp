//
//  FilterViewController.h
//  Yelp
//
//  Created by Jason Huang on 6/21/15.
//  Copyright (c) 2015 Jason Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterCell.h"

@class FilterViewController;


@protocol FilterViewControllerDelegate <NSObject>

- (void)filterViewController:(FilterViewController *)filterViewController didChangeFilters:(NSDictionary *)queryParams;

@end


@interface FilterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, FilterCellDelegate>

@property (weak, nonatomic) id<FilterViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDictionary *filters;
@property (strong, nonatomic) NSArray *filterSectionTitles;
@property (strong, nonatomic) NSMutableSet *activeFilters;
@property (weak, nonatomic) NSUserDefaults *defaults;

- (IBAction)onSearchButton:(id)sender;
- (IBAction)onCancelButton:(id)sender;

@end
