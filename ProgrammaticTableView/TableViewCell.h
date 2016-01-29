//
//  TableViewCell.h
//  ProgrammaticTableView
//
//  Created by Jenny Gallagher on 1/27/16.
//  Copyright © 2016 Jenny Gallagher. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TableViewCell : UITableViewCell

extern NSString * const TableViewCellIdentifier;

@property (nonatomic, strong) UILabel *artistLabel;
@property (nonatomic, strong) UILabel *trackLabel;
@property (nonatomic, strong) UILabel *collectionLabel;
@property (nonatomic, strong) UILabel *trackPriceLabel;
@property (nonatomic, strong) UIImageView *trackImageView;

@end
