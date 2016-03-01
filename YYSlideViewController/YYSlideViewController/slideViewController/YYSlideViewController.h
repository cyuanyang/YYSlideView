//
//  YYSlideViewController.h
//  YYSlideViewController
//
//  Created by 陈远洋 on 2/27/16.
//  Copyright © 2016 Sunny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYBaseSlideView.h"

typedef NS_ENUM(NSUInteger , SlideViewState) {
    SlideViewStateOpened,
    SlideViewStateClosed,
    SlideViewStateOpening,
    SlideViewStateClosing,
    SlideViewStateAuto,
};


@interface YYSlideViewController : UIViewController

-(instancetype)initWithSlideView:(YYBaseSlideView * )view;

/** slide view */
@property(nonatomic,strong)YYBaseSlideView *slideView;

/** main view */
@property(nonatomic,strong)UIView *mainView;

/** state */
@property(nonatomic,readonly)SlideViewState state;

-(void)viewDidLoad;



@end
