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
    
    self.animals = @[@"Bear", @"Black Swan", @"Buffalo", @"Camel", @"Cockatoo", @"Dog", @"Donkey", @"Emu", @"Giraffe", @"Greater Rhea", @"Hippopotamus", @"Horse", @"Koala", @"Lion", @"Llama", @"Manatus", @"Meerkat", @"Panda", @"Peacock", @"Pig", @"Platypus", @"Polar Bear", @"Rhinoceros", @"Seagull", @"Tasmania Devil", @"Whale", @"Whale Shark", @"Wombat"];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FilterCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"FilterCellId" forIndexPath:indexPath];
    
    cell.titleLabel.text = (NSString *)self.animals[indexPath.row];
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
