//
//  ViewController.m
//  GHAuthorizationTools
//
//  Created by zhenHua on 15/6/1.
//  Copyright (c) 2015年 GeekerHua. All rights reserved.
//

#import "ViewController.h"
#import "GHAuthorizationTools.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 授权相机
    [GHAuthorizationTools authorCameraSuccess:^() {
        NSLog(@"授权成功");
    } failed:^() {
        NSLog(@"授权失败");
    }];

// 授权相册
    [GHAuthorizationTools authorPhotoAlbumSuccess:^{
        NSLog(@"相册授权成功");
    } failed:^{
        NSLog(@"相册授权失败");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
