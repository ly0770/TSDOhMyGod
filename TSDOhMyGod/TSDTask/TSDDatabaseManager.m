//
//  TSDDatabaseManager.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/5.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "TSDDatabaseManager.h"
#import "FMDB.h"
@interface TSDDatabaseManager()
@end

@implementation TSDDatabaseManager
+ (instancetype)defaultManager {
    static dispatch_once_t onceToken;
    static id shareInstance;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

- (FMDatabase *)getDB{
    static dispatch_once_t onceToken;
    static id database;
    dispatch_once(&onceToken, ^{
        database = [FMDatabase databaseWithPath:[self dbPathWithName:self.m_dbName]];
    });
    return database;
}

- (BOOL)openDB {
    BOOL isOpened = [[[TSDDatabaseManager defaultManager] getDB] open];
    return isOpened;
}

- (BOOL)closeDB {
    BOOL isClosed = [[[TSDDatabaseManager defaultManager] getDB] close];
    return isClosed;
}

- (BOOL)createTableWithName:(NSString *)tableName items:(NSArray<NSString *> *)items{
    //name:任务名称
    //type:任务分类
    //start_time:开始时间
    //end_time:结束时间
    //repeat_type:重复类型（每天或周几）每天：0 周n:n
    //alert_time:提醒时间
    //is_over:是否结束
// CREATE TABLE IF NOT EXISTS TaskTable (name TEXT primary key,type TEXT,start_time TEXT,end_time TEXT,repeat_type TEXT,alert_time TEXT is_over INTEGER);//
//    NSString *str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY autoincrement, name TEXT,type TEXT,start_time TEXT,end_time TEXT,repeat_type TEXT,alert_time TEXT, is_over INTEGER)",tableName];
    NSString *str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY autoincrement, AA TEXT,BB TEXT,CC TEXT,DD TEXT,EE TEXT,FF TEXT, GG INTEGER)",tableName];
    BOOL isCreated = [[[TSDDatabaseManager defaultManager] getDB] executeUpdate:str];
    return isCreated;
}
- (BOOL)deleteTableWithName:(NSString *)tableName {
//    DROP TABLE IF EXISTS tbl_name;
    return YES;
}
- (BOOL)insertIntoTable:(NSString *)tableName insertItems:(NSArray <NSDictionary *>*)items {
    // INSERT OR REPLACE INTO UserTable (username , password,email) VALUES (?,?,?);
//    NSString *str = [NSString stringWithFormat:@"INSERT OR REPLACE INTO TaskTable (name, type, start_time, end_time, repeat_type, alert_time, is_over) VALUES ('任务1','学习','2017-4-11','2017-4-15','0','12',0)"];
    
//    NSMutableString *strs = [[NSMutableString alloc] initWithString:@"INSERT OR REPLACE INTO TaskTable ("];
    if (![self isTableExist:tableName]) {
        [self createTableWithName:tableName items:nil];
    }
    NSMutableString *strs = [[NSMutableString alloc] initWithFormat:@"INSERT INTO %@ (",tableName];
    for (NSInteger i = 0; i<items.count; i++) {
        NSDictionary *dic = items[i];
        NSArray *keyArr = [dic allKeys];
        for (NSInteger j = 0; j<keyArr.count; j++) {
            if (j == keyArr.count-1) {
                [strs appendFormat:@"%@) VALUES (",keyArr[j]];
            } else {
                [strs appendFormat:@"%@,",keyArr[j]];
            }
            
        }
        for (NSInteger j = 0; j<keyArr.count; j++) {
            if (j == keyArr.count-1) {
                [strs appendFormat:@"'%@')",dic[keyArr[j]]];
            } else {
                [strs appendFormat:@"'%@',",dic[keyArr[j]]];
            }
        }
    }
    NSLog(@"insert str :%@",strs);
    BOOL isInserted = [[[TSDDatabaseManager defaultManager] getDB] executeUpdate:strs];
    return isInserted;
    
}

- (void)updateTable:(NSString *)tableName updateItem:(NSArray <NSDictionary *>*)items{
    
}

- (void)deleteItems {
    
}
- (void)query {
    
    NSString *str = @"SELECT * FROM TaskTable";
    FMResultSet *result = [[[TSDDatabaseManager defaultManager] getDB] executeQuery:str];
    while ([result next]) {
        NSLog(@"%@",[result resultDictionary]);

    }
}

- (NSString *)dbPathWithName:(NSString *)dbName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
//    NSString *fileName = [NSString stringWithFormat:@"%@", dbName];
    NSString *filePath = [documentDirectory stringByAppendingPathComponent:dbName];
    return filePath;
}

- (BOOL)isTableExist:(NSString *)tableName {
    FMResultSet *rs = [[[TSDDatabaseManager defaultManager] getDB] executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
    while ([rs next]) {
        // just print out what we've got in a number of formats.
        NSInteger count = [rs intForColumn:@"count"];
        NSLog(@"isTableOK %d", count);
        if (0 == count)
            return NO;
        else
            return YES;
    }
    return NO;
}
@end
