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

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:carousel.bounds];
    imageView.layer.masksToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    NSString *imageName = self.displayItems[index];
    [imageView setImage:[UIImage imageNamed:imageName]];
    
    return imageView;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    [super carouselCurrentItemIndexDidChange:carousel];
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{

}

@end
