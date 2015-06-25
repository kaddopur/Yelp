//
//  FilterCell.h
//  Yelp
//
//  Created by Jason Huang on 6/25/15.
//  Copyright (c) 2015 Jason Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
@end
