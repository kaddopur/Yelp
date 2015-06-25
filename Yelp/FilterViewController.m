//
//  FilterViewController.m
//  Yelp
//
//  Created by Jason Huang on 6/21/15.
//  Copyright (c) 2015 Jason Huang. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()
@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getInitialState];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Private methods

- (void) getInitialState {
    self.filters = @{
                     @"deals": @[@"Offering a Deal"],
                     @"radius": @[@"Auto", @"100 meters", @"500 meters"],
                     @"sort" : @[@"Best matched", @"Distance", @"Highest rated"],
                     @"categories": @[@"Barbeque", @"Cafeteria", @"Steakhouses", @"Sushi Bars"]
                     };
    self.filterSectionTitles = @[@"deals", @"radius", @"sort", @"categories"];
    self.activeFilters = [NSMutableSet set];
}

#pragma mark - FilterCell Delegate

- (void)filterCell:(FilterCell *)filterCell didChangeState:(NSDictionary *)state {
    NSString *filter = state[@"filter"];
    NSString *section = state[@"section"];
    
    if ([state[@"on"] integerValue] == 1) {
        if (![section isEqualToString:@"categories"]) {
            for(NSString *siblingFilter in self.filters[section]) {
                [self.activeFilters removeObject:siblingFilter];
            }
        }
        [self.activeFilters addObject:filter];
    } else {
        [self.activeFilters removeObject:filter];
    }
    [self.tableView reloadData];
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.filterSectionTitles.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.filterSectionTitles[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionTitle = self.filterSectionTitles[section];
    NSArray *sectionFilters = self.filters[sectionTitle];
    return [sectionFilters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FilterCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"FilterCellId" forIndexPath:indexPath];
    
    NSString *sectionTitle = self.filterSectionTitles[indexPath.section];
    NSArray *sectionFilters = self.filters[sectionTitle];
    NSString *filter = sectionFilters[indexPath.row];
    
    cell.titleLabel.text = filter;
    cell.sectionTitle = sectionTitle;
    cell.toggleSwitch.on = [self.activeFilters containsObject:filter];
    cell.delegate = self;
    
    return cell;
}

#pragma mark - Private method

- (NSDictionary *)formatQuery {
    NSMutableDictionary *queryParams = [NSMutableDictionary dictionary];
    NSMutableArray *categories = [NSMutableArray array];
    
    for (NSString *section in self.filters) {
        for (NSString *filter in self.filters[section]) {
            if ([self.activeFilters containsObject:filter]) {
                if (![section isEqualToString:@"categories"]) {
                    [queryParams setValue:filter forKey:section];
                    break;
                } else {
                    [categories addObject:filter];
                }
            }
        }
    }
    [queryParams setValue:categories forKey:@"categories"];
    
    return queryParams;
}

- (IBAction)onSearchButton:(id)sender {
    [self.delegate filterViewController:self didChangeFilters:[self formatQuery]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onCancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
