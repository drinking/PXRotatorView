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
#import <PXRotatorView/PXRotatorView.h>
#import <PureLayout/ALView+PureLayout.h>

@implementation PXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBar.translucent = NO;

    _viewModel = [DKRotatorDemoViewModel new];
    _viewModel.displayItems = [@[@"pic1.jpg",@"pic2.jpg",@"pic3.jpg",@"pic4.jpg"] mutableCopy];

    _rotatorView = [[PXRotatorView alloc] init];
    _rotatorView.interval = 1;
    [self.view addSubview:_rotatorView];
    [_rotatorView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
    [_rotatorView autoSetDimension:ALDimensionHeight toSize:160];

    [_rotatorView bindViewModel:self.viewModel];
    [_rotatorView addNumberPageControl];
    [_rotatorView updatePageControl];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Rotate"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:nil action:nil];

    @weakify(self)
    self.navigationItem.rightBarButtonItem.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        if (self.rotatorView.isRotating){
            [self.rotatorView stopRotating];
        }else{
            [self.rotatorView startRotating];
        }

        return [RACSignal empty];
    }];

    RAC(self.navigationItem.rightBarButtonItem,title) = [RACObserve(self.rotatorView, isRotating) map:^id(id rotating) {
        return [rotating boolValue]?@"Stop":@"Rotate";
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
