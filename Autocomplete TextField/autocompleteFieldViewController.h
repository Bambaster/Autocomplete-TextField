//
//  autocompleteFieldViewController.h
//  Autocomplete TextField
//
//  Created by Lowtrack on 07.08.14.
//  Copyright (c) 2014 AR for YOU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface autocompleteFieldViewController : UIViewController <UITextFieldDelegate, UIPopoverControllerDelegate, UITabBarControllerDelegate>

{
    
    BOOL isPopoverActive;
    
}

@property (strong, nonatomic) IBOutlet UILabel *placeHolderLabel;

@property (nonatomic,strong) UIPopoverController *popoverView;


@end
