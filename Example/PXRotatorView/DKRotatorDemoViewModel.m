//
//  DKRotatorDemoViewModel.m
//  DKRotatorView
//
//  Created by drinking on 15/5/26.
//  Copyright (c) 2015年 drinking. All rights reserved.
//

#import "DKRotatorDemoViewModel.h"

@implementation DKRotatorDemoViewModel

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    UIView *mView = [[UIView alloc] initWithFrame:carousel.bounds];
    mView.backgroundColor = [self randomColor];
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    [mView addSubview:label];
    label.text = self.displayItems[index];
    [label sizeToFit];
     label.center = mView.center;
    
    return mView;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    [super carouselCurrentItemIndexDidChange:carousel];
//    [carousel setPageConrolCurrentPage:carousel.currentItemIndex];
    
}

- (UIColor *)randomColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}
@end
