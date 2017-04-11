//
//  TSDUser.h
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/1.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSDUser : NSObject
/*
 **
 */
+ (instancetype)userInstance;
/*
 **修改导航栏颜色和透明度，alpha为必填
 */
- (void)setNavBarColorWithNavBar:(UINavigationBar *)navBar color:(UIColor *)color alpha:(CGFloat)alpha;
/*
 **读取json文件数据
 */
- (NSArray *)readDataFromJsonFile:(NSString *)fileName;
/*
 **将NSLog打印到外部文件
 */
- (void)redirectNSlogToDocumentFolder;
@end
