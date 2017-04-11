//
//  TSDDatabaseManager.h
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/5.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
@interface TSDDatabaseManager : NSObject
/*
 **所处理的db的路径
 */
@property (nonatomic, copy) NSString *dbPath;

+ (instancetype)defaultManager;
/*
 **打开db,如果不存在则创建
 */
- (BOOL)openDB;
/*
 **关闭db
 */
- (BOOL)closeDB;
/*
 **创建表
 */
- (BOOL)createTableWithName:(NSString *)tableName items:(NSArray<NSString *> *)items;
/*
 **删除表
 */
- (BOOL)deleteTableWithName:(NSString *)tableName;
/*
 **添加数据
 */
- (BOOL)insertIntoTable:(NSString *)tableName insertItems:(NSArray <NSDictionary *>*)items;
/*
 **更新数据
 */
- (void)updateTable:(NSString *)tableName updateItem:(NSArray <NSDictionary *>*)items;

/*
 **删除数据
 */
- (void)deleteItems;
/*
 **查询数据
 */
- (void)query;


@end
