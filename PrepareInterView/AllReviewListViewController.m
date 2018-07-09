//
//  AllReviewListViewController.m
//  PrepareInterView
//
//  Created by USER on 2017/6/4.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "AllReviewListViewController.h"

#import "ViewController.h"

#import "MyDrawerViewController.h"
#import "OpenCloseFaceViewController.h"
#import "RunLoopScrollView.h"
#import "HeadBlowUpViewController.h"
#import "RunTimeViewController.h"
#import "CollectionEnumViewController.h"

#import "ProblemViewController.h"
#import "NetViewController.h"

#import "KVCKVOViewController.h"
#import "DynamicsViewController.h"
#define ADD(x) x+x


@interface AllReviewListViewController ()

@property (nonatomic,strong) NSArray *listArr;

@end

@implementation AllReviewListViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"复习列表";
    
    //@"循环滚动scrollView" 在捂眼中
    
    NSLog(@"%d",5*ADD(5));
    
    _listArr = @[@"多线程(GCD,NSOpration)",@"抽屉效果",@"登录捂眼睛",@"下拉放大头部视图",@"运行时关联对象",@"容器枚举",@"面试问题",@"网络请求基础",@"KVC&KVO",@"UIKit_Dynamics"];
  
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ID"];
    
    __block int i = 0;
//    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        
//        NSLog(@"%d",i++);
//    }];
    
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        
//         NSLog(@"%d",i++);
//        
//    }];
//    
//    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _listArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID" forIndexPath:indexPath];
    
    cell.textLabel.text = _listArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *tmp;
    switch (indexPath.row) {
        case 0:
        {
            tmp = [[ViewController alloc]init];
            
            break;
        }
        case 1:
        {
            tmp = [[MyDrawerViewController alloc]init];
            
            break;
        }
        case 2:
        {
            tmp = [[OpenCloseFaceViewController alloc]init];
            
            break;
        }
//        case 3:
//        {
//            tmp = [[RunLoopScrollView alloc]init];
//            
//            break;
//        }
        case 3:
        {
            tmp = [[HeadBlowUpViewController alloc]init];
            self.navigationController.navigationBar.hidden = YES;
            break;
        }
        case 4:
        {
            tmp = [[RunTimeViewController alloc]init];
            
            break;
        }case 5:
        {
            tmp = [[CollectionEnumViewController alloc]init];
            break;
        }case 6:
        {
            tmp = [[ProblemViewController alloc]init];
            break;
        }case 7:
        {
            tmp = [[NetViewController alloc]init];
            break;
        }case 8:
        {
            tmp = [[KVCKVOViewController alloc]init];
            break;
        }case 9:
        {
            tmp = [[DynamicsViewController alloc]init];
            break;
        }
    }
    
    [self.navigationController pushViewController:tmp animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
