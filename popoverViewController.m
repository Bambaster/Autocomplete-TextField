//
//  popoverViewController.m
//  Autocomplete TextField
//
//  Created by Lowtrack on 07.08.14.
//  Copyright (c) 2014 AR for YOU. All rights reserved.
//

#import "popoverViewController.h"

@interface popoverViewController ()

@end

@implementation popoverViewController

@synthesize autocompleteArray;
@synthesize mainArray;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //just insert you array
    
    mainArray = [[NSMutableArray alloc] init];

    autocompleteArray = [[NSMutableArray alloc] init];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(search:) name:@"SearchPopover" object:nil];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setSearchActiveNO) name:@"ReloadTable" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setSearchActiveYES) name:@"ReloadTableWithSearch" object:nil];

    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removeData) name:@"RemoveData" object:nil];

    isSearchActive = NO;

    
}


- (void) setSearchActiveNO {
    
    isSearchActive = NO;
    [self reloadTable];

}

- (void) setSearchActiveYES {
    
    isSearchActive = YES;
}

- (void) removeData {
    
    [autocompleteArray removeAllObjects];

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    mainArray = [[NSMutableArray alloc] initWithObjects: @"Farrah", @"Laviolette", @"Heal", @"Sechrest", @"Roots",
                 @"Homan", @"Starns", @"Oldham", @"Yocum", @"Mancia",
                 @"Prill", @"Lush", @"Piedra", @"Castenada", @"Warnock",
                 @"Vanderlinden", @"Simms", @"Gilroy", @"Brann", @"Bodden",
                 @"Lenz", @"Gildersleeve", @"Wimbish", @"Bello", @"Beachy",
                 @"Jurado", @"William", @"Beaupre", @"Dyal", @"Doiron",
                 @"Plourde", @"Bator", @"Krause", @"Odriscoll", @"Corby",
                 @"Waltman", @"Michaud", @"Kobayashi", @"Sherrick", @"Woolfolk",
                 @"Holladay", @"Hornback", @"Moler", @"Bowles", @"Libbey",
                 @"Spano", @"Folson", @"Arguelles", @"Burke", @"Rook", nil];

    
    [self reloadTable];

    
    
}




#pragma mark UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section {
    
    if (isSearchActive) {
    
    return autocompleteArray.count;

    }
    
    else {
    
    return mainArray.count;
    
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"AutoCompleteRowIdentifier";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    

    if (isSearchActive) {

    cell.textLabel.text = [autocompleteArray objectAtIndex:indexPath.row];
    }
    
    else {
        
    cell.textLabel.text = [mainArray objectAtIndex:indexPath.row];

    }
    
    return cell;
}

#pragma mark UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * cellText = [[NSString alloc]init];
    
    if (isSearchActive) {
        
        cellText = [autocompleteArray objectAtIndex:indexPath.row];
    }
    
    else {
        
       cellText = [mainArray objectAtIndex:indexPath.row];
        
    }
    
    
    NSLog(@"cellText %@", cellText);
    
    NSMutableDictionary * dictSearch = [[NSMutableDictionary alloc] init];
    [dictSearch setValue:cellText forKey:@"CurrentValue"];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"CurrentValue" object:nil userInfo:dictSearch];
    
    
}


- (void)reloadTable {
    
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationRight];
    
}




#pragma mark - search method

- (void) search:(NSNotification*) notification  {
    
    isSearchActive = YES;

    NSString * searchText  = [notification.userInfo valueForKey:@"searchString"];

    NSLog(@"Previous Search Results were removed.");
    [autocompleteArray removeAllObjects];
    for (NSString *role in mainArray)
    {
        
        NSComparisonResult result = [role compare:searchText
                                          options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)
                                            range:NSMakeRange(0, [searchText length])];
        if (result == NSOrderedSame)
        {
            NSLog(@"Adding role.name to searchResults as it begins with search text %@", searchText);
            [autocompleteArray addObject:role];
        }
    }
    
    [self reloadTable];
}


@end
