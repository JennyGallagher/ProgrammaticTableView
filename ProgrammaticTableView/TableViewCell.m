//
//  TableViewCell.m
//  ProgrammaticTableView
//
//  Created by Jenny Gallagher on 1/27/16.
//  Copyright © 2016 Jenny Gallagher. All rights reserved.
//

#import "TableViewCell.h"

NSString * const kCellIdentifier = @"TableViewCellIdentifier";

@implementation TableViewCell


-(id)init {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    

    //  Cell labels
    UILabel *artistLabel = [[UILabel alloc] init];
    [artistLabel setFont:[UIFont systemFontOfSize:15 weight:0.3]];
    [self.contentView addSubview:artistLabel];
    self.artistLabel = artistLabel;
    

    UILabel *trackLabel = [[UILabel alloc] init];
    [trackLabel setFont:[UIFont systemFontOfSize:15]];
    [self.contentView addSubview:trackLabel];
    self.trackLabel = trackLabel;
    

    UILabel *collectionLabel = [[UILabel alloc] init];
    [collectionLabel setFont:[UIFont systemFontOfSize:12]];
    [self.contentView addSubview:collectionLabel];
    self.collectionLabel = collectionLabel;

    UILabel *trackPriceLabel = [[UILabel alloc] init];
    [trackPriceLabel setFont:[UIFont systemFontOfSize:11]];
    [self.contentView addSubview:trackPriceLabel];
    self.trackPriceLabel = trackPriceLabel;
    
    UIImageView *trackImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:trackImageView];
    self.trackImageView = trackImageView;
    
    [self configureConstraintsForSubviews];
    
    return self;
}

- (void)configureConstraintsForSubviews
{
    UIImageView *trackImageView = _trackImageView;
    UILabel *artistLabel = _artistLabel;
    UILabel *trackLabel = _trackLabel;
    UILabel *collectionLabel = self.collectionLabel;
    UILabel *trackPriceLabel = self.trackPriceLabel;
    
    [trackImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [artistLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [trackLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collectionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [trackPriceLabel setTranslatesAutoresizingMaskIntoConstraints:NO];

    
    // trackImageView constraints
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:trackImageView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0f
                                                                  constant:0.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:trackImageView
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1.0f
                                                                  constant:5.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:trackImageView
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:0
                                                                multiplier:1.0f
                                                                  constant:60.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:trackImageView
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:0
                                                                multiplier:1.0f
                                                                  constant:60.0f]];
    // artistLabel constraints
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:artistLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0f
                                                                  constant:2.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:artistLabel
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:trackImageView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0f
                                                                  constant:5.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:artistLabel
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:trackImageView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0f
                                                                  constant:5.0f]];
    // trackLabel constraints
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:trackLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:artistLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:0.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:trackLabel
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:trackImageView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0f
                                                                  constant:5.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:trackLabel
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0f
                                                                  constant:-10.0]];
    // collectionLabel contraints
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:collectionLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:trackLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:0.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:collectionLabel
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:trackImageView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0f
                                                                  constant:5.0f]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:collectionLabel
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0f
                                                                  constant:-10.0]];
    // trackPriceLabel contraints
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:trackPriceLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:collectionLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:0.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:trackPriceLabel
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:trackImageView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0f
                                                                  constant:5.0f]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:trackPriceLabel
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0f
                                                                  constant:-10.0]];
    

}


@end
