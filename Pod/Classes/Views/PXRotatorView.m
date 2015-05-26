//
// Created by drinking on 15/5/20.
// Copyright (c) 2015 BOOHEE. All rights reserved.
//

#import "PXRotatorView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>


@implementation PXRotatorView{
    RACSignal *timerSignal;
    RACDisposable *timerDisposable;
}

- (void)commonInit{
    self.layer.masksToBounds = YES;
    _carousel = [iCarousel new];
    _carousel.pagingEnabled = YES;
    [self addSubview:_carousel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _carousel.frame = self.frame;
}

- (instancetype)init {
    if(self = [super init]){
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]){
        [self commonInit];
    }
    return self;
}

- (void)startRotating{
    if(!timerSignal){
        @weakify(self)
        timerSignal =  [RACSignal interval:5 onScheduler:[RACScheduler mainThreadScheduler]];
        timerDisposable = [timerSignal subscribeNext:^(id x) {
            @strongify(self)
            NSInteger newIndex=self.carousel.currentItemIndex+1;
            if (newIndex > self.carousel.numberOfItems) {
                newIndex=0;
            }
            [self.carousel scrollToItemAtIndex:newIndex animated:YES];
        }];
    }
}

- (void)stopRotating{
    //TODO: remember to involve this method
    if(timerDisposable){
        [timerDisposable dispose];
        timerDisposable = nil;
    }

}

@end