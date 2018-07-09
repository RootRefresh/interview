//
//  KVCKVOViewController.m
//  PrepareInterView
//
//  Created by USER on 2017/6/15.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "KVCKVOViewController.h"
#import "Dog.h"

#import "Animal.h"

@interface KVCKVOViewController ()

@property (nonatomic, strong) Dog *d;

@end

/*
 
 valueForKey:
 
 1先找方法，再找变量
 2
 
 隐藏方法: @  + min/max/sum/count
 
 */


@implementation KVCKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self yy_kvc];
}

- (void)yy_kvc
{
    _d = [Dog new];
    
    
    [_d addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionPrior context:nil];
    
//    NSString *str = [d valueForKey:@"name"];
    [_d setValue:@"jkkjkkk" forKey:@"name"];
    [_d setValue:@"hhhhh" forKey:@"name"];

    [_d backName];
 
    
    NSMutableArray *eoArr = [NSMutableArray array];
    
    [eoArr addObject:@"1"];
    [eoArr addObject:@"1"];
    [eoArr addObject:@"1"];
    [eoArr addObject:@"1"];

    NSLog(@"%@",[eoArr valueForKey:@"@count"]);
    
    Animal *a = _d;
    [a eat];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    
    NSLog(@"%@\n%@\n%@\n%@",keyPath,object,change,context);
}

- (void)dealloc
{
    [_d removeObserver:self forKeyPath:@"name"];
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
