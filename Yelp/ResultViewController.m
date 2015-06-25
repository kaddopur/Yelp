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
    
    // set TableView properties
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 72.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    // set SearchBar propterties
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    [searchBar sizeToFit];
    searchBar.searchBarStyle = UISearchBarStyleDefault;
    self.navigationItem.titleView = searchBar;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    
    // init TableView data
    self.businesses = [[NSMutableArray alloc] initWithArray:@[]];
    [self updateBusinessWithTerm:nil andLocation:nil andQuery:nil];
}

-(void)dismissKeyboard {
    [self.navigationItem.titleView resignFirstResponder];
}

- (void)updateBusinessWithTerm:(NSString *)searchTerm andLocation:(NSString *)searchLocation andQuery:(NSDictionary *)searchQuery {
    NSString *defaultTerm = @"dinner";
    NSString *defaultLocation = @"San Francisco, CA";
    NSDictionary *defaultQuery = @{};
    
    //Get the term and location from the command line if there were any, otherwise assign default values.
    //NSString *term = [[NSUserDefaults standardUserDefaults] valueForKey:@"term"] ?: defaultTerm;
    //NSString *location = [[NSUserDefaults standardUserDefaults] valueForKey:@"location"] ?: defaultLocation;
    
    NSString *term = searchTerm ?: defaultTerm;
    NSString *location = searchLocation ?: defaultLocation;
    NSDictionary *query = searchQuery ?: defaultQuery;
    
    YPAPISample *APISample = [[YPAPISample alloc] init];
    
    dispatch_group_t requestGroup = dispatch_group_create();
    
    dispatch_group_enter(requestGroup);
    [APISample queryTopBusinessInfoForTerm:term location:location query:query completionHandler:^(NSDictionary *businesses, NSError *error) {
        
        if (error) {
            NSLog(@"An error happened during the request: %@", error);
        } else if (businesses) {
            [self.businesses removeAllObjects];
            for(NSDictionary *business in businesses[@"businesses"]) {
                [self.businesses addObject:[[Business alloc] initWithData:business]];
            }
            [self.tableView reloadData];
        } else {
            NSLog(@"No business was found");
        }
        
        dispatch_group_leave(requestGroup);
    }];
    
    dispatch_group_wait(requestGroup, DISPATCH_TIME_FOREVER); // This avoids the program exiting before all our asynchronous callbacks have been made.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Filter delegate methods

- (void)filterViewController:(FilterViewController *)filterViewController didChangeFilters:(NSDictionary *)queryParams {
    // fire a new network event.
    [self updateBusinessWithTerm:nil andLocation:nil andQuery:queryParams];
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


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *nav = segue.destinationViewController;
    FilterViewController *vc = (FilterViewController *)nav.topViewController;
    vc.delegate = self;
    NSLog(@"%@", vc);
}


@end
