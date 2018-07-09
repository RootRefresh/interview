//
//  CollectionEnumViewController.m
//  PrepareInterView
//
//  Created by USER on 2017/6/4.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "CollectionEnumViewController.h"

@interface CollectionEnumViewController ()

@end

@implementation CollectionEnumViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    
    NSArray *arr = @[@1,@2,@3,@4];

    for (id tmp in [arr reverseObjectEnumerator]) {
        NSLog(@"%@",tmp);
    }
    
    [arr enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"%lu--%@",(unsigned long)idx,obj);
        
        if (idx == 2) {
            *stop = YES;
        }
        
    }];
    
    
    NSDictionary *dic = @{@"one":@"oneV",@"two":@"twoV",@"three":@"threeV"};
    
    [dic enumerateKeysAndObjectsUsingBlock:^(NSString * key, NSString * obj, BOOL * _Nonnull stop) {
        
        NSLog(@"%@:%@",key,obj);

        
    }];
    
    NSSet *set = [NSSet setWithObjects:@4,@3,@2,@1, nil];
    
    [set enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
       
        NSLog(@"%@",obj);

        
    }];
    
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
