//
//  ResultViewController.m
//  Yelp
//
//  Created by Jason Huang on 6/20/15.
//  Copyright (c) 2015 Jason Huang. All rights reserved.
//

#import "ResultViewController.h"
#import "ResultCell.h"
#import "YPAPISample.h"
#import "Business.h"
#import "UIImageView+AFNetworking.h"

@interface ResultViewController ()
@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.tableView.estimatedRowHeight = 72.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    [searchBar sizeToFit];
    searchBar.searchBarStyle = UISearchBarStyleDefault;
    self.navigationItem.titleView = searchBar;
    
    
    self.businesses = [[NSMutableArray alloc] initWithArray:@[]];
    
    
    [self updateBusinessWithTerm:nil andLocation:nil];
}

- (void)updateBusinessWithTerm:(NSString *)searchTerm andLocation:(NSString *)searchLocation {
    NSString *defaultTerm = @"dinner";
    NSString *defaultLocation = @"San Francisco, CA";
    
    //Get the term and location from the command line if there were any, otherwise assign default values.
    //NSString *term = [[NSUserDefaults standardUserDefaults] valueForKey:@"term"] ?: defaultTerm;
    //NSString *location = [[NSUserDefaults standardUserDefaults] valueForKey:@"location"] ?: defaultLocation;
    
    NSString *term = searchTerm ?: defaultTerm;
    NSString *location = searchLocation ?: defaultLocation;
    
    YPAPISample *APISample = [[YPAPISample alloc] init];
    
    dispatch_group_t requestGroup = dispatch_group_create();
    
    dispatch_group_enter(requestGroup);
    [APISample queryTopBusinessInfoForTerm:term location:location completionHandler:^(NSDictionary *businesses, NSError *error) {
        
        if (error) {
            NSLog(@"An error happened during the request: %@", error);
        } else if (businesses) {
            for(NSDictionary *business in businesses[@"businesses"]) {
                [self.businesses addObject:[[Business alloc] initWithData:business]];
            }
        } else {
            NSLog(@"No business was found");
        }
        
        [self.tableView reloadData];
        dispatch_group_leave(requestGroup);
    }];
    
    dispatch_group_wait(requestGroup, DISPATCH_TIME_FOREVER); // This avoids the program exiting before all our asynchronous callbacks have been made.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.businesses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ResultCellId" forIndexPath:indexPath];
    Business *business = self.businesses[indexPath.row];
    [cell loadBusiness:business];

    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
