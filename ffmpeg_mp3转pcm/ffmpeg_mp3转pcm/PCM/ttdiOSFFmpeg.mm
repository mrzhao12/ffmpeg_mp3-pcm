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

//
//  ttdiOS
//
//  Created by ttdiOS on 2017/7/31.
//  Copyright © 2017年 ttdiOS. All rights reserved.
//

#import "ttdiOSFFmpeg.h"

#import <stdio.h>
#import <stdlib.h>

extern "C"
{
#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
#include <libswscale/swscale.h>
#include <libavutil/opt.h>
}

@interface ttdiOSFFmpeg()
{
    AVFormatContext *fmt_ctx;
    AVCodecContext *codec_ctx;
    AVPacket packet;
    AVFrame *avFrame;
}
@end

@implementation ttdiOSFFmpeg

- (instancetype)init
{
    if (self = [super init])
    {
        fmt_ctx = avformat_alloc_context();
        packet = *av_packet_alloc();
        avFrame = av_frame_alloc();
        
        av_register_all();  //注册所有可解码类型
        avformat_network_init();
    }
    return self;
}
//打开音频文件文件及一些初始化
-(int) open_input_file:(const char *)filename
{
    
    int ret;
    AVCodec *dec;
    
    
    //打开文件
    if ((ret = avformat_open_input(&fmt_ctx, filename, NULL, NULL)) < 0)
    {
        //av_log(NULL, //av_log_ERROR, "Cannot open input file\n");
        return ret;
    }
    else
    {
        NSLog(@"Can open input file");
    }
    //流信息
    if ((ret = avformat_find_stream_info(fmt_ctx, NULL)) < 0)
    {
        //av_log(NULL, //av_log_ERROR, "Cannot find stream information\n");
        return ret;
    }
    else
    {
        NSLog(@"Can find stream information");
    };
    /* select the audio stream */
    //输入文件的音频流
    ret = av_find_best_stream(fmt_ctx, AVMEDIA_TYPE_AUDIO, -1, -1, &dec, 0);
    if (ret < 0)
    {
        //av_log(NULL, //av_log_ERROR, "Cannot find an audio stream in the input file\n");
        return ret;
    }
    else
    {
        NSLog(@"Can find an audio stream in the input file");
    }
    
    int audio_stream_index = ret;
    codec_ctx = fmt_ctx->streams[audio_stream_index]->codec;
    av_opt_set_int(codec_ctx, "refcounted_frames", 1, 0);
    /* init the audio decoder */
    //打开音频解码器
    if ((ret = avcodec_open2(codec_ctx, dec, NULL)) < 0)
    {
        //av_log(NULL, //av_log_ERROR, "Cannot open audio decoder\n");
        return ret;
    }
    else
    {
        NSLog(@"Can open audio decoder");
    }
    //打印文件信息
    av_dump_format(fmt_ctx, 0, filename, 0);
    
    return 0;
}

-(int)audio_decode_outfilename:(const char *)outfilename filename:(const char *)filename;
{
    if ([self open_input_file:filename] != 0)
    {
        NSLog(@"初始化失败");
        return [self open_input_file:filename];
    }
    else
    {
        NSLog(@"初始化成功");
    }
    
    
    
    int audioStream = -1;
    for (int i = 0; i < fmt_ctx->nb_streams; i++)
    {
        if (fmt_ctx->streams[i]->codec->codec_type == AVMEDIA_TYPE_AUDIO)
        {
            audioStream = i;
            break;
        }
    }
    
    if (audioStream == -1)
    {
        //NSLog(@"audioStream 信息有误");
        return audioStream;
    }

    FILE *outfile = NULL;
    outfile = fopen(outfilename, "wb");
    while (av_read_frame(fmt_ctx, &packet) >= 0)
    {
        static int  con = 1;
//        NSLog(@"解码中 = %d   packet.size = %d",con++,packet.size);
        
        if (packet.size>0)
        {
            
            int got_frame = 0;
            int ret = -1;
            ret = avcodec_decode_audio4(codec_ctx, avFrame, &got_frame, &(packet));
            if (ret < 0)
            {
                NSLog(@"============");
                return ret;
            }
            
            if (got_frame)
            {
                int data_size = av_get_bytes_per_sample(codec_ctx->sample_fmt);
                if (data_size<0)
                {
                    NSLog(@"Failed to calculate data size");
                    return data_size;
                }
                
                
                if (!outfilename) {
                    av_free(codec_ctx);
                    NSLog(@"写入地址错误");
                    return -1;
                }
                
                for (int i=0; i<avFrame->nb_samples; i++)
                {
                    for (int ch=0; ch<codec_ctx->channels; ch++)
                    {
                        fwrite(avFrame->data[ch] + data_size*i, 1, data_size, outfile);
                    }
                    
                }
                

                
            }
        }
   
        
    }
    
    fclose(outfile);
    
    avcodec_close(codec_ctx);
    av_free(codec_ctx);
    av_frame_free(&avFrame);
    
    
    
    
    
    return 0;
}

@end
