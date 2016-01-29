//
//  TableViewCell.m
//  ProgrammaticTableView
//
//  Created by Jenny Gallagher on 1/27/16.
//  Copyright © 2016 Jenny Gallagher. All rights reserved.
//

#import "TableViewCell.h"


//@interface TableViewCell()
//
//
//
//@end

@implementation TableViewCell

//- (void)awakeFromNib {
//    // Initialization code
//}
NSString * const TableViewCellIdentifier = @"TableViewCellIdentifier";

-(id)init {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableViewCellIdentifier];
    
    //  Cell labels
    UILabel *trackLabel = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 0.0, 200.0, 30.0)];
    [trackLabel setFont:[UIFont systemFontOfSize:16]];
    [self.contentView addSubview:trackLabel];
    self.trackLabel = trackLabel;
    
    UILabel *collectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 18.0, 200.0, 30.0)];
    [collectionLabel setFont:[UIFont systemFontOfSize:16]];
    [self.contentView addSubview:collectionLabel];
    self.collectionLabel = collectionLabel;
    
    UILabel *artistLabel = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 0.0, 100.0, 30.0)];

    [artistLabel setFont:[UIFont systemFontOfSize:11]];
    [self.contentView addSubview:artistLabel];
    self.artistLabel = artistLabel;
    
    UILabel *trackPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 18.0, 100.0, 30.0)];
 
    [trackPriceLabel setFont:[UIFont systemFontOfSize:12]];
    [self.contentView addSubview:trackPriceLabel];
    self.trackPriceLabel = trackPriceLabel;
    
    self.trackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(3,2, 4, 4)];
    [self.contentView addSubview:self.trackImageView];
    
    return self;
}


@end
