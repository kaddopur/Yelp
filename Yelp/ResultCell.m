//
//  ResultCell.m
//  Yelp
//
//  Created by Jason Huang on 6/20/15.
//  Copyright (c) 2015 Jason Huang. All rights reserved.
//

#import "ResultCell.h"

@implementation ResultCell

- (void)awakeFromNib {
    self.nameLabel.preferredMaxLayoutWidth = self.nameLabel.frame.size.width;
    
    self.coverImageView.layer.cornerRadius = 3.0;
    self.coverImageView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.nameLabel.preferredMaxLayoutWidth = self.nameLabel.frame.size.width;
}

@end
