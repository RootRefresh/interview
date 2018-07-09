//
//  Dog.m
//  PrepareInterView
//
//  Created by USER on 2017/6/15.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (instancetype)init
{
    if (self = [super init]) {
        
//        _name = @"HH";
//        _isName = @"_isName";
//        name = @"name";
//        isName = @"isName";
    }
    
    return self;
}

//- (void)setName:(NSString *)name
//{
//    NSLog(@"setName");
//}
//- (void)setIsName:(NSString *)name
//{
//    NSLog(@"setIsName");
//}
- (NSString *)backName
{
    NSLog(@"%@",_name);
    return _name;
}

- (void)eat
{
    NSLog(@"dog eat");
}

//+ (BOOL)accessInstanceVariablesDirectly
//{
//    return NO;
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

//- (NSString *)getName
//{
//    return @"getName";
//
//}
//
//- (NSString *)name
//{
//    return @"sjfjsjf";
//}

//- (NSInteger)countOfName
//{
//    return 2;
//    
//}
//
//
//- (id)objectInNameAtIndex:(NSInteger)index
//{
//    return @"bengsakalaka";
//}


@end
