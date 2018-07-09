//
//  NetViewController.m
//  PrepareInterView
//
//  Created by USER on 2017/6/14.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "NetViewController.h"

@interface NetViewController ()<NSURLSessionDataDelegate>

@end

@implementation NetViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self useNSURLSessionWithURL];

    [self sessionWithDelegate];
}

- (void)useNSURLSessionWithURL
{
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:@"http://www.daka.com/login?username=daka&pwd=123"];
    
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
      NSLog(@"%@",  [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:noErr]);
        
    }];
    
    [task resume];
    
}

- (void)sessionWithRequest
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@""]];
    
    request.HTTPMethod = @"POST";
    
    request.HTTPBody = [@"" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        
    }];
    [task resume];
}




- (void)sessionWithDelegate
{
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://apple.qcwapps.com/app/IOSPayType"]];

    NSURLSession *se = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc]init]];
    
    NSURLSessionTask *task = [se dataTaskWithURL:[NSURL URLWithString:@"http://apple.qcwapps.com/app/IOSPayType"]];
    
    [task resume];
}

//接收服务器响应
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(nonnull NSURLResponse *)response completionHandler:(nonnull void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
    NSLog(@"接到响应");
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];

    NSLog(@"收到数据 %@",str);

}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    NSLog(@"错误停止");
}

//- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session
//{
//    
//}
//
//- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error
//{
//    
//}
//
//- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler
//{
//    
//}


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
