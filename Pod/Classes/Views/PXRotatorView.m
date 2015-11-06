//
// Created by drinking on 15/5/20.
// Copyright (c) 2015 BOOHEE. All rights reserved.
//

#import "PXRotatorView.h"

@interface PXRotatorView ()

@property(nonatomic, strong) NSTimer *timer;

@end

@implementation PXRotatorView

- (void)commonInit {
    _interval = 5;
    _isRotating = NO;
    self.layer.masksToBounds = YES;
    _carousel = [iCarousel new];
    _carousel.pagingEnabled = YES;
    [self addSubview:_carousel];

    [self addObserver:self forKeyPath:@"viewModel" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"viewModel"];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _carousel.frame = self.bounds;
}

- (instancetype)init {
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"viewModel"]) {
        [self.carousel reloadData];
    }
}

- (void)startRotating {
    [self stopRotating];

    self.isRotating = YES;
    if ([self.timer isValid]) {
        [self.timer invalidate];
    }
    self.timer = nil;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.interval target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
}

- (void)stopRotating {
    self.isRotating = NO;
    if ([self.timer isValid]) {
        [self.timer invalidate];
    }
    self.timer = nil;
}

- (void)scrollToNextPage {
    NSInteger newIndex = self.carousel.currentItemIndex + 1;
    if (newIndex > self.carousel.numberOfItems) {
        newIndex = 0;
    }
    [self.carousel scrollToItemAtIndex:newIndex animated:YES];
}

- (void)bindViewModel:(PXRotatorBaseViewModel *)viewModel {
    self.carousel.delegate = viewModel;
    self.carousel.dataSource = viewModel;
    self.viewModel = viewModel;
}

@end