//
//  Dog.h
//  PrepareInterView
//
//  Created by USER on 2017/6/15.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Animal.h"

@interface Dog : Animal
{
    //取name值，找变量时，优先级依次由上到下
//    NSString *_name;
    
//    NSString *_isName;
    
//    NSString *name;
//    NSString *isName;
    
//    int name;//基本数据类型转换为 NSNumber
}
@property (nonatomic,copy) NSString *name;
- (NSString *)backName;

- (void)eat;
@end
