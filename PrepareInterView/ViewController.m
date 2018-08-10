//
//  ViewController.m
//  PrepareInterView
//
//  Created by USER on 2017/5/18.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "ViewController.h"

#import "OperationExe.h"

#import "WeakProxy.h"


@interface ViewController ()
@property (strong) NSArray *aaa;
@property (strong) NSTimer *kTimer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIDevice *de = [UIDevice currentDevice];
    //真机可用
//    de.batteryMonitoringEnabled = YES;
//    NSLog(@"%f",de.batteryLevel);
    
    [self reviewGCD];
    [self testTimer];
//    OperationExe *ex = [[OperationExe alloc]init];
//    [ex nsoperation];
//    [ex test1];
//    [ex testThread];
    NSMutableArray *ma = [NSMutableArray array];
    [ma addObject:@"11"];
    self.aaa = ma;
    NSLog(@"before ## %@",self.aaa);
    [ma addObject:@"222"];
    NSLog(@"after ## %@",self.aaa);

    NSString *s = @"测试";
    NSString *tt = s.copy;
    NSMutableString *ms = s.mutableCopy;
    [ms appendString:@"ddd"];
    
    NSString * test = ms.copy;
    
    NSLog(@"%p --- %p -- %p -- %p", s, tt, ms, test);
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
//    [self.kTimer invalidate];
    CALayer *ca = [[CALayer alloc]init];
}

- (void)dealloc
{
    [self.kTimer invalidate];

}
- (void)timerItem
{
    NSLog(@"timer");

}
- (void)testTimer
{
//    self.kTimer = [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"timer");
//    }];
//
    self.kTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:[WeakProxy proxyWithTarget:self] selector:@selector(timerItem) userInfo:nil repeats:YES];
}
- (void)reviewGCD
{
    dispatch_queue_t queue;
    queue = dispatch_queue_create("HH", NULL);
//    char * a = ;
    const char *a = dispatch_queue_get_label(queue);
    NSLog(@"%s", a);
    
//    [self syncSerial];
//    [self syncConcurrent];  //
    
//    [self asyncConcurrent];//开多个线程，异步执行
//    [self asyncSerial]; //不在主线程上且只开一个线程
//    [self syncMain];
    

//    
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    [self apply:globalQueue];

//    dispatch_main();
    
//    [self test5];
//    [self test6];
    
//    [self test7];
//    [self test8];
    
    
//    [self group];
//    [self barrier];
//    [self loadImage];
    
//    [self setTarget];
    
//    int context = 10;
//    dispatch_async_f(dispatch_get_main_queue(), &context, testC);
 
    
//    [self after];
    
//    [self setKey];
//    [self singletonSema];
//    [self test111];
}
- (void)test111
{
    NSLog(@"1");
    
    dispatch_sync(dispatch_get_main_queue(), ^{
       
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            NSLog(@"2");
            
        });
        
    });
    
    NSLog(@"3");
}
- (void)singletonSema
{
    dispatch_semaphore_t sema = dispatch_semaphore_create(10);
    
    for (int i = 0; i < 10; i++) {
        
        NSLog(@"%ld", dispatch_semaphore_wait(sema, DISPATCH_TIME_NOW));
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
//            NSLog(@"%d,%@",i, [NSThread currentThread]);
        });
        
        
       NSLog(@"%ld",  dispatch_semaphore_signal(sema));
        
    }
    
    
}

- (void)singleton
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
    });
    

}

static const void * const kDispatchQueueSpecificKey = &kDispatchQueueSpecificKey;

- (void)setKey
{
    dispatch_queue_t q = dispatch_queue_create("ss", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_set_specific(q, kDispatchQueueSpecificKey, (__bridge void * _Nullable)(self), NULL);
    
    dispatch_async(q, ^{
        
        if (dispatch_get_specific(kDispatchQueueSpecificKey)) {
            NSLog(@"1");
        }
        
    });
    

    
    
}
void testC()
{
    NSLog(@"112344");
}

- (void)after
{
    NSLog(@"after begin");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"$$$%%");
    });
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 6*NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        
        NSLog(@"#####");

    });
    
    dispatch_after_f(time, dispatch_get_main_queue(), NULL, testC);
}

- (void)setTarget
{
    //创建一个串行队列queue1
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);

    dispatch_queue_t queue1 = dispatch_queue_create("test.1", DISPATCH_QUEUE_SERIAL);
    //创建一个串行队列queue2
    dispatch_queue_t queue2 = dispatch_queue_create("test.2", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_set_target_queue(queue1, queue);

    dispatch_set_target_queue(queue2, queue);
    //使用dispatch_set_target_queue()实现队列的动态调度管理
//    dispatch_set_target_queue(queue1, queue2);
    
    
    /*
     
     <*>dispatch_set_target_queue(Dispatch Queue1, Dispatch Queue2);
     那么dispatchA上还未运行的block会在dispatchB上运行。这时如果暂停dispatchA运行：
     
     <*>dispatch_suspend(dispatchA);
     这时则只会暂停dispatchA上原来的block的执行，dispatchB的block则不受影响。而如果暂停dispatchB的运行，则会暂停dispatchA的运行。
     
     这里只简单举个例子，说明dispatch队列运行的灵活性，在实际应用中你会逐步发掘出它的潜力。
     
     dispatch队列不支持cancel（取消），没有实现dispatch_cancel()函数，不像NSOperationQueue，不得不说这是个小小的缺憾
     
     */
    
    dispatch_async(queue2, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"queue2:%@, %ld", [NSThread currentThread], i);
            if (i == 5) {
                dispatch_suspend(queue2);
               

                    for (NSInteger j = 0; j < 10; j++) {
                        NSLog(@"queue1:%@, %ld", [NSThread currentThread], j);
                        [NSThread sleepForTimeInterval:0.5];
                        
                        if (j == 5) {
                            dispatch_resume(queue2);
                        }
                    }
            

            }
        }
    });
   
   
    
   
    
    
    
}
- (void)loadImage
{
    UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 50, 200, 300)];
    [self.view addSubview:imgV];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        
        NSURL *url = [NSURL URLWithString:@"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        if (data) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                imgV.image = [UIImage imageWithData:data];
            });
        }
        
        
    });
}

- (void)barrier
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i =0 ; i < 6; i++) {
        dispatch_async(queue, ^{
            
            NSLog(@"%d",i);
        });
    }
    
    dispatch_barrier_async(queue, ^{
        
        NSLog(@"barrier");
        [NSThread sleepForTimeInterval:4];
    });
    
    for (int i =0 ; i < 3; i++) {
        dispatch_async(queue, ^{
            
            NSLog(@"%d",i);
        });
    }
}
- (void)group
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"1");
        
    });
    
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:2];

        NSLog(@"2");
        
    });
   
    
    dispatch_group_notify(group, queue, ^{
        
        NSLog(@"main refresh");
    });
}

- (void)apply:(dispatch_queue_t)q
{
    dispatch_async(q, ^{
        dispatch_apply(5, q, ^(size_t index) {
            
            NSLog(@"%zu,%@",index,[NSThread currentThread]);
        });
        
        dispatch_apply_f(3, q, NULL, testC);
        
    });
    
}
-(void)test8{
    dispatch_queue_t q = dispatch_queue_create("fs", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"start--%@",[NSThread currentThread]);
    for (int i=0; i<10; i++) {
        dispatch_sync(q, ^{
            NSLog(@"sync--%@---%d",[NSThread currentThread],i);
        });
    }
    NSLog(@"end1--%@",[NSThread currentThread]);
    for (int i=0; i<10; i++) {
        dispatch_async(q, ^{
            NSLog(@"async--%@---%d",[NSThread currentThread],i);
        });
    }
    NSLog(@"end2--%@",[NSThread currentThread]);
}

-(void)test7{
    dispatch_queue_t q = dispatch_queue_create("fs", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"start--%@",[NSThread currentThread]);
    for (int i=0; i<10; i++) {
        dispatch_async(q, ^{
            NSLog(@"async--%@---%d",[NSThread currentThread],i);
        });
    }
    NSLog(@"end1--%@",[NSThread currentThread]);
    for (int i=0; i<10; i++) {
        dispatch_sync(q, ^{
            NSLog(@"sync--%@---%d",[NSThread currentThread],i);
        });
    }
    NSLog(@"end2--%@",[NSThread currentThread]);
}

-(void)test5{
    dispatch_queue_t q = dispatch_queue_create("fs", DISPATCH_QUEUE_SERIAL);
    NSLog(@"start--%@",[NSThread currentThread]);
    for (int i=0; i<10; i++) {
        dispatch_async(q, ^{
            NSLog(@"async--%@---%d",[NSThread currentThread],i);
        });
    }
    NSLog(@"end1--%@",[NSThread currentThread]);
    for (int i=0; i<10; i++) {
        dispatch_sync(q, ^{
            NSLog(@"sync--%@---%d",[NSThread currentThread],i);
        });
    }
    NSLog(@"end2--%@",[NSThread currentThread]);
}

-(void)test6{
    dispatch_queue_t q = dispatch_queue_create("fs", DISPATCH_QUEUE_SERIAL);
    NSLog(@"start--%@",[NSThread currentThread]);
    for (int i=0; i<10; i++) {
        dispatch_sync(q, ^{
            NSLog(@"sync--%@---%d",[NSThread currentThread],i);
        });
    }
    NSLog(@"end1--%@",[NSThread currentThread]);
    for (int i=0; i<10; i++) {
        dispatch_async(q, ^{
            NSLog(@"async--%@---%d",[NSThread currentThread],i);
        });
    }
    NSLog(@"end2--%@",[NSThread currentThread]);
}
- (void)syncConcurrent
{
    //创建一个并行队列
    dispatch_queue_t q1 = dispatch_queue_create("1", DISPATCH_QUEUE_CONCURRENT);
    
    [self sync:q1];
}

- (void)syncSerial
{
    dispatch_queue_t queue = dispatch_queue_create("2", DISPATCH_QUEUE_SERIAL);
    
    [self sync:queue];
}

- (void)asyncConcurrent
{
    //创建一个并行队列
//    dispatch_queue_t q1 = dispatch_queue_create("1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t q1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    [self async:q1];
}

- (void)asyncSerial
{
    dispatch_queue_t queue = dispatch_queue_create("2", DISPATCH_QUEUE_SERIAL);
    
    [self async:queue];
    
    //出现下面的不同情况
//    PrepareInterView[44748:2669251] start
//    2017-05-18 22:27:07.558 PrepareInterView[44748:2669342] 1
//    2017-05-18 22:27:07.558 PrepareInterView[44748:2669342] 2
//    2017-05-18 22:27:07.558 PrepareInterView[44748:2669251] end
//    2017-05-18 22:27:07.558 PrepareInterView[44748:2669342] 3
    
//    PrepareInterView[44780:2669830] start
//    2017-05-18 22:27:49.597 PrepareInterView[44780:2669830] end
//    2017-05-18 22:27:49.597 PrepareInterView[44780:2669945] 1
//    2017-05-18 22:27:49.597 PrepareInterView[44780:2669945] 2
//    2017-05-18 22:27:49.597 PrepareInterView[44780:2669945] 3

//    2017-05-18 22:48:45.363 PrepareInterView[45472:2679800] start
//    2017-05-18 22:48:45.364 PrepareInterView[45472:2679800] end
//    2017-05-18 22:48:45.364 PrepareInterView[45472:2679838] 0,<NSThread: 0x60800007be80>{number = 3, name = (null)}
//    2017-05-18 22:48:45.366 PrepareInterView[45472:2679838] 1,<NSThread: 0x60800007be80>{number = 3, name = (null)}
//    2017-05-18 22:48:45.367 PrepareInterView[45472:2679838] 2,<NSThread: 0x60800007be80>{number = 3, name = (null)}
//    2017-05-18 22:48:45.367 PrepareInterView[45472:2679838] 3,<NSThread: 0x60800007be80>{number = 3, name = (null)}
//    2017-05-18 22:48:45.368 PrepareInterView[45472:2679838] 4,<NSThread: 0x60800007be80>{number = 3, name = (null)}
    
}

- (void)syncMain
{
    dispatch_queue_t t = dispatch_get_main_queue();
//    [self async:t];
    [self sync:t];
}

- (void)async:(dispatch_queue_t)queue{
    
    NSLog(@"start");
    
    for (int i=0; i <10; i++) {
        dispatch_async(queue, ^{
            
            NSLog(@"%d,%@",i,[NSThread currentThread]);
        });
    }
    
    
    NSLog(@"end");
    
    
    
}

- (void)sync:(dispatch_queue_t)queue{
    
    NSLog(@"start,%@",[NSThread currentThread]);
    
    for (int i=0; i <10; i++) {
        dispatch_sync(queue, ^{
            
            NSLog(@"%d,%@",i,[NSThread currentThread]);
        });
    }
    
    
    NSLog(@"end,%@",[NSThread currentThread]);
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
