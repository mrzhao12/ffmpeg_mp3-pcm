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
//  ffmpeg_mp3_pcmTests.m
//  ffmpeg_mp3转pcmTests
//
//  Created by sjhz on 2017/8/31.
//  Copyright © 2017年 sjhz. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ffmpeg_mp3_pcmTests : XCTestCase

@end

@implementation ffmpeg_mp3_pcmTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
