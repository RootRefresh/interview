//
//  DynamicsViewController.m
//  PrepareInterView
//
//  Created by USER on 2017/6/24.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "DynamicsViewController.h"

@interface DynamicsViewController ()
{
    UIDynamicAnimator *_animator;
    UIPushBehavior    *_pushBehavior;
    UIGravityBehavior *_gravity;
}
@end

@implementation DynamicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createExample];
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor orangeColor];
    v.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    v.opaque = YES;
    [self.view addSubview:v];
    self.navigationController.navigationBarHidden= YES;
}

- (void)createExample
{
    _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    
    UILabel *label = [[UILabel alloc]initWithFrame:(CGRect){100,100,100,50}];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    _gravity= [[UIGravityBehavior alloc]initWithItems:@[label]];
    
    [_animator addBehavior:_gravity];
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:@[label]];
    
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior: collision];
    
    _pushBehavior = [[UIPushBehavior alloc]initWithItems:@[label] mode:UIPushBehaviorModeContinuous];
    _pushBehavior.pushDirection = CGVectorMake(1.0f, 2.0f);
    [_animator addBehavior:_pushBehavior];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panLable:)];
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:pan];
    
}


- (void)panLable:(UIPanGestureRecognizer *)pan
{
    UIGestureRecognizerState state = pan.state;
    NSLog(@"$$$$$");
    if (state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [pan  velocityInView:self.view];
        [_animator removeBehavior:_gravity];
        _pushBehavior.pushDirection = CGVectorMake(velocity.x / 1000, velocity.y/1000);
        _pushBehavior.active = YES;
        
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
