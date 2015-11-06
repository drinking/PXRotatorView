//
// Created by drinking on 15/5/20.
// Copyright (c) 2015 BOOHEE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iCarousel/iCarousel.h>
#import "PXRotatorBaseViewModel.h"

@interface PXRotatorView : UIView

@property(nonatomic, strong) PXRotatorBaseViewModel *viewModel;
@property(nonatomic, assign) NSInteger interval;
@property(nonatomic, assign) BOOL isRotating;
@property(nonatomic, strong) iCarousel *carousel;

- (void)startRotating;

- (void)stopRotating;

- (void)bindViewModel:(PXRotatorBaseViewModel *)viewModel;
@end