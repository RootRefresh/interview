//
//  WeakProxy.h
//  PrepareInterView
//
//  Created by USER on 2018/8/6.
//  Copyright © 2018年 com.lottery.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeakProxy : NSProxy
// weak 是关键
@property (nonatomic, weak, readonly) id target;
- (instancetype)initWithTarget:(id)target;
+ (instancetype)proxyWithTarget:(id)target;

@end
