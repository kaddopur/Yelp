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
    
    self.filters = @{
                     @"deals": @[@"Offering a Deal"],
                     @"radius": @[@"Auto", @"100 meters", @"500 meters"],
                     @"sort" : @[@"best match", @"distance", @"highest rated"],
                     @"categories": @[]
                     };
    self.filterSectionTitles = @[@"deals", @"radius", @"sort", @"categories"];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    cell.toggleSwitch.on = NO;
    
    return cell;
}

#pragma mark - Private method

- (IBAction)onSearchButton:(id)sender {
    NSLog(@"%@", self.delegate);
    [self.delegate filterViewController:self didChangeFilters:@{@"asdf": @"zxcv"}];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onCancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
