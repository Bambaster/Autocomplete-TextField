//
//  PlaceHolderAnimations.h
//  Autocomplete TextField
//
//  Created by Lowtrack on 07.08.14.
//  Copyright (c) 2014 AR for YOU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlaceHolderAnimations : NSObject


@property (nonatomic, strong) UILabel * placeHolder;
@property (nonatomic, strong) NSString * placeHolderText;







- (void) hidePlaceHolder;
- (void) showPlaceHolder;
- (void) movePlaceHolderUP;
- (void) movePlaceHolderBack;
- (void) movePlaceHolderDOWN;



@end
