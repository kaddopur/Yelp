//
//  ResultViewController.h
//  Yelp
//
//  Created by Jason Huang on 6/20/15.
//  Copyright (c) 2015 Jason Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterViewController.h"

@interface ResultViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, FilterViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *businesses;

- (void)updateBusinessWithTerm:(NSString *)searchTerm andLocation:(NSString *)searchLocation;

@end
