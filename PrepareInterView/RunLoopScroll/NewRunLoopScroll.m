//
//  NewRunLoopScroll.m
//  PrepareInterView
//
//  Created by USER on 2017/5/24.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "NewRunLoopScroll.h"

#define SWIDTH self.frame.size.width
#define SHEIGHT self.frame.size.height

@interface NewRunLoopScroll()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *mScroll;

@property (nonatomic,strong) UIPageControl *pageControl;

@property (nonatomic,strong) UIImageView *leftView;
@property (nonatomic,strong) UIImageView *midView;
@property (nonatomic,strong) UIImageView *rightView;

@property (nonatomic,strong) NSArray *imageNameArray;
@property (nonatomic,assign) NSUInteger currentIndex;

@end

@implementation NewRunLoopScroll

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createView:frame];
        _currentIndex = 1;
    }
    
    return self;
}

- (void)createView:(CGRect)frame
{
    self.mScroll = [[UIScrollView alloc]initWithFrame:frame];
    
    self.mScroll.delegate = self;
    self.mScroll.contentSize = CGSizeMake(SWIDTH*3, SHEIGHT);
    self.mScroll.contentOffset = CGPointMake(SWIDTH, 0);
    self.mScroll.pagingEnabled = YES;
    
    [self addSubview:self.mScroll];
    
    self.leftView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SWIDTH, SHEIGHT)];
    self.midView = [[UIImageView alloc]initWithFrame:CGRectMake(SWIDTH, 0, SWIDTH, SHEIGHT)];
    self.rightView = [[UIImageView alloc]initWithFrame:CGRectMake(SWIDTH*2, 0, SWIDTH, SHEIGHT)];
    [self.mScroll addSubview:self.leftView];
    [self.mScroll addSubview:self.midView];
    [self.mScroll addSubview:self.rightView];

}
- (void)setImageNameArray:(NSArray *)imageNameArray
{
    _imageNameArray = imageNameArray;
    
    _leftView.image = [UIImage imageNamed:_imageNameArray[0]];
    _midView.image = [UIImage imageNamed:_imageNameArray[1]];
    _rightView.image = [UIImage imageNamed:_imageNameArray[2]];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger offsetX = scrollView.contentOffset.x;
    if (offsetX == 0) {
        _currentIndex = (_currentIndex - 1)%_imageNameArray.count;

        
    }else if(offsetX == SWIDTH *2){
        
        _currentIndex = (_currentIndex + 1)%_imageNameArray.count;
        
        
    }else{
        
        return;
    }
//    NSUInteger tCount = _imageNameArray.count;
    
    _leftView.image  =[UIImage imageNamed:_imageNameArray[(_currentIndex-1)%_imageNameArray.count]];
    _midView.image =[UIImage imageNamed:_imageNameArray[(_currentIndex)%_imageNameArray.count]];
    _rightView.image=[UIImage imageNamed:_imageNameArray[(_currentIndex+1)%_imageNameArray.count]];
    
    scrollView.contentOffset = CGPointMake(SWIDTH, 0);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
