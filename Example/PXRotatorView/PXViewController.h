//
//  PXViewController.h
//  PXRotatorView
//
//  Created by drinking on 05/26/2015.
//  Copyright (c) 2014 drinking. All rights reserved.
//

@import UIKit;

#import <PXRotatorView/PXRotatorBaseViewModel.h>
#import <PXRotatorView/PXRotatorView.h>

@interface PXViewController : UIViewController
@property (nonatomic,strong) PXRotatorBaseViewModel *viewModel;
@property (nonatomic,strong) PXRotatorView *rotatorView;

@end
