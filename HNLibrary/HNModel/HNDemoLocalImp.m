//
//  HNDemoLocalImp.m
//  HNDemo-iPhone
//
//  Created by shuilin on 5/15/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNDemoLocalImp.h"
#import <CoreData/CoreData.h>
#import "SearchKeyEntity+CoreDataProperties.h"

#define kAppDbName                      @"demo.sqlite"

@interface HNDemoLocalImp ()
{
    dispatch_queue_t queue;
}
@property (strong, nonatomic) NSManagedObjectContext *moc;

@end

@implementation HNDemoLocalImp

+ (instancetype)sharedImp
{
    static HNDemoLocalImp *object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[HNDemoLocalImp alloc] init];
    });
    
    return object;
}

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        queue = dispatch_queue_create("com.enjoyloop.HNDemoLocalImp", NULL);    //串行队列
    }
    
    return self;
}

/* 本地数据库路径 */
- (NSString *)appDbPath
{
    NSURL *URL = [[[NSFileManager defaultManager]
                   URLsForDirectory:NSDocumentDirectory
                   inDomains:NSUserDomainMask] lastObject];
    
    NSString *path = [[URL path] stringByAppendingPathComponent:kAppDbName];
    
    return path;
    
}

- (NSManagedObjectContext *)moc
{
    if(_moc == nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"HNDemo"
                                                  withExtension:@"momd"];
        
        NSManagedObjectModel* objectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        
        [NSManagedObjectModel mergedModelFromBundles:nil];
        
        NSPersistentStoreCoordinator* storeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:objectModel];
        
        NSURL *storeUrl = [NSURL fileURLWithPath:[self appDbPath]];
        NSError *error = nil;
        
        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                                 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption,
                                 nil];
        
        if (![storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:options error:&error])
        {
            NSAssert(0, @"persist init failed!");
        }
        
        NSManagedObjectContext* moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [moc setPersistentStoreCoordinator:storeCoordinator];
        
        _moc = moc;
    }
    
    return _moc;
}

- (NSError *)save:(NSManagedObjectContext *)moc
{
    NSError *error;
    
    BOOL isSaveSuccess = [moc save:&error];
    if (!isSaveSuccess)
    {
        NSLog(@"Error Save: %@,%@",error,[error userInfo]);
    }
    else
    {
        //NSLog(@"Save successful!");
    }
    
    return error;
}

- (NSArray *)executeFetchRequest:(NSFetchRequest *)request error:(NSError **)error moc:(NSManagedObjectContext *)moc
{
    @try {
        NSArray *fetchedObjects = [moc executeFetchRequest:request error:error];
        return fetchedObjects;
    }
    @catch (NSException *exception) {
        
        NSLog(@"查询异常:%@",exception);
    }
    @finally {
        
    }
    
    return nil;
}

//保存搜索关键字
- (void)saveCourseSearchKey:(NSString *)key callback:(HNResultCallback)callback
{
    dispatch_async(queue, ^{
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        
        //指定对象名称
        {
            NSEntityDescription *entity = [NSEntityDescription entityForName:@"SearchKeyEntity" inManagedObjectContext:self.moc];
            [fetchRequest setEntity:entity];
        }
        
        //指定查询条件
        {
            NSPredicate * predicate = [NSPredicate predicateWithFormat:@"key = %@",key];
            [fetchRequest setPredicate:predicate];
        }
        
        
        //执行查找
        {
            NSError *error = nil;
            NSArray *fetchedObjects = [self executeFetchRequest:fetchRequest error:&error moc:self.moc];
            
            //找到（已经存在）
            if(fetchedObjects.count > 0)    //已经存在
            {
                mainResultCallback(callback, nil);
                return;
            }
        }
        
        
        //插入
        {
            SearchKeyEntity *entity = [NSEntityDescription insertNewObjectForEntityForName:@"SearchKeyEntity" inManagedObjectContext:self.moc];
            entity.key = key;
            
            NSError *error = [self save:self.moc];
            
            mainResultCallback(callback, error);
        }
        
    });
}

@end
