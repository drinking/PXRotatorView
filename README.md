# PXRotatorView

[![CI Status](http://img.shields.io/travis/drinking/PXRotatorView.svg?style=flat)](https://travis-ci.org/drinking/PXRotatorView)
[![Version](https://img.shields.io/cocoapods/v/PXRotatorView.svg?style=flat)](http://cocoapods.org/pods/PXRotatorView)
[![License](https://img.shields.io/cocoapods/l/PXRotatorView.svg?style=flat)](http://cocoapods.org/pods/PXRotatorView)
[![Platform](https://img.shields.io/cocoapods/p/PXRotatorView.svg?style=flat)](http://cocoapods.org/pods/PXRotatorView)

## ScreenShot
![screenshot](https://raw.githubusercontent.com/drinking/PXRotatorView/master/screenshot.png)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

First you need to subclass `PXRotatorBaseViewModel` and implement `carousel:viewForItemAtIndex:reusingView:` method in where you customize your own view.

Then create a viewModel and set your data source.

Finally create a rotatorView and bind to your viewModel.

You may add a custom pageControl to your rotatorView. I implement one, you can modify it or write your own.

```objectiveC

    DKRotatorDemoViewModel *viewModel = [DKRotatorDemoViewModel new];
    viewModel.displayItems = [@[@"Hello",@"Nice",@"to",@"meet",@"you!"] mutableCopy];
    
    PXRotatorView *rotatorView = [[PXRotatorView alloc] initWithFrame:self.view.frame];
    rotatorView.interval = 1;
    [self.view addSubview:rotatorView];

    [rotatorView bindViewModel:self.viewModel];
    [rotatorView addDefaultPageControl];
    [rotatorView updatePageControl];


```

## Requirements

 iCarousel and ReactiveCocoa

## Installation

PXRotatorView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PXRotatorView"
```

## Author

drinking, pan49@126.com

## License

PXRotatorView is available under the MIT license. See the LICENSE file for more info.
