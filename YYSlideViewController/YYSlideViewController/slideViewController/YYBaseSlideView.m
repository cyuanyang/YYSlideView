//
//  YYBaseSlideView.m
//  YYSlideViewController
//
//  Created by 陈远洋 on 2/27/16.
//  Copyright © 2016 Sunny. All rights reserved.
//

#define H ([UIScreen mainScreen].bounds.size.height)

#import "YYBaseSlideView.h"

@implementation YYBaseSlideView

-(instancetype)initWithWidth:(CGFloat)width{
    CGRect rect = CGRectMake(-width/2, 0, width, H);
    self = [super initWithFrame:rect];
    
    if (self) {
        _slideWidth = width;
        [self initView];
    }
    
    return  self;
}

-(void)initView{
    
}

@end
