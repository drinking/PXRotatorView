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

@implementation PXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    _viewModel = [DKRotatorDemoViewModel new];
    _viewModel.displayItems = [@[@"Hello",@"Nice",@"to",@"meet",@"you!"] mutableCopy];
    _rotatorView = [[PXRotatorView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_rotatorView];

    [_rotatorView bindViewModel:self.viewModel];
    [_rotatorView addDefaultPageControl];
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
