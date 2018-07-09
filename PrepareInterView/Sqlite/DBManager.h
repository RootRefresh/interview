//
//  DBManager.h
//  PrepareInterView
//
//  Created by USER on 2017/5/31.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>

@interface DBManager : NSObject

+ (sqlite3 *)open;

+ (void)close;


@end
