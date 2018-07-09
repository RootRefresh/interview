//
//  CoreDataManager.m
//  PrepareInterView
//
//  Created by USER on 2017/6/1.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "CoreDataManager.h"
#import "AppDelegate.h"

#import "Person+CoreDataClass.h"

@implementation CoreDataManager

+ (CoreDataManager *)shareManager
{
    static CoreDataManager *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        obj = [CoreDataManager new];
    });
    
    return obj;
}


- (NSManagedObjectContext *)manageContext
{
    if (_objectContext !=nil) {
        return _objectContext;
    }
    
    _objectContext = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    _objectContext.persistentStoreCoordinator = [self manageStoreCoordinator];

//    id delegate =[UIApplication sharedApplication].delegate;
//    _objectContext = [delegate manageContext];
    
    return _objectContext;
    
}

- (NSManagedObjectModel *)manageModel
{
    if (_objectModel != nil) {
        return _objectModel;
    }
    
    _objectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return  _objectModel;
}


- (NSPersistentStoreCoordinator *)manageStoreCoordinator
{
    if (_persistentStore != nil) {
        return _persistentStore;
    }
    NSURL *storeUrl = [[self docPath] URLByAppendingPathComponent:@"myExample.sqlite"];
    NSLog(@"%@",storeUrl.absoluteString);
    _persistentStore = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self manageModel]];
    
    NSError *error = nil;
    
    NSPersistentStore *store = [_persistentStore addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:nil];
    if (store == nil) {
        [NSException raise:@"添加coredata数据库失败" format:@"%@",[error localizedDescription]];
        
        
    }
    
    
    return _persistentStore;

}

- (NSURL *)docPath
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
}

- (void)test
{
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[self manageContext]];
    
    [person setValue:@0 forKey:@"id"];
    [person setValue:@20 forKey:@"age"];

    [person setValue:@"Yy" forKey:@"name"];

    NSError *err;
    
    BOOL success = [[self objectContext] save:&err];
    
    if (success) {
        
        NSLog(@"success");
        
    }else{
       
        [NSException raise:@"添加coredata数据库失败" format:@"%@",[err localizedDescription]];

    }
    
    
    
}


@end
