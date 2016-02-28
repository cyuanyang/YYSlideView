//
//  YYSlideViewController.m
//  YYSlideViewController
//
//  Created by 陈远洋 on 2/27/16.
//  Copyright © 2016 Sunny. All rights reserved.
//

#define AUTO_X (50)
#define ANIM_DUR (0.2)

#import "YYSlideViewController.h"

@interface YYSlideViewController ()

/** cover */
@property(nonatomic,strong)UIView *coverView;

@end

@implementation YYSlideViewController

-(instancetype)initWithSlideView:(YYBaseSlideView * )view{
    self = [super init];
    
    if (self) {
        self.slideView = view;
    }
    
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    _state = SlideViewStateClosed;
    [self.view addSubview:_slideView];
    
    self.mainView = [[UIView alloc]initWithFrame:self.view.frame];
    
    _mainView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_mainView];
    
    /**test *****/
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(50, 100, 200, 30);
    
    button.backgroundColor = [UIColor blueColor];
    
    [button setTitle:@"click" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mainView addSubview:button];
    
    self.coverView = [[UIView alloc]initWithFrame:self.view.frame];
    
    _coverView.backgroundColor = [UIColor blackColor];
    _coverView.alpha = 0.0;
//    _coverView.hidden = YES;
    [self.mainView addSubview:_coverView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [_coverView addGestureRecognizer:tap];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    
    [self.view addGestureRecognizer:pan];
    
}


-(void)panAction:(UIPanGestureRecognizer *)pan{
    static CGFloat beginX = -1;
    CGPoint point = [pan locationInView:self.view];
    if(pan.state == UIGestureRecognizerStateBegan) {
        beginX = point.x;
    }else if(pan.state == UIGestureRecognizerStateEnded){
        beginX = -1;
        if (_mainView.frame.origin.x < AUTO_X) {
            [self autoAnim:NO];
        }else{
            [self autoAnim:YES];
        }
        
        if (_mainView.frame.origin.x == 0) {
             _state = SlideViewStateClosed;
             [self showOrHideCover:NO];
        }else if(_mainView.frame.origin.x == _slideView.slideWidth){
            _state = SlideViewStateOpened;
             [self showOrHideCover:YES];
        }
    }else if (pan.state == UIGestureRecognizerStateChanged){
        CGFloat detlaX = 0;
        if (_state == SlideViewStateClosed) {
            
            detlaX = point.x - beginX;
            
        }else if(_state == SlideViewStateOpened){
            detlaX =_slideView.slideWidth + point.x - beginX;
        }
        
      
        CGRect mainRect = _mainView.frame;
        mainRect.origin.x = detlaX;
        if (mainRect.origin.x >=_slideView.slideWidth) {
            mainRect.origin.x = _slideView.slideWidth;
        }else if (mainRect.origin.x <=0){
            mainRect.origin.x  = 0;
        }
        
        _mainView.frame = mainRect;
        
        CGRect slideRect = _slideView.frame;
        slideRect.origin.x = detlaX/2  - _slideView.slideWidth/2;
        if (slideRect.origin.x >=0) {
            slideRect.origin.x = 0;
        }else if (slideRect.origin.x <= -_slideView.slideWidth/2){
            slideRect.origin.x  = -_slideView.slideWidth/2;
        }
        _slideView.frame = slideRect;

    }
}

-(void)tapAction{
    [self autoAnim:NO];
    [self showOrHideCover:NO];
}
/*
 * open or close
 */
-(void)autoAnim:(BOOL)isOpen{
    [UIView animateWithDuration:ANIM_DUR delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        CGRect mainRect = _mainView.frame;
        CGRect slideRect = _slideView.frame;
        if (isOpen) {
            mainRect.origin.x = _slideView.slideWidth;
            slideRect.origin.x = 0;
            _state = SlideViewStateOpening;
        }else{
            mainRect.origin.x = 0;
            slideRect.origin.x = -_slideView.slideWidth/2;
            _state = SlideViewStateClosing;
        }
        _mainView.frame = mainRect;
        _slideView.frame = slideRect;
    } completion:^(BOOL finished) {
      
        if (isOpen) {
            _state = SlideViewStateOpened;
//            [self showOrHideCover:YES];
        }else{
            _state = SlideViewStateClosed;
//           [self showOrHideCover:NO];
        }
        
    }];
}
/*
 * show or hide cover
 */
-(void)showOrHideCover:(BOOL)isShow{
    [UIView animateWithDuration:0.2 animations:^{
        if (isShow) {
            _coverView.alpha = 0.2;
        }else{
            _coverView.alpha = 0.0;
        }
    }];
}


-(void)click{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"cancle" otherButtonTitles:@"enter", nil];
    
    [alertView show];
}



@end
