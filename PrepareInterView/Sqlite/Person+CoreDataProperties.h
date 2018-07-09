//
//  Person+CoreDataProperties.h
//  PrepareInterView
//
//  Created by USER on 2017/6/1.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nonatomic) int32_t age;
@property (nonatomic) int32_t id;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
