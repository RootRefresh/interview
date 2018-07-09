//
//  MyDrawerViewController.m
//  PrepareInterView
//
//  Created by USER on 2017/5/22.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "MyDrawerViewController.h"

#import "DrLeftViewController.h"

#import "DrCenterViewController.h"

#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height
#define MAXYOFFSET   200
#define ENDRIGHTX    200
#define ENDLEFTX    -200


@interface MyDrawerViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIView *childControllerContainerView;
@property (nonatomic,strong) UIViewController *leftVC;
@property (nonatomic,assign) CGRect startingRect;
@property (nonatomic,strong) UIView *mView;



@property (nonatomic,strong) DrLeftViewController *left;
@property (nonatomic,strong) DrCenterViewController *mid;
@end

@implementation MyDrawerViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        
        [self setUpCommon];

    }
    
    return self;
}

- (instancetype)initWithLeftVC:(UIViewController *)leftVC
{
    if (self = [super init]) {
        
        self.leftVC = leftVC;
        [self setLeftDrawerViewController:leftVC];
    }
    return self;
}

-(void)setUpCommon
{
    self.left = [[DrLeftViewController alloc]init];
    self.mid = [[DrCenterViewController alloc]init];
    
    [self addChildViewController:self.left];
    [self addChildViewController:self.mid];
    [self.view addSubview:self.left.view];
    [self.view addSubview:self.mid.view];
    
    
    
//    self.mView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//    self.mView.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:self.mView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 100, 50, 50);
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)btnClick
{
    if (self.mid.view.frame.origin.x == 0) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.mid.view.frame = CGRectMake(200, 0, SCREENWIDTH, SCREENHEIGHT);
        }completion:^(BOOL finished) {
            
            self.left.view.frame = CGRectMake(0, 0, 200, SCREENHEIGHT);

        }];
        
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            
            self.mid.view.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
        }];
    }
}

- (void)setLeftDrawerViewController:(UIViewController *)viewController
{
    if (viewController) {
        [self addChildViewController:self.leftVC];
        
        if([self.childControllerContainerView.subviews containsObject:self.view]){
    
            [self.childControllerContainerView insertSubview:viewController.view belowSubview:self.view];
            [viewController beginAppearanceTransition:YES animated:NO];
            [viewController endAppearanceTransition];
        }else{
            [self.childControllerContainerView addSubview:viewController.view];
            [self.childControllerContainerView sendSubviewToBack:viewController.view];
//            [viewController.view setHidden:YES];
        }
    }
    
    [viewController didMoveToParentViewController:self];
    viewController.view.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
    [viewController.view setFrame:CGRectMake(-SCREENWIDTH, 0, 200, self.view.frame.size.height)];

    
    
}
- (UIView *)childControllerContainerView
{
    if (_childControllerContainerView == nil) {
        
        CGRect frame = self.view.bounds;
        
        _childControllerContainerView = [[UIView alloc]initWithFrame:frame];
        
        _childControllerContainerView.backgroundColor = [UIColor clearColor];
        
        _childControllerContainerView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        
        [self.view addSubview:_childControllerContainerView];
        
        
        
    }
    
    return _childControllerContainerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupGesture];
}

- (void)setupGesture
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panCallBack:)];
    
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    
}

- (void)panCallBack:(UIPanGestureRecognizer *)panGesture
{
    NSLog(@"1111");
    
    CGPoint transition = [panGesture translationInView:self.mView];
    self.mView.frame=[self panGestureOffset:transition.x];
    [panGesture setTranslation:CGPointZero inView:self.mView];
    //拖动手势结束
    if (panGesture.state==UIGestureRecognizerStateEnded) {
        CGFloat originX =self.mView.frame.origin.x;
        CGFloat offsetX=0;
        //大于屏幕的一半进入新的位置
        if (originX > SCREENWIDTH*0.5) {
            offsetX=ENDRIGHTX-originX;
        }else if(originX < SCREENWIDTH*0.5 && originX > -SCREENWIDTH*0.5){
            //小于屏幕的一半，大于屏幕负一半的时候，则恢复到初始状态
            offsetX=offsetX-originX;
        }else if (originX<-SCREENWIDTH*0.5){
            offsetX=ENDLEFTX-originX;
        }
        
        [UIView animateWithDuration:0.5 animations:^{
            self.mView.frame=[self panGestureOffset:offsetX];
//            [self.leftVC beginAppearanceTransition:NO animated:NO];
//            [self.leftVC endAppearanceTransition];
//            [self.leftVC didMoveToParentViewController:self];

        
        }];
    }
}

- (CGRect)panGestureOffset:(CGFloat)offsetX
{
    offsetX=self.mView.frame.origin.x+offsetX;
    CGFloat offsetY = offsetX/SCREENWIDTH * MAXYOFFSET;
    //如果需要设置右边的抽屉，参数为负数，需要取绝对值
    CGFloat scale = (SCREENHEIGHT-fabs(2*offsetY))/SCREENHEIGHT;
    CGFloat height = SCREENHEIGHT;//*scale;
    CGFloat width  = SCREENWIDTH;
    CGFloat x = offsetX;
    CGFloat y = (SCREENHEIGHT- height)* 0.5;
    
    return CGRectMake(x, y, width, height);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
   
    
    return YES;
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
