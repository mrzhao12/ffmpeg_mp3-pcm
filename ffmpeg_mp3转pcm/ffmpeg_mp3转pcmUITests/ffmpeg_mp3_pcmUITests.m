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
//  ffmpeg_mp3_pcmUITests.m
//  ffmpeg_mp3转pcmUITests
//
//  Created by sjhz on 2017/8/31.
//  Copyright © 2017年 sjhz. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ffmpeg_mp3_pcmUITests : XCTestCase

@end

@implementation ffmpeg_mp3_pcmUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
