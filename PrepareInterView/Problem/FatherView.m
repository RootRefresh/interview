//
//  FatherView.m
//  PrepareInterView
//
//  Created by USER on 2017/6/13.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "FatherView.h"

@implementation FatherView

- (void)findUIViewController
{
    id obj = [self nextResponder];
    int i = 0;
    while (![obj isKindOfClass:[UIViewController class]]&&obj != nil) {
        NSLog(@"%d---%@",i++,obj);

        obj = [obj nextResponder];
        
    }
    
    NSLog(@"%@",obj);
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    UIView *v = [super hitTest:point withEvent:event];
//    
//    if (v == nil) {
//        
//        for (UIView *subView in self.subviews) {
//            
//            CGPoint myPoint = [subView convertPoint:point fromView:self];
//            NSLog(@"x=%f,y=%f",point.x,point.y);
//            if (CGRectContainsPoint(subView.bounds, myPoint)) {
////                NSLog(@"&&&&&&");
//                return  subView;
//            }
//            
//        }
//        
//    }
//    
//    return v;
//}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    
    for (UIView *subView in self.subviews) {
        
        CGPoint p = [subView convertPoint:point fromView:self];
        
        if (CGRectContainsPoint(subView.bounds, p )) {
            return YES;

        }
        
    }
    return NO;
//    NSLog(@"x=%f,y=%f",point.x,point.y);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
