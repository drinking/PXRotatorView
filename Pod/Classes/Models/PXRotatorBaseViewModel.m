//
// Created by drinking on 15/5/20.
// Copyright (c) 2015 BOOHEE. All rights reserved.
//

#import "PXRotatorBaseViewModel.h"

@interface PXRotatorBaseViewModel ()
@end

@implementation PXRotatorBaseViewModel

- (instancetype)init {
    if (self = [super init]) {
        _displayItems = [NSMutableArray array];
    }
    return self;
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return [self.displayItems count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {

    @throw [NSException exceptionWithName:@"Provide carousel view"
                                   reason:@"You should override this method"
                                 userInfo:nil];
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
#pragma GCC diagnostic ignored "-Wundeclared-selector"
    if ([carousel.superview respondsToSelector:@selector(setPageConrolCurrentPage:)]) {
        [carousel.superview performSelector:@selector(setPageConrolCurrentPage:) withObject:@(carousel.currentItemIndex) afterDelay:0];
    }

}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

- (void)carouselWillBeginDragging:(iCarousel *)carousel {
    carousel.scrollEnabled = [self.displayItems count] > 1;
}

@end