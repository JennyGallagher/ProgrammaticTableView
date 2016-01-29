//
//  TableViewController.h
//  ProgrammaticTableView
//
//  Created by Jenny Gallagher on 1/26/16.
//  Copyright © 2016 Jenny Gallagher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

@interface TableViewController : UITableViewController <UISearchBarDelegate>

@property (strong, nonatomic) NSMutableArray *resultsArray;

@end
