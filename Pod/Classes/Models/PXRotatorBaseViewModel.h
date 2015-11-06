//
// Created by drinking on 15/5/20.
// Copyright (c) 2015 BOOHEE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iCarousel/iCarousel.h>

@interface PXRotatorBaseViewModel : NSObject<iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, strong) NSMutableArray *displayItems;

@end