//
//  testc.c
//  SwiftTestAlfire
//
//  Created by zph on 2021/9/15.
//

#include "testc.h"

void haha() {
    printf("haha\n");
    
    int ret = 0;
    char errors[1024];

//    AVFormatContext *fmt_ctx;

//    AVDictionary *options = NULL;

    // [[video device]:[audio device]]
    char *devicename = ":0";

    // register audio device
//    avdevice_register_all();

    // get format
//    AVInputFormat *iformat = av_find_input_format("avfoundation");
//
//    // open device
//    if ((ret = avformat_open_input(&fmt_ctx, devicename, iformat, &options)) < 0) {
//        av_strerror(ret, errors, 1024);
//        printf(stderr, "failed to open audio device, [%d]%s\n", ret, errors);
//        return;
//    }
    
    
//    av_log_set_level(AV_LOG_DEBUG);
//    av_log(NULL, AV_LOG_DEBUG, "hello world\n");
}
