//
//  PXViewController.m
//  PXRotatorView
//
//  Created by drinking on 05/26/2015.
//  Copyright (c) 2014 drinking. All rights reserved.
//

#import "PXViewController.h"
#import "DKRotatorDemoViewModel.h"
#import "PXRotatorView+StyledPageControl.h"
#import <PureLayout/ALView+PureLayout.h>

@implementation PXViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.translucent = NO;

    _viewModel = [DKRotatorDemoViewModel new];
    _viewModel.displayItems = [@[@"pic1.jpg", @"pic2.jpg", @"pic3.jpg", @"pic4.jpg"] mutableCopy];

    _rotatorView = [[PXRotatorView alloc] init];
    _rotatorView.frame = CGRectMake(0,0,CGRectGetWidth(self.view.frame),160);
    _rotatorView.interval = 1;
    [self.view addSubview:_rotatorView];
    [_rotatorView bindViewModel:self.viewModel];
    [_rotatorView addNumberPageControl];
    [_rotatorView updatePageControl];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Rotate"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(rotateOrStop)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)rotateOrStop {
    if (self.rotatorView.isRotating) {
        [self.navigationItem.rightBarButtonItem setTitle:@"Rotate"];
        [self.rotatorView stopRotating];
    } else {
        [self.navigationItem.rightBarButtonItem setTitle:@"Stop"];
        [self.rotatorView startRotating];
    }
}

@end
