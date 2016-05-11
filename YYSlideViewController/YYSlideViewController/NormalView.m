//
//  NormalView.m
//  YYSlideViewController
//
//  Created by 陈远洋 on 2/27/16.
//  Copyright © 2016 Sunny. All rights reserved.
//

#import "NormalView.h"

@implementation NormalView


-(void)initView{
    self.backgroundColor = [UIColor redColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(0, 40, 200, 30);
    
    button.backgroundColor = [UIColor blueColor];
    
    [button setTitle:@"侧滑按钮" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
}

-(void)click{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"cancle" otherButtonTitles:@"enter", nil];
    
    [alertView show];
}

@end
