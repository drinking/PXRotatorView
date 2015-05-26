//
// Created by drinking on 15/5/21.
// Copyright (c) 2015 BOOHEE. All rights reserved.
//

#import "iCarousel+StyledPageControl.h"
#import "ALView+PureLayout.h"
#import <objc/runtime.h>



@implementation iCarousel (StyledPageControl)

@dynamic pageControl,rotatorType;

-(StyledPageControl *)pageControl {
    StyledPageControl *_pageControl = objc_getAssociatedObject(self, @selector(pageControl));
    if(!_pageControl){
        _pageControl = [[StyledPageControl alloc] init];
        [_pageControl setHidesForSinglePage:YES];
        [_pageControl setStrokeWidth:0];
        [_pageControl setDiameter:8];
        [_pageControl setGapWidth:12];
        [_pageControl setPageControlStyle:PageControlStyleThumb];
        objc_setAssociatedObject(self, @selector(pageControl), _pageControl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }

    return _pageControl;
}

-(PXRotatorType)rotatorType{
    PXRotatorType type = PXPotatorNone;
    [objc_getAssociatedObject(self, @selector(rotatorType)) getValue:&type];
    return type;
}

- (void)setRotatorType:(PXRotatorType)rotatorType {
    NSValue *value = [NSValue valueWithBytes:&rotatorType objCType:@encode(PXRotatorType)];
    objc_setAssociatedObject(self, @selector(rotatorType), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)updatePageControl{
    self.pageControl.numberOfPages = self.numberOfItems;

    if (self.rotatorType == PXPotatorWhiteDot){
        [self.pageControl setThumbImage:[self createDot:[UIColor whiteColor]]];
        [self.pageControl setSelectedThumbImage:[self createDot:[UIColor redColor]]];
        return;
    }

    if (self.rotatorType == PXRotatorNumber) {
        for (int i = 0; i < self.numberOfItems; i++) {
            NSString *num = [NSString stringWithFormat:@"%d",i+1];
            UIImage *unselected = [self createText:num withColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor]];
            [self.pageControl setThumbImage:unselected forIndex:i];
            UIImage *selected = [self createText:num withColor:[UIColor whiteColor] backgroundColor:[UIColor redColor]];
            [self.pageControl setSelectedThumbImage:selected forIndex:i];
        }
    }
}

- (void)addDefaultPageControl{
    self.rotatorType = PXPotatorWhiteDot;
    [self addSubview:self.pageControl];
    [self.pageControl autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.pageControl autoSetDimension:ALDimensionHeight toSize:24];
}

- (void)addNumberPageControl{
    [self addDefaultPageControl];
    self.rotatorType = PXRotatorNumber;
}

- (void)setPageConrolCurrentPage:(NSInteger)index{
    [self.pageControl setCurrentPage:index];
}

- (UIImage *)createText:(NSString *)text withColor:(UIColor *)textColor backgroundColor:(UIColor*)bgColor{
    CGSize size = CGSizeMake(16, 16);

    UIFont *font = [UIFont systemFontOfSize:10];
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [bgColor set];
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [path fill];

    [textColor set];
    CGFloat fontHeight = font.pointSize;
    CGFloat yOffset = -2+ (size.height - fontHeight) / 2.0;
    CGFloat xOffset = 2+(size.width - fontHeight) / 2.0;
    [text drawInRect:CGRectMake(xOffset, yOffset, 5, font.pointSize) withFont:font];
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return finalImage;
}

- (UIImage *)createDot:(UIColor*)bgColor{

    CGSize size = CGSizeMake(16, 16);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [bgColor set];
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [path fill];

    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return finalImage;
}
@end