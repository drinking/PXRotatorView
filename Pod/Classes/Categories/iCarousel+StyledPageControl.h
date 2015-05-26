//
// Created by drinking on 15/5/21.
// Copyright (c) 2015 BOOHEE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iCarousel/iCarousel.h>
#import "StyledPageControl.h"

typedef NS_ENUM(NSInteger , PXRotatorType){
    PXRotatorNumber = 0,
    PXPotatorWhiteDot,
    PXPotatorNone
};

@interface iCarousel (StyledPageControl)

@property (nonatomic, strong) StyledPageControl *pageControl;
@property (nonatomic, assign) PXRotatorType rotatorType;

- (void)updatePageControl;
- (void)setPageConrolCurrentPage:(NSInteger)index;
- (void)addDefaultPageControl;
- (void)addNumberPageControl;
@end