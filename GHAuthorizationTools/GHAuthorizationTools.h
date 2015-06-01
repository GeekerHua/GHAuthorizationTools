//
//  AuthorizationTools.h
//  myTest
//
//  Created by zhenHua on 15/5/27.
//  Copyright (c) 2015年 GeekerHua. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GHAuthorizationTools : NSObject
/**
 *  授权单例
 *
 *  @return 授权工具类对象
 */
+ (instancetype)sharedAuthorizationTools;
/**
 *  请求相机
 *
 *  @param success 请求成功
 *  @param failed  请求失败
 */
+ (void)authorCameraSuccess:(void (^)())success failed:(void (^)())failed;
/**
 *  请求相册
 *
 *  @param success 请求成功
 *  @param failed  请求失败
 */
+ (void)authorPhotoAlbumSuccess:(void (^)())success failed:(void (^)())failed;

@end
