//
//  HeadBlowUpViewController.m
//  PrepareInterView
//
//  Created by USER on 2017/5/23.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "HeadBlowUpViewController.h"
#import "HeaderView.h"
#import "YYCustomNav.h"

#define VIEW_WIDTH self.view.bounds.size.width
#define VIEW_HIGHT self.view.bounds.size.height

@interface HeadBlowUpViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,strong) HeaderView *headerView;
@property (nonatomic ,strong) YYCustomNav *nav;
@end

@implementation HeadBlowUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configTableView];
    [self createNav];

    // Do any additional setup after loading the view.
}

- (void)createNav
{
    self.nav = [[YYCustomNav alloc]init];
//    nav.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.nav];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView == _tableView){
        CGFloat offSetY = scrollView.contentOffset.y;
      
        NSLog(@"%f",offSetY);

        if (offSetY < 0) {
           
            
            [self.headerView setOffSetY:offSetY];
            
        }else{
            

            [self.headerView setOffSetY:0];

            
        }
        if (offSetY < (300-64)) {
            CGFloat al  = offSetY/300;
            self.nav.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:al];

            
        }else{
            self.nav.backgroundColor = [UIColor whiteColor];
        }
        
       
    }
}

- (void)configTableView
{

    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    _tableView.bounces = NO;

    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView = self.headerView;

    [self.view addSubview:_tableView];
    
}
-(HeaderView *)headerView{
    if (_headerView == nil) {
        _headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 300)];
    }
    return _headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellId = @"numberCell";
    UITableViewCell* cell= [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentView.backgroundColor = [UIColor orangeColor];
    }
    cell.textLabel.text = @"111";
    return cell;
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
