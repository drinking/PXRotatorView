//
// Created by drinking on 15/5/20.
// Copyright (c) 2015 BOOHEE. All rights reserved.
//

#import "PXRotatorBaseViewModel.h"

@interface PXRotatorBaseViewModel ()
@end

@implementation PXRotatorBaseViewModel

- (instancetype)init {
    if(self = [super init]){
        _displayItems = [NSMutableArray array];
    }
    return self;
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return [self.displayItems count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{

    @throw [NSException exceptionWithName:@"Provide carousel view"
                                   reason:@"You should override this method"
                                 userInfo:nil];
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    //TODO:go to some view controller
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{

//    [carousel setPageConrolCurrentPage:carousel.currentItemIndex];

}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}



@end