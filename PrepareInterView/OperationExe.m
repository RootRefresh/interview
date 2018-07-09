//
//  OperationExe.m
//  PrepareInterView
//
//  Created by USER on 2017/5/21.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "OperationExe.h"

@interface OperationExe()

@property (nonatomic,assign) NSInteger mCount;

@end

@implementation OperationExe
- (void)test1
{
    NSOperation *op = [[NSOperation alloc]init];
    [op start];
    [op cancel];
    
    [op setCompletionBlock:^{
        
        NSLog(@"end");
    }];
}

- (void)addBlock
{
    NSBlockOperation *block = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"HH,%@",[NSThread currentThread]);
    }];
   
    for (int i = 0; i < 10; i++) {
        
        [block addExecutionBlock:^{
            
            NSLog(@"%d,%@",i,[NSThread currentThread]);
            
        }];
    }
    [block setCompletionBlock:^{
        
        NSLog(@"over");
        
    }];
    
    [block start];
    
    
}

- (void)nsoperation
{
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(test1:) object:@"10"];
    
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(test2:) object:@"100"];
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    [op2 addDependency:op1];
    
    [queue addOperation:op1];
    [queue addOperation:op2];
    
//    NSLog(@"%d",queue.maxConcurrentOperationCount);
    
//    NSOperation *o = [[NSOperation alloc]init];
    
}

- (void)testThread
{
    
    self.mCount = 10;
    NSThread *t1 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
    t1.name = @"01";
    
    NSThread *t2 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
    t2.name = @"02";
    
    NSThread *t3 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
    t3.name = @"03";
    
    [t1 start];
    [t2 start];
    [t3 start];
}
- (void)saleTicket
{
    while (1) {
        @synchronized (self) {
            
        
            NSInteger count = self.mCount;
            
            if (count > 0) {
                
                self.mCount = count -1;
                NSLog(@"线程 %@   卖了一张票，还剩下%zd张", [NSThread currentThread].name, self.mCount);
                
            }else{
                NSLog(@" 线程 %@   票已经卖完了",[NSThread currentThread].name);
                break;
            }
        }
        
//        [NSLock lock];
    }
    
//    2017-05-22 15:49:18.636 PrepareInterView[76161:3103372] 线程 03   卖了一张票，还剩下7张
//    2017-05-22 15:49:18.636 PrepareInterView[76161:3103370] 线程 01   卖了一张票，还剩下8张
//    2017-05-22 15:49:18.636 PrepareInterView[76161:3103371] 线程 02   卖了一张票，还剩下9张
//    2017-05-22 15:49:18.637 PrepareInterView[76161:3103372] 线程 03   卖了一张票，还剩下6张
    
}
- (void)test1:(NSString *)str
{
    NSLog(@"%@",str);
}


- (void)test2:(NSString *)str
{
    NSLog(@"%@",str);
}

@end
