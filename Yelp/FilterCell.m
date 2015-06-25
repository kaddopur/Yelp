//
//  FilterCell.m
//  Yelp
//
//  Created by Jason Huang on 6/25/15.
//  Copyright (c) 2015 Jason Huang. All rights reserved.
//

#import "FilterCell.h"

@implementation FilterCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)onSwitchToggled:(id)sender {
    NSDictionary *state = @{
                            @"section": self.sectionTitle,
                            @"filter": self.titleLabel.text,
                            @"on": [NSNumber numberWithBool:self.toggleSwitch.on]};
    [self.delegate filterCell:self
               didChangeState:state];
}
@end
