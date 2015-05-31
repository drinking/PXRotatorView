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

@interface PXViewController ()


@end

@implementation PXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];




    _viewModel = [DKRotatorDemoViewModel new];
    _viewModel.displayItems = [@[@"Hello",@"Nice",@"to",@"meet",@"you!"] mutableCopy];
    PXRotatorView *rotatorView = [[PXRotatorView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:rotatorView];
    
    [rotatorView bindViewModel:self.viewModel];
    [rotatorView addDefaultPageControl];
    [rotatorView updatePageControl];
    [rotatorView startRotating];

    
    [rotatorView.rac_willDeallocSignal subscribeCompleted:^{
        NSLog(@"rv dealloc signal ...");
    }];
    
    [_viewModel.rac_willDeallocSignal subscribeCompleted:^{
        NSLog(@"rm dealloc signal ...");
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
