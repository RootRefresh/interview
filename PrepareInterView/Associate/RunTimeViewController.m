//
//  RunTimeViewController.m
//  PrepareInterView
//
//  Created by USER on 2017/6/4.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "RunTimeViewController.h"

#import <objc/runtime.h>


static void *MyAlertKey = @"MyAlertKey";

typedef void(^AlertBlock)(NSUInteger);

@interface RunTimeViewController ()<UIAlertViewDelegate>

@property (nonatomic, copy) AlertBlock alertBlock;

@end

@implementation RunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createAlert];
    
}

- (void)createAlert
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Question" message:@"Hello" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
   
  
    __weak RunTimeViewController *wSelf = self;

    _alertBlock = ^(NSUInteger index){
        if (index == 0) {
            NSLog(@"cancel block");
        }else{
//            NSLog(@"sure block");
            
            [wSelf test];
        }
    
    };
    
     objc_setAssociatedObject(alert, MyAlertKey, _alertBlock, OBJC_ASSOCIATION_COPY);
    
    [alert show];
}

- (void)test
{
     
    NSLog(@"test sure");
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    _alertBlock = objc_getAssociatedObject(alertView, MyAlertKey);
    _alertBlock(buttonIndex);
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
