//
//  ResultViewController.h
//  Yelp
//
//  Created by Jason Huang on 6/20/15.
//  Copyright (c) 2015 Jason Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterViewController.h"

@interface ResultViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, FilterViewControllerDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray *businesses;
@property (strong, nonatomic) NSDictionary *queryParams;

- (void)updateBusinessWithTerm:(NSString *)searchTerm andLocation:(NSString *)searchLocation andQuery:(NSDictionary *)searchQuery;

@end
