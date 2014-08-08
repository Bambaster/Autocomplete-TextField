//
//  popoverViewController.h
//  Autocomplete TextField
//
//  Created by Lowtrack on 07.08.14.
//  Copyright (c) 2014 AR for YOU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface popoverViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

{
    BOOL isSearchActive;
}


@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) NSMutableArray *autocompleteArray;
@property (nonatomic, strong) NSMutableArray *mainArray;





@end
