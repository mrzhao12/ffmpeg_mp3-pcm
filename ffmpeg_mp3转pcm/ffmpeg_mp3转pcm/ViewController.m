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
//  ViewController.m
//  ffmpeg_mp3转pcm
//
//  Created by sjhz on 2017/8/31.
//  Copyright © 2017年 sjhz. All rights reserved.
//

#import "ViewController.h"
#import "ttdiOSFFmpeg.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *paths1 = [paths objectAtIndex:0];
    NSString *filePath = [paths1 stringByAppendingPathComponent:@"tt123.pcm"];
    
    NSLog(@"===%@",filePath);
    ttdiOSFFmpeg *ttdiOS = [[ttdiOSFFmpeg alloc] init];
    
//    FILE *in_file=NULL;
//
//    in_file = fopen("/Users/zhaotong/Desktop/picture/媒体资源/audio/tdjm.pcm","rb");
    
    const char* path3 = "/Users/zhaotong/Desktop/picture/媒体资源/audio/北京欢迎你.mp3";  //输出文件路径

    [ttdiOS audio_decode_outfilename:[filePath UTF8String ] filename:path3];

    

    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
