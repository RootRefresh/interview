//
//  ProblemViewController.m
//  PrepareInterView
//
//  Created by USER on 2017/6/13.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "ProblemViewController.h"

//#import "FatherView.h"


//extern NSString *UURI;
//extern NSString *UUIR;
static NSString  * const A = @"www.rr";

@interface ProblemViewController ()

@property (nonatomic,strong) NSArray *array;

@end

@implementation ProblemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
//    int *uuu = NULL;
//    *A = &uuu;
//    A = @"dfjsdf";
  
//    UURI = @"jljljklj";
//    NSLog(@"%@",UURI);

    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self frameAndBounds];
    
    [self partViewInSuperView];
    
    [self arrayPro];
    
    
    [self test];
}

- (void)test
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@6,@7,@0,@1]];
    
//    for (int i = 0; i < array.count-1; i++) {
//        
//        
//        for (int j = 1; j < array.count - i; j++) {
//            
//            if ([array[j-1] intValue] > [array[j] intValue]) {
//                
//                NSNumber *tmp = [array[j-1] copy];
//                [array replaceObjectAtIndex:j-1 withObject:array[j]];
//                [array replaceObjectAtIndex:j withObject:tmp];
//                
//            }
//            NSLog(@"%@",array);
//
//        }
//        
//    }
    
    for (int i = 1; i < array.count; i++) {
        
        NSNumber *tmp = [array[i] copy];
        int j = i-1;
        
        while (j >= 0 && [array[j] integerValue] > [tmp integerValue]) {
            
            
            [array replaceObjectAtIndex:j+1 withObject:array[j]];
            
            
            j--;
            
        }
        
        [array replaceObjectAtIndex:j+1 withObject:tmp];
    }
    ^{return nil;}();
    NSLog(@"%@",array);
}


- (void)arrayPro
{
    NSArray *array = @[@1,@2,@3];
    NSMutableArray *mut = [NSMutableArray arrayWithArray:array];
    self.array = mut;
    
    [mut removeAllObjects];
    
    NSLog(@"%@",self.array);
    
    [mut addObjectsFromArray:array];
    
    self.array = [mut copy];
    
    [mut removeAllObjects];
    
    NSLog(@"%@",self.array);

}


- (void)frameAndBounds
{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    v.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:v];
    
    //修改bounds的 x,y值，不能改变相对位置
    v.bounds = CGRectMake(100, 300, 50, 50);
}

- (void)partViewInSuperView
{
//    FatherView *v = [[FatherView alloc]initWithFrame:CGRectMake(100, 300, 150, 100)];
//    v.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:v];

//    [v findUIViewController];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 100, 100);
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    
    btn.center = CGPointMake(150, 0);
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self findUIViewController:btn];
    
}

- (void)findUIViewController:(id)target
{
    id obj = [target nextResponder];
    int i = 0;
    while (![obj isKindOfClass:[UIViewController class]]&&obj != nil) {
        NSLog(@"%d---%@",i++,obj);
        
        obj = [obj nextResponder];
        
    }
    
    NSLog(@"%@",obj);
}


- (void)btnClick
{
    NSLog(@"123 abc");
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
