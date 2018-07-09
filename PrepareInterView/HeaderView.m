//
//  HeaderView.m
//  PrepareInterView
//
//  Created by USER on 2017/5/23.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView()
@property (nonatomic ,strong) UIImageView *headerView;

@end

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        self.headerView = [[UIImageView alloc]initWithFrame:frame];
        self.headerView.image = [UIImage imageNamed:@"headerImg1"];
        [self addSubview:self.headerView];
    }
    return self;
}
- (void)setOffSetY:(CGFloat)offSetY
{
    CGFloat Y = offSetY;
    CGFloat W = self.frame.size.width  - offSetY;
    CGFloat H = self.frame.size.height - offSetY;
    
    self.headerView.frame = CGRectMake(Y/2, Y,W, H);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
