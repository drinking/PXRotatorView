//
// Created by drinking on 15/5/20.
// Copyright (c) 2015 BOOHEE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iCarousel/iCarousel.h>
@class PXRotatorBaseViewModel;

@interface PXRotatorView : UIView
@property (nonatomic, strong) iCarousel *carousel;
- (void)startRotating;
- (void)stopRotating;
- (void)bindViewModel:(PXRotatorBaseViewModel *)viewModel;
@end