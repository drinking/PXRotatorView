//
// Created by drinking on 15/11/11.
// Copyright (c) 2015 drinking. All rights reserved.
//

#import "PXRotatorChaoMoViewModel.h"


@implementation PXRotatorChaoMoViewModel {

}

- (instancetype)init {
    if(self = [super init]){
        _scaleRatio = 0.91;
    }
    return self;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    UIImageView *imageView = (UIImageView *) view;
    if (!view) {
        imageView = [[UIImageView alloc] initWithFrame:carousel.bounds];
        imageView.layer.masksToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
    }

    NSString *imageName = self.displayItems[index];
    [imageView setImage:[UIImage imageNamed:imageName]];
    return imageView;
}

- (CATransform3D)carousel:(__unused iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform {

    CGFloat absf = fabsf(offset);
    CGFloat ratio = absf>=1?self.scaleRatio:(1 - 0.09f * fabsf(offset));
    transform = CATransform3DTranslate(transform, offset * carousel.itemWidth, 0.0, 0.0);
    return CATransform3DScale(transform, ratio, ratio, 1);
}

- (NSInteger)numberOfPlaceholdersInCarousel:(__unused iCarousel *)carousel {
    return 2;
}

- (UIView *)carousel:(__unused iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (!view) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:carousel.bounds];
        return imageView;
    }
    return view;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    [super carouselCurrentItemIndexDidChange:carousel];
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {

}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    switch (option) {
        case iCarouselOptionSpacing: {
            return value * 1.05f;
        }
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems: {
            return value;
        }
    }
    return value;
}

@end