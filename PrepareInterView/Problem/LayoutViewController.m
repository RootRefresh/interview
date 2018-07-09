//
//  LayoutViewController.m
//  PrepareInterView
//
//  Created by USER on 2017/7/5.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "LayoutViewController.h"
#import <objc/runtime.h>


@interface LayoutViewController ()<NSCoding>

@end

extern NSString * UURI;

@implementation LayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        Class c = self.class;
        //截取类和父类的成员变量
        while (c&&c!=[NSObject class]) {
            unsigned int count = 0;
            
            Ivar *ivars = class_copyIvarList(c, &count);
            
            for (int i = 0; i<count; i++) {
                NSString *key = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
                id value = [aDecoder decodeObjectForKey:key];
                [self setValue:value forKey:key];
            }
            //获得c的父类
            c = [c superclass];
            free(ivars);
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    Class c = self.class;
    while (c && c!=[NSObject class]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(c, &count);
        for (int i = 0;  i< count ; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            id value = [self valueForKey:key];
            [aCoder encodeObject:value forKey:key];
        }
        c = [c superclass];
        free(ivars);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
