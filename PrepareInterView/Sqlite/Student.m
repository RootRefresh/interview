//
//  Student.m
//  PrepareInterView
//
//  Created by USER on 2017/5/31.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "Student.h"
#import "DBManager.h"
#import <sqlite3.h>
@implementation Student

- (void)createTable
{
    NSString *sql = @"create table if not exists stu(ID integer primary key,name text not null, gender text default '男')";
    
    sqlite3 *db = [DBManager open];
    
    int result = sqlite3_exec(db , sql.UTF8String, nil, nil, nil);
    
    if (result == SQLITE_OK) {
        
        NSLog(@"建表成功");
    }else{
        NSLog(@"建表error");

    }
    
    [DBManager close];
    
}

- (void)insert
{
    for (int i = 0; i<5; i++) {
        
        NSString *sql = [NSString stringWithFormat:@"insert into stu(ID,name,gender)values('%d','hh','女');",arc4random()];
        
        char * err;
        
       sqlite3_exec([DBManager open], sql.UTF8String, nil, nil, &err);
        
        if (err) {
            NSLog(@"插入失败%s",err);
        }else{
            NSLog(@"插入成功");
        }
    }
    [DBManager close];
}

- (void)deleter
{
    NSString *sql = @"delete from stu where ID < 0";
    char * err;
    sqlite3_exec([DBManager open], sql.UTF8String, nil, nil, &err);
    
    if (err) {
        NSLog(@"删除失败%s",err);
    }else{
        NSLog(@"删除成功");
    }
    
    [DBManager close];

}

- (void)update
{
    NSString *sql =@"update stu set name = '王' where ID = 0;";
    char * err;

    sqlite3_exec([DBManager open], sql.UTF8String, nil, nil, &err);
    
    if (err) {
        NSLog(@"更新失败%s",err);
    }else{
        NSLog(@"更新成功");
    }
    
    [DBManager close];
}

- (void)selectAll
{
    NSString *sql = @"select * from stu;";
    
    sqlite3_stmt *stmt;
    
    if (sqlite3_prepare([DBManager open], sql.UTF8String, -1, &stmt, NULL) == SQLITE_OK) {
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
           
            //sqlite3_column_text('句柄'，字段索引值)
           
            NSString *name = [NSString stringWithCString:(const char*)sqlite3_column_text(stmt, 2) encoding:NSUTF8StringEncoding];
            
            NSLog(@"name = %@", name);
            
            
        }
        
        
    }
}
@end
