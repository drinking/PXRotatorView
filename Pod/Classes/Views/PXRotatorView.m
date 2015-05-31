//
// Created by drinking on 15/5/20.
// Copyright (c) 2015 BOOHEE. All rights reserved.
//

#import "PXRotatorView.h"
#import "PXRotatorBaseViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation PXRotatorView{
    RACSignal *timerSignal;
    RACDisposable *timerDisposable;

}

- (void)commonInit{

    self.interval = 5;
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
    [self stopRotating];

    timerSignal =  [RACSignal interval:self.interval onScheduler:[RACScheduler mainThreadScheduler]];
    @weakify(self)
    timerDisposable = [[timerSignal takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        @strongify(self)
        NSInteger newIndex=self.carousel.currentItemIndex+1;
        if (newIndex > self.carousel.numberOfItems) {
            newIndex=0;
        }
        [self.carousel scrollToItemAtIndex:newIndex animated:YES];
    }];
}

- (void)stopRotating{

    if (timerSignal){
        timerSignal = nil;
    }

    if(timerDisposable){
        [timerDisposable dispose];
        timerDisposable = nil;
    }
}

- (void)bindViewModel:(PXRotatorBaseViewModel *)viewModel{

    self.carousel.delegate = viewModel;
    self.carousel.dataSource = viewModel;
    @weakify(self)
    [RACObserve(viewModel, displayItems) subscribeNext:^(id x) {
        @strongify(self)
        [self.carousel reloadData];
    }];
}

@end