//
//  TableViewController.m
//  ProgrammaticTableView
//
//  Created by Jenny Gallagher on 1/26/16.
//  Copyright © 2016 Jenny Gallagher. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) NSURLSessionDataTask *dataTask;

@end

@implementation TableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchBar.delegate = self;
    self.searchBar = self.searchController.searchBar;
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
    
    [self performSearch];
    
}

- (void)performSearch {
    
    NSString *query = self.searchBar.text;
    NSLog(@"%@", query);
    
    if (self.dataTask) {
        [self.dataTask cancel];
    }
    
    self.dataTask = [[NSURLSession sharedSession] dataTaskWithURL:[self urlForQuery:query] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (response) {
            
            NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                           options:kNilOptions
                                                                             error:&error];
            
            NSArray *jsonArray = [jsonDictionary objectForKey:@"results"];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self processResults:jsonArray];
                
            });
            
        }}];
    
    if (self.dataTask) {
        [self.dataTask resume];
    }
    
}

- (NSURL *)urlForQuery:(NSString *)query {
    query = [query stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&entity=musicTrack", query]];
    
}

- (void)processResults:(NSArray *)results {
    if (!self.resultsArray) {
        self.resultsArray = [NSMutableArray array];
    }
    
    // Update Data Source
    [self.resultsArray removeAllObjects];
    
    [self.resultsArray addObjectsFromArray:results];
    
    // Update Table View
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.resultsArray ? self.resultsArray.count : 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    if (!cell) {
        cell = [[TableViewCell alloc] init];
    }
    cell.trackLabel.text = [self.resultsArray[indexPath.row] valueForKey:@"trackName"];
    cell.artistLabel.text = [self.resultsArray[indexPath.row] valueForKey:@"artistName"];
    cell.collectionLabel.text = [self.resultsArray[indexPath.row] valueForKey:@"collectionName"];
    cell.trackPriceLabel.text = [NSString stringWithFormat:@"Song: $%@",[self.resultsArray[indexPath.row] valueForKey:@"trackPrice"]];
    
    NSData *thumbnail = [NSData dataWithContentsOfURL:[NSURL URLWithString:[self.resultsArray[indexPath.row] valueForKey:@"artworkUrl100"]]];
    if (thumbnail) {
        cell.trackImageView.image = [UIImage imageWithData:thumbnail];
      
    }
    return cell;
}
//
//func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
//{
//    return 100.0;//Choose your custom row height
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
};

#pragma mark UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[self.resultsArray[indexPath.row]valueForKey:@"trackViewUrl"]]]];
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if (!searchText) return;
    
    if (searchText.length <= 3) {
        [self.resultsArray removeAllObjects];
        [self.tableView reloadData];
    } else {
        [self performSearch];
        
    }
}



@end

