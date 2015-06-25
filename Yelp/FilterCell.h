//
//  FilterCell.h
//  Yelp
//
//  Created by Jason Huang on 6/25/15.
//  Copyright (c) 2015 Jason Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilterCell;


@protocol FilterCellDelegate <NSObject>

- (void)filterCell:(FilterCell *)filterCell didChangeState:(NSDictionary *)state;

@end


@interface FilterCell : UITableViewCell

@property (weak, nonatomic) id<FilterCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
@property (strong, nonatomic) NSString *sectionTitle;

- (IBAction)onSwitchToggled:(id)sender;

@end
