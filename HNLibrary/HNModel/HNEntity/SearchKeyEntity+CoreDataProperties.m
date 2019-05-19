//
//  SearchKeyEntity+CoreDataProperties.m
//  
//
//  Created by shuilin on 5/16/19.
//
//

#import "SearchKeyEntity+CoreDataProperties.h"

@implementation SearchKeyEntity (CoreDataProperties)

+ (NSFetchRequest<SearchKeyEntity *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"SearchKeyEntity"];
}

@dynamic key;

@end
