//
//  PXViewController.h
//  PXRotatorView
//
//  Created by drinking on 05/26/2015.
//  Copyright (c) 2014 drinking. All rights reserved.
//

@import UIKit;
@class DKRotatorDemoViewModel;
@class PXRotatorView;

@interface PXViewController : UIViewController
@property (nonatomic,strong) DKRotatorDemoViewModel *viewModel;
@property (nonatomic,strong) PXRotatorView *rotatorView;

@end
