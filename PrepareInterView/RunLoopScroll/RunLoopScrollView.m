//
//  RunLoopScrollView.m
//  PrepareInterView
//
//  Created by USER on 2017/5/24.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "RunLoopScrollView.h"

#import "NSTimer+YYBlockSupport.h"

@interface RunLoopScrollView()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *mScroll;

@property (nonatomic,strong) UIPageControl *pageControl;

@end

@implementation RunLoopScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createScrollView:frame];
        
    }
    return self;
}

- (void)createScrollView:(CGRect)frame
{
    self.mScroll = [[UIScrollView alloc]initWithFrame:frame];
    self.mScroll.delegate = self;
 
    self.mScroll.pagingEnabled = YES;


    [self addSubview:self.mScroll];
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(frame)-20, CGRectGetWidth(frame), 20)];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    [self addSubview:self.pageControl];
}

- (void)addImageToScroll:(NSArray *)imgArray
{
    if (!imgArray) {
        return;
    }
    [self startTimer];

    NSArray *tmp = @[imgArray[2],imgArray[0],imgArray[1],imgArray[2],imgArray[0]];
//    NSArray *tmp = imgArray;
    for (int i = 0; i < tmp.count; i++) {
       
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        
        imgView.image = [UIImage imageNamed:tmp[i]];
        
        [self.mScroll addSubview:imgView];
        
    }
    self.totalCount = tmp.count;
    self.mScroll.contentSize = CGSizeMake(self.frame.size.width*self.totalCount,  self.frame.size.height);
    self.pageControl.numberOfPages = imgArray.count;
    self.pageControl.currentPage = 0;
    [self.mScroll setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
//    self.mScroll.contentOffset = CGPointMake(self.frame.size.width, 0);
    
}
- (void)dealloc
{
    [_timer invalidate];
    _timer = nil;
}
- (void)startTimer
{
    if (_timer) {
        [_timer invalidate];
        
    }
    __weak RunLoopScrollView *wSelf= self;
//    _timer = [NSTimer yy_scheduledTimerWithTimeInterval:2 repeats:YES block:^{
//        
////        RunLoopScrollView *strongSelf = wSelf;
//        [wSelf runLoop];
//        
//    }];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
    
//        NSInteger nextIndex = self.pageControl.currentPage+1;
//        
//           
//        [self.mScroll setContentOffset:CGPointMake(self.frame.size.width*(nextIndex+1), 0) animated:YES];
//        self.pageControl.currentPage = nextIndex;
//
//        if (self.totalCount == nextIndex) {
//                [self.mScroll setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
//                self.pageControl.currentPage = 0;
//        }
        
        [wSelf runLoop];
        

    }];
}


- (void)runLoop
{
    NSInteger nextIndex = self.pageControl.currentPage+2;
    
    if (nextIndex == self.totalCount) {
        nextIndex = 2;
    }
    
    [self.mScroll setContentOffset:CGPointMake(self.frame.size.width*nextIndex, 0) animated:YES];
    self.pageControl.currentPage = nextIndex-1;
    NSLog(@"timer %ld",(long)self.pageControl.currentPage);
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSInteger index = scrollView.contentOffset.x / self.frame.size.width;
//    NSLog(@"%f",scrollView.contentOffset.x);
//    NSLog(@"%d",index);
//    if (index == 0) {
//        [scrollView setContentOffset:CGPointMake(self.frame.size.width * self.totalCount, 0)];
//
//        self.pageControl.currentPage = 2;
//
//    }else if (index == self.totalCount+1){
//        [scrollView setContentOffset:CGPointMake(self.frame.size.width, 0)];
//        self.pageControl.currentPage = 0;
//    }else{
//        self.pageControl.currentPage = index-1;
//    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    NSInteger index = scrollView.contentOffset.x / self.frame.size.width;
    if (index == 0) {
        [scrollView setContentOffset:CGPointMake(self.frame.size.width * (self.totalCount - 2), 0)];
        index = self.totalCount - 2;
    }else if(index == self.totalCount - 1)
    {
        [scrollView setContentOffset:CGPointMake(self.frame.size.width, 0)];
        index = 0;
    }
    else
    {
        index = index - 1;
    }
    self.pageControl.currentPage = index;
    NSLog(@"did end %ld",(long)self.pageControl.currentPage);

//    _index = index;
    
    
    
//    NSInteger index = scrollView.contentOffset.x / self.frame.size.width;
//    NSLog(@"%f",scrollView.contentOffset.x);
//    NSLog(@"%d",index);
//
//    
//    if (index == 0) {
//        [scrollView setContentOffset:CGPointMake(self.frame.size.width, 0)];
//
//    }else if(index > 2 ){
//        [scrollView setContentOffset:CGPointMake(0, 0)];
//
//    }
//    
//    else if (index == 2) {
//        [scrollView setContentOffset:CGPointMake(0, 0)];
//        
//        index = 0;
//    }else{
//        [scrollView setContentOffset:CGPointMake(self.frame.size.width *(index+1), 0)];
//        index += 1;
//    }
////    
////    else if(index == self.totalCount-1){
////        [scrollView setContentOffset:CGPointMake(self.frame.size.width , 0)];
////        
////        index= 0;
////        
////    }else{
////        index = index-1;
////    }
//    
//    self.pageControl.currentPage = index;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
