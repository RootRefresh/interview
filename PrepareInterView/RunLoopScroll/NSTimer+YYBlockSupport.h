//
//  NSTimer+YYBlockSupport.h
//  PrepareInterView
//
//  Created by USER on 2017/6/4.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (YYBlockSupport)

+ (NSTimer *)yy_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void(^)())block;

@end
