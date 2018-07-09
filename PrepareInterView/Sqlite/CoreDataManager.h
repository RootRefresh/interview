//
//  CoreDataManager.h
//  PrepareInterView
//
//  Created by USER on 2017/6/1.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreData/CoreData.h>


@interface CoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectModel *objectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *objectContext;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStore;

+ (CoreDataManager *)shareManager;

- (void)test;

@end
