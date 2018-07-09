//
//  DBManager.m
//  PrepareInterView
//
//  Created by USER on 2017/5/31.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "DBManager.h"

#import <sqlite3.h>

static sqlite3 *db = nil;

@implementation DBManager

+ (sqlite3 *)open{
    
    
    if (db != nil) {
        return db;
    }
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *sqlPath = [docPath stringByAppendingString:@"stuDB.sqlite"];
    
    NSLog(@"%@",sqlPath);
    NSFileManager *mgr = [NSFileManager defaultManager];
    
//    if ([mgr fileExistsAtPath:sqlPath] == NO) {
//        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"stuDB" ofType:@"sqlite"];
//        [mgr copyItemAtPath:filePath toPath:sqlPath error:nil];
//        
//    }
    
    if(sqlite3_open([sqlPath UTF8String], &db) == SQLITE_OK){
        NSLog(@"打开数据库");
    }
    
    return db;
}

+ (void)close
{
    sqlite3_close(db);
    
    db=nil;
}

@end
