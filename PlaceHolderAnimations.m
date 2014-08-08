//
//  PlaceHolderAnimations.m
//  Autocomplete TextField
//
//  Created by Lowtrack on 07.08.14.
//  Copyright (c) 2014 AR for YOU. All rights reserved.
//

#import "PlaceHolderAnimations.h"

@implementation PlaceHolderAnimations

@synthesize placeHolder;
@synthesize placeHolderText;

# pragma mark - anim place holder

- (void) hidePlaceHolder{
    
    CATransition *transitionAnimation = [CATransition animation];
    
    [transitionAnimation setType:kCATransitionReveal];
    [transitionAnimation setDuration:0.4f];
    [transitionAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [transitionAnimation setFillMode:kCAFillModeBoth];
    [placeHolder.layer addAnimation:transitionAnimation forKey:@"fadeTransition"];
    placeHolder.text = placeHolderText;
}

- (void) showPlaceHolder{
    
    CATransition *transitionAnimation = [CATransition animation];
    
    [transitionAnimation setType:kCATransitionFade];
    [transitionAnimation setDuration:0.4f];
    [transitionAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [transitionAnimation setFillMode:kCAFillModeBoth];
    [placeHolder.layer addAnimation:transitionAnimation forKey:@"fadeTransition"];
    placeHolder.font = [UIFont systemFontOfSize:13];
    placeHolder.textColor = [UIColor colorWithRed:170.0/225.0 green:170.0/225.0 blue:170.0/225.0 alpha:1.0];
    placeHolder.text = placeHolderText;
    

    
}



- (void) movePlaceHolderUP {
    
    CGRect theFrame = [placeHolder frame];
    theFrame.origin.y = -20;

    [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionTransitionNone animations:^{
        placeHolder.frame = theFrame;
        
    }completion:^(BOOL finished) {
        NSLog(@"Animation is complete");

        
    }];
    
    int64_t delayInSeconds = 50;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_MSEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        CATransition *transitionAnimation = [CATransition animation];
        
        [transitionAnimation setType:kCATransitionFromBottom];
        [transitionAnimation setDuration:0.3f];
        [transitionAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
        [transitionAnimation setFillMode:kCAFillModeBoth];
        [placeHolder.layer addAnimation:transitionAnimation forKey:@"fadeTransition"];
        placeHolder.font = [UIFont systemFontOfSize:13];
        placeHolder.text = placeHolderText;
        placeHolder.textColor = [UIColor colorWithRed:61.0/225.0 green:71.0/225.0 blue:81.0/225.0 alpha:1.0];
    });

    
    
}

- (void) movePlaceHolderDOWN {
    
    CGRect theFrame = [placeHolder frame];
    theFrame.origin.y = 20;
    
    [UIView animateWithDuration:0.4f delay:0.0f options:UIViewAnimationOptionTransitionNone animations:^{
        placeHolder.frame = theFrame;
        
    }completion:^(BOOL finished) {
        NSLog(@"Animation is complete");
        
        
    }];
    
    int64_t delayInSeconds = 50;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_MSEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        CATransition *transitionAnimation = [CATransition animation];
        
        [transitionAnimation setType:kCATransitionFromBottom];
        [transitionAnimation setDuration:0.3f];
        [transitionAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
        [transitionAnimation setFillMode:kCAFillModeBoth];
        [placeHolder.layer addAnimation:transitionAnimation forKey:@"fadeTransition"];
        placeHolder.font = [UIFont systemFontOfSize:13];
        placeHolder.text = placeHolderText;
        placeHolder.textColor = [UIColor colorWithRed:61.0/225.0 green:71.0/225.0 blue:81.0/225.0 alpha:1.0];
    });

    
}

- (void) movePlaceHolderBack {
    
    CGRect theFrame = [placeHolder frame];
    theFrame.origin.y = 4;
    
    [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionTransitionNone animations:^{
        placeHolder.frame = theFrame;
        
    }completion:^(BOOL finished) {
        NSLog(@"Animation is complete");
        
        
    }];
    
    int64_t delayInSeconds = 50;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_MSEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    
    CATransition *transitionAnimation = [CATransition animation];
    
    [transitionAnimation setType:kCATransitionFade];
    [transitionAnimation setDuration:0.1f];
    [transitionAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [transitionAnimation setFillMode:kCAFillModeBoth];
    [placeHolder.layer addAnimation:transitionAnimation forKey:@"fadeTransition"];
    placeHolder.font = [UIFont systemFontOfSize:13];
    placeHolder.textColor = [UIColor colorWithRed:170.0/225.0 green:170.0/225.0 blue:170.0/225.0 alpha:1.0];
        
    });
    

    
    
}






@end
