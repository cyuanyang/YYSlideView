//
//  ViewController.m
//  YYSlideViewController
//
//  Created by 陈远洋 on 2/27/16.
//  Copyright © 2016 Sunny. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(UIView *)loadMainView{
    
    /**test *****/
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(50, 100, 200, 30);
    
    button.backgroundColor = [UIColor blueColor];
    
    [button setTitle:@"click" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

-(void)click{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"cancle" otherButtonTitles:@"enter", nil];
    
    [alertView show];
}
@end
