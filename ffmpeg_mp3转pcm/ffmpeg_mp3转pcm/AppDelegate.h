/*
 *FFmpeg解码mp3
 *ffmpeg_mp3转pcm
 *赵彤彤 mrzhao12  ttdiOS
 *1107214478@qq.com
 *http://www.jianshu.com/u/fd9db3b2363b
 *本程序是iOS平台下FFmpeg解码mp3成pcm
 *1.解码mp3
 *2.mp3转pcm
 *3.一定要添加CoreMedia.framework不然会出现Undefined symbols for architecture x86_64：（模拟器64位处理器测试（iphone5以上的模拟器））
 */
//  AppDelegate.h
//  ffmpeg_mp3转pcm
//
//  Created by sjhz on 2017/8/31.
//  Copyright © 2017年 sjhz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

