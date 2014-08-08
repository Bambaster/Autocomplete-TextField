//
//  ViewController.m
//  Autocomplete TextField
//
//  Created by Lowtrack on 07.08.14.
//  Copyright (c) 2014 AR for YOU. All rights reserved.
//

#import "demoPlaceholderViewController.h"
#import "PlaceHolderAnimations.h"
#import "popoverViewController.h"



@interface demoPlaceholderViewController ()


@property (strong, nonatomic) NSString * placeHolderValue;
@property (strong, nonatomic) IBOutlet UIView *textFieldView;
@property (strong, nonatomic) IBOutlet UITextField *textField;
- (IBAction)textFieldBeginAction:(id)sender;
- (IBAction)textFieldChangedAction:(id)sender;
- (IBAction)textFieldEndAction:(id)sender;





@end

@implementation demoPlaceholderViewController

@synthesize textField;
@synthesize textFieldView;
@synthesize placeHolderValue;

@synthesize popoverView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setViewBorder];
    
    placeHolderValue = @"Your Value"; //set your value for placeholder
    
    [self setPlaceHolderLabel];
        
    
    
}





#pragma mark - textfield methods


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.textField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) setViewBorder {
    
    textFieldView.layer.cornerRadius = 4;  //you can change radius if you want
    textFieldView.layer.borderWidth = 1; //you can change borderWidth
    textFieldView.layer.borderColor = [UIColor colorWithRed:61.0/225.0 green:71.0/225.0 blue:81.0/225.0 alpha:1.0].CGColor;
}


#pragma mark - actions

- (IBAction)textFieldBeginAction:(id)sender {

    // add your actions if it's need

}

- (IBAction)textFieldChangedAction:(id)sender {
    

    
    if ([textField.text length] > 0) {
        [self hidePlaceHolderLabel];
        
        //you can change animation style for hide placeholder
        
       // [self movePlaceHolderLabelUP];
    }
    
    else {
        
        //you can change animation style for show placeholder
    
        [self setPlaceHolderLabel];

      //  [self movePlaceHolderLabelBACK];

        
    }
}

- (IBAction)textFieldEndAction:(id)sender {
    

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
    [placeHolder movePlaceHolderUP];
}


- (void) movePlaceHolderLabelBACK {
    
    PlaceHolderAnimations * placeHolder = [[PlaceHolderAnimations alloc] init];
    placeHolder.placeHolder = self.placeHolderLabel;
    [placeHolder movePlaceHolderBack];
}








@end
