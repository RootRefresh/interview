//
//  YYCustomNav.m
//  PrepareInterView
//
//  Created by USER on 2017/6/15.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "YYCustomNav.h"

@implementation YYCustomNav

- (instancetype)init
{
    if (self= [super init]) {
        
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
//        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
