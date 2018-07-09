//
//  RunLoopScrollView.h
//  PrepareInterView
//
//  Created by USER on 2017/5/24.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RunLoopScrollView : UIView

@property (nonatomic,assign) NSInteger totalCount;

@property (nonatomic,strong) NSTimer *timer;

- (void)addImageToScroll:(NSArray *)imgArray;

@end
