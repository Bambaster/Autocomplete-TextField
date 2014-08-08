//
//  ViewController.h
//  Autocomplete TextField
//
//  Created by Lowtrack on 07.08.14.
//  Copyright (c) 2014 AR for YOU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface demoPlaceholderViewController : UIViewController  <UITextFieldDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *placeHolderLabel;

@property (nonatomic,strong) UIPopoverController *popoverView;


@end
