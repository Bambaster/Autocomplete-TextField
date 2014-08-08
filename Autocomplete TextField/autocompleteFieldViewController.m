//
//  autocompleteFieldViewController.m
//  Autocomplete TextField
//
//  Created by Lowtrack on 07.08.14.
//  Copyright (c) 2014 AR for YOU. All rights reserved.
//

#import "autocompleteFieldViewController.h"
#import "PlaceHolderAnimations.h"
#import "popoverViewController.h"

@interface autocompleteFieldViewController ()


@property (strong, nonatomic) IBOutlet UITabBarItem *tabBar;


@property (strong, nonatomic) NSString * placeHolderValue;
@property (strong, nonatomic) IBOutlet UIView *textFieldView;
@property (strong, nonatomic) IBOutlet UITextField *textField;
- (IBAction)textFieldBeginAction:(id)sender;
- (IBAction)textFieldChangedAction:(id)sender;
- (IBAction)textFieldEndAction:(id)sender;

@end

@implementation autocompleteFieldViewController

@synthesize textField;
@synthesize textFieldView;
@synthesize placeHolderValue;

@synthesize popoverView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    isPopoverActive = NO;
    [self setViewBorder];
    
    placeHolderValue = @"Your Value";
    [self setPlaceHolderLabel];

    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dismissPoppover:) name:@"CurrentValue" object:nil];
    
    
    self.tabBarController.delegate = self;
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
    textField.text = @"";
    [self setPlaceHolderLabel];


    

}







#pragma mark - textfield methods


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ReloadTable" object:nil userInfo:nil];
    [popoverView dismissPopoverAnimated:YES];
    isPopoverActive = NO;
    [self.textField resignFirstResponder];
    

    
    return YES;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"RemoveData" object:nil userInfo:nil];
    
    isPopoverActive = NO;
    
    NSLog(@"popover dissmised");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    
    [popoverView dismissPopoverAnimated:YES];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void) setViewBorder {
    
    textFieldView.layer.cornerRadius = 4;  //you can change radius if you want
    textFieldView.layer.borderWidth = 1; //you can change borderWidth
    textFieldView.layer.borderColor = [UIColor colorWithRed:61.0/225.0 green:71.0/225.0 blue:81.0/225.0 alpha:1.0].CGColor;
}


#pragma mark - actions

- (IBAction)textFieldBeginAction:(id)sender {
    
    [self showPopover];

    if ([textField.text length] != 0){
    int64_t delayInSeconds = 300;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_MSEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [self setSearchValue:textField.text];
        isPopoverActive = YES;
        
    });
        
    }
    
    else {
        
        isPopoverActive = YES;

    }
    
    
}

- (IBAction)textFieldChangedAction:(id)sender {

    
    if ([textField.text length] != 0) {
        //[self hidePlaceHolderLabel];
        
        [self movePlaceHolderLabelUP];
        [self setSearchValue:textField.text];
        
        if (!isPopoverActive) {
            
            [self showPopover];

            int64_t delayInSeconds = 300;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_MSEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                
            [self setSearchValue:textField.text];
            isPopoverActive = YES;
                
                
            });


            
        }

    }
    
    else if (!isPopoverActive && [textField.text length] == 0) {
        
        [self showPopover];
        [self setSearchValue:textField.text];
        isPopoverActive = YES;
        
    }
    

    
    else {
        
        [self movePlaceHolderLabelBACK];
        //   [self setPlaceHolderLabel];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ReloadTable" object:nil userInfo:nil];

        
        
        
    }
}

- (IBAction)textFieldEndAction:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ReloadTable" object:nil userInfo:nil];
    [popoverView dismissPopoverAnimated:YES];
    isPopoverActive = NO;

}


#pragma mark - placeholder animations

- (void) setPlaceHolderLabel {
    
    PlaceHolderAnimations * placeHolder = [[PlaceHolderAnimations alloc] init];
    placeHolder.placeHolder = self.placeHolderLabel;
    placeHolder.placeHolderText = placeHolderValue;
    [placeHolder showPlaceHolder];
}

- (void) hidePlaceHolderLabel {
    
    PlaceHolderAnimations * placeHolder = [[PlaceHolderAnimations alloc] init];
    placeHolder.placeHolder = self.placeHolderLabel;
    placeHolder.placeHolderText = @"";
    [placeHolder hidePlaceHolder];
}

- (void) movePlaceHolderLabelUP {
    
    PlaceHolderAnimations * placeHolder = [[PlaceHolderAnimations alloc] init];
    placeHolder.placeHolder = self.placeHolderLabel;
    placeHolder.placeHolderText = placeHolderValue;
    [placeHolder movePlaceHolderUP];
}


- (void) movePlaceHolderLabelBACK {
    
    PlaceHolderAnimations * placeHolder = [[PlaceHolderAnimations alloc] init];
    placeHolder.placeHolder = self.placeHolderLabel;
    [placeHolder movePlaceHolderBack];
}




#pragma mark - popover

- (void) showPopover {
    
    int width;
    int height;

    
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {

        width = 320;
        height = 300;
        
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:[NSBundle mainBundle]];
        
        popoverViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"popover"];
        // To get popup custome view put popUpView initWithContentViewControlle:controller
        
        popoverView =[[UIPopoverController alloc]initWithContentViewController:controller];
        
        [popoverView setPopoverContentSize:CGSizeMake(width,height)];
        [popoverView presentPopoverFromRect:textFieldView.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        
        popoverView.delegate = self;
    
    }
    
    else {
        
        width = 200;
        height = 180;
        
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:[NSBundle mainBundle]];
        
        popoverViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"popover"];
        // To get popup custome view put popUpView initWithContentViewControlle:controller
        
        popoverView =[[UIPopoverController alloc]initWithContentViewController:controller];
        
        [popoverView setPopoverContentSize:CGSizeMake(width,height)];
        [popoverView presentPopoverFromRect:textFieldView.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        
        popoverView.delegate = self;
        
    }
    
    


    
}


#pragma mark - search method

- (void) setSearchValue: (NSString *) searchString {
    
    
    NSMutableDictionary * Search = [[NSMutableDictionary alloc] init];
    [Search setValue:searchString forKey:@"searchString"];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"SearchPopover" object:nil userInfo:Search];
    
}



- (void) dismissPoppover:(NSNotification*) notification
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ReloadTable" object:nil userInfo:nil];

    [self movePlaceHolderLabelUP];

    [popoverView dismissPopoverAnimated:YES];
    
    textField.text = [notification.userInfo valueForKey:@"CurrentValue"];
    
    isPopoverActive = NO;
    


}




@end
