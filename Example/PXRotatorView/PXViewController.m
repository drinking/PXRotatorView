//
//  PXViewController.m
//  PXRotatorView
//
//  Created by drinking on 05/26/2015.
//  Copyright (c) 2014 drinking. All rights reserved.
//

#import "PXViewController.h"
#import "DKRotatorDemoViewModel.h"
#import <PXRotatorView/PXRotatorView.h>
#import <PXRotatorView/PXRotatorView+StyledPageControl.h>

@interface PXViewController ()
@property (nonatomic,strong) DKRotatorDemoViewModel *viewModel;

@end

@implementation PXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _viewModel = [DKRotatorDemoViewModel new];
    _viewModel.displayItems = [@[@"Hello",@"Nice",@"to",@"meet",@"you!"] mutableCopy];
    PXRotatorView *rotatorView = [[PXRotatorView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:rotatorView];
    
    rotatorView.carousel.delegate = self.viewModel;
    rotatorView.carousel.dataSource = self.viewModel;
    
    [rotatorView addDefaultPageControl];
    [rotatorView updatePageControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
