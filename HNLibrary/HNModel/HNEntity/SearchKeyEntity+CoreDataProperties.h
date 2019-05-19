//
//  SearchKeyEntity+CoreDataProperties.h
//  
//
//  Created by shuilin on 5/16/19.
//
//

#import "SearchKeyEntity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SearchKeyEntity (CoreDataProperties)

+ (NSFetchRequest<SearchKeyEntity *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *key;

@end

NS_ASSUME_NONNULL_END
