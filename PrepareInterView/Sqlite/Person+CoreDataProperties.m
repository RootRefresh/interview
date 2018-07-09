//
//  Person+CoreDataProperties.m
//  PrepareInterView
//
//  Created by USER on 2017/6/1.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Person"];
}

@dynamic age;
@dynamic id;
@dynamic name;

@end
