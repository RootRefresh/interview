//
//  NSTimer+YYBlockSupport.m
//  PrepareInterView
//
//  Created by USER on 2017/6/4.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "NSTimer+YYBlockSupport.h"

@implementation NSTimer (YYBlockSupport)

+ (NSTimer *)yy_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void(^)())block
{
    
    return  [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(yy_blockInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)yy_blockInvoke:(NSTimer *)timer
{
    void(^block)() = timer.userInfo;
    
    if (block) {
        block();
    }
}

@end
