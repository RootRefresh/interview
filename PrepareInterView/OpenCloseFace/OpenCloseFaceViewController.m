//
//  OpenCloseFaceViewController.m
//  PrepareInterView
//
//  Created by USER on 2017/5/23.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "OpenCloseFaceViewController.h"

#import "RunLoopScrollView.h"

#import "NewRunLoopScroll.h"

#import "Student.h"

#import "CoreDataManager.h"
@interface OpenCloseFaceViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *userInput;
@property (nonatomic,strong) UITextField *passwordInput;
@property (nonatomic,strong) UIImageView *leftHand;
@property (nonatomic,strong) UIImageView *rightHand;
@property (nonatomic,strong) UIImageView *leftArm;
@property (nonatomic,strong) UIImageView *rightArm;


@end

@implementation OpenCloseFaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    
    
//    Student *stu = [Student new];
    
//    [stu createTable];
//    [stu insert];
//    [stu deleter];
//    [stu update];
//    [stu selectAll];
    
//    CoreDataManager *mgr = [CoreDataManager shareManager];
//    [mgr test];
    
}

- (void)createView
{
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-211/2, 30, 211, 108)];
    imgView.image = [UIImage imageNamed:@"head"];
    [self.view addSubview:imgView];
    
    UIVisualEffectView *bgView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    bgView.frame =  CGRectMake(self.view.frame.size.width/5, CGRectGetMaxY(imgView.frame), self.view.frame.size.width/5*3, 100);
    
    bgView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bgView];
    
    self.leftHand = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(bgView.frame), CGRectGetMinY(bgView.frame)-30, 50, 50)];
    self.leftHand.image = [UIImage imageNamed:@"hand"];
    [self.view addSubview:self.leftHand];
    
    self.rightHand = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(bgView.frame)-50, CGRectGetMinY(bgView.frame)-30, 50, 50)];
    self.rightHand.image = [UIImage imageNamed:@"hand"];

    [self.view addSubview:self.rightHand];

    self.leftArm = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50, CGRectGetMinY(bgView.frame)-40, 40, 65)];
    self.leftArm.image = [UIImage imageNamed:@"left_arm"];
    [self.view addSubview:self.leftArm];
    
    self.rightArm = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+10, CGRectGetMinY(bgView.frame)-40, 40, 65)];
    self.rightArm.image = [UIImage imageNamed:@"right_arm"];
    [self.view addSubview:self.rightArm];
    
    
    self.userInput = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, self.view.frame.size.width/2-20, 30)];
    self.userInput.delegate = self;
    self.userInput.layer.borderWidth = 1;
    self.userInput.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:self.userInput];
    
    self.passwordInput = [[UITextField alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.userInput.frame)+20, CGRectGetWidth(self.userInput.frame), 30)];
    self.passwordInput.delegate = self;
    self.passwordInput.layer.borderWidth = 1;
    self.passwordInput.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:self.passwordInput];
    
    RunLoopScrollView *runLoop = [[RunLoopScrollView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    [runLoop addImageToScroll:@[@"headerImg1",@"headerImg2",@"headerImg3"]];
    [self.view addSubview:runLoop];
    
//    NewRunLoopScroll *newRun = [[NewRunLoopScroll alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
//    [newRun setImageNameArray:@[@"bgImage",@"headerImg1",@"headerImg2",@"headerImg3"]];
//    [self.view addSubview:newRun];

}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.userInput) {
        
        [UIView animateWithDuration:1 animations:^{
            self.leftHand.hidden = NO;
            self.rightHand.hidden= NO;
            
            CGRect leftRect = self.leftHand.frame;
            leftRect.origin.x -= 30;
            leftRect.origin.y += 10;
            self.leftHand.frame = leftRect;
            
            CGRect rightRect = self.rightHand.frame;
            rightRect.origin.x += 30;
            rightRect.origin.y += 10;
            self.rightHand.frame = rightRect;
            
            
            
            
            CGRect leftArmRect = self.leftHand.frame;
            leftArmRect.origin.x -= 5;
            leftArmRect.origin.y += 10;
            self.leftArm.frame = leftArmRect;
            
            CGRect rightArmRect = self.rightHand.frame;
            rightArmRect.origin.x += 5;
            rightArmRect.origin.y += 10;
            self.rightArm.frame = rightArmRect;

//            self.leftArm.frame = CGRectMake(self.leftArm.frame.origin.x - 70, self.leftArm.frame.origin.y, 40, 40);
//            
//            self.rightArm.frame = CGRectMake(self.rightArm.frame.origin.x + 30, self.rightArm.frame.origin.y, 40, 40);
            
        } completion:^(BOOL finished) {
            self.leftArm.hidden = YES;
            self.rightArm.hidden= YES;
            
        }];
        
    }else{
        [UIView animateWithDuration:1 animations:^{
            
            self.leftArm.hidden = NO;
            self.rightArm.hidden= NO;
            CGRect leftRect = self.leftHand.frame;
            leftRect.origin.x += 30;
            leftRect.origin.y -= 10;
            self.leftHand.frame = leftRect;
            
            CGRect rightRect = self.rightHand.frame;
            rightRect.origin.x -= 30;
            rightRect.origin.y -= 10;
            self.rightHand.frame = rightRect;
            
            CGRect leftArmRect = self.leftHand.frame;
            leftArmRect.origin.x += 5;
//            leftArmRect.origin.y -= 50;
            self.leftArm.frame = leftArmRect;
            
            CGRect rightArmRect = self.rightHand.frame;
            rightArmRect.origin.x -= 5;
//            rightArmRect.origin.y -= 50;
            self.rightArm.frame = rightArmRect;
            
//            self.leftArm.frame = CGRectMake(self.leftArm.frame.origin.x + 70, self.leftArm.frame.origin.y, 40, 40);
//            
//            self.rightArm.frame = CGRectMake(self.rightArm.frame.origin.x - 30, self.rightArm.frame.origin.y, 40, 40);
            
        } completion:^(BOOL finished) {
            
            self.leftHand.hidden = YES;
            self.rightHand.hidden= YES;

            
        }];
        
        
        
    }
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
