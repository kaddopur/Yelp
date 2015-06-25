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
}

- (void)loadBusiness:(Business *)business {
    [self.coverImageView setImageWithURL:[NSURL URLWithString:business.coverImageUrl]];
    self.nameLabel.text = business.name;
    [self.ratingImageView setImageWithURL:[NSURL URLWithString:business.ratingImageUrl]];
    self.reviewLabel.text = business.review;
    self.addressLabel.text = business.address;
    self.categoriesLabel.text = business.categories;
    self.mileLabel.text = business.miles;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.nameLabel.preferredMaxLayoutWidth = self.nameLabel.frame.size.width;
}

@end
