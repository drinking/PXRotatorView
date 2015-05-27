//
// Created by drinking on 15/5/27.
//

#import <Foundation/Foundation.h>
#import "PXRotatorView.h"
#import <iCarousel/iCarousel.h>
#import "StyledPageControl.h"

typedef NS_ENUM(NSInteger , PXRotatorType){
    PXRotatorNumber = 0,
    PXPotatorWhiteDot,
    PXPotatorNone
};

@interface PXRotatorView (StyledPageControl)

@property (nonatomic, strong) StyledPageControl *pageControl;
@property (nonatomic, assign) PXRotatorType rotatorType;

- (void)updatePageControl;
- (void)setPageConrolCurrentPage:(NSNumber *) index;
- (void)addDefaultPageControl;
- (void)addNumberPageControl;

@end