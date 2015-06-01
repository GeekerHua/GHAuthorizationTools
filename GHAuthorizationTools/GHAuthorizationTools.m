//
//  AuthorizationTools.m
//  myTest
//
//  Created by zhenHua on 15/5/27.
//  Copyright (c) 2015年 GeekerHua. All rights reserved.
//

#import "GHAuthorizationTools.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
@implementation GHAuthorizationTools

static id instance;
+ (instancetype)sharedAuthorizationTools{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

// 请求相机
+ (void)authorCameraSuccess:(void (^)())success failed:(void (^)())failed {
    //     获取相机权限

    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        //判断相机是否能够使用
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if(status == AVAuthorizationStatusAuthorized) {
            // 已授权
            success();
        } else if(status == AVAuthorizationStatusDenied){
            // 公开拒绝
            failed();
            return ;
            // denied
        } else if(status == AVAuthorizationStatusRestricted){
            // 儿童权限
        } else if(status == AVAuthorizationStatusNotDetermined){
            // 还未授权
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if(granted){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        success();
                    });
                }
            }];
            return;
        }
    } else {
        // 7以下系统
        success();
    }
}

+ (void)authorPhotoAlbumSuccess:(void (^)())success failed:(void (^)())failed{
    // 判断是否有相册权限
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) {
        ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
        if (author == ALAuthorizationStatusAuthorized) {
            
        } else if (author == ALAuthorizationStatusDenied) {
            failed();
            return ;
        } else if (author == ALAuthorizationStatusRestricted) {
            return;
        } else if (author == ALAuthorizationStatusNotDetermined) {
            // 请求获取授权
        }
    }
    success();

}

@end
