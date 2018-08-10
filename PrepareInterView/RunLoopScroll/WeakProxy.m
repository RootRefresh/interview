
//
//  WeakProxy.m
//  PrepareInterView
//
//  Created by USER on 2018/8/6.
//  Copyright © 2018年 com.lottery.www. All rights reserved.
//

#import "WeakProxy.h"

@implementation WeakProxy

- (instancetype)initWithTarget:(id)target
{
    _target = target;
    return self;
}

+ (instancetype)proxyWithTarget:(id)target
{
    return [[self alloc]initWithTarget:target];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    SEL sel = [invocation selector];
    if ([self.target respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.target];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.target methodSignatureForSelector:sel];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    return [self.target respondsToSelector:aSelector];
}


@end
