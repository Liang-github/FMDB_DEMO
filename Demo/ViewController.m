//
//  ViewController.m
//  Demo
//
//  Created by PengLiang on 2017/11/30.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "ViewController.h"
#import <FMDB.h>

@interface ViewController ()

{
    NSString *fileName;
    BOOL isTableExist;
    int count;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titleArr = @[@"创建表",@"添加数据",@"查询数据",@"更新id = 3数据",@"删除id = 2数据",@"删除表"];
    
    for (int i = 0; i < titleArr.count; i ++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = CGRectMake(30, 50 + 60*i, self.view.frame.size.width - 60, 40);
        [btn setTitle:titleArr[i] forState:0];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor orangeColor];
        btn.tag = i;
        [self.view addSubview:btn];
    }
    
    // 获取数据库文件的路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    fileName = [doc stringByAppendingPathComponent:@"downCourse.sqlite"];
    
}

- (void)btnClick:(UIButton *)sender {
    if (sender.tag == 0) {
        if (!isTableExist) {
            FMDatabase *db = [FMDatabase databaseWithPath:fileName];
            if ([db open]) {
                // 创建表
                BOOL result = [db executeUpdate:@"CREATE TABLE 't_down_course' ('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'courseId' INTERGER, 'downPath' VARCHAR(255),'courseInfo' text)"];
                if (result) {
                    NSLog(@"创建表成功");
                    isTableExist = YES;
                    
                    [self showAlertWithMessage:@"创建表成功" completion:nil];
                } else {
                    [self showAlertWithMessage:@"创建表失败" completion:nil];
                }
                [db close];
            } else {
                [self showAlertWithMessage:@"打开数据库失败" completion:nil];
            }
        }
    } else if (sender.tag == 1) {
        FMDatabase *db = [FMDatabase databaseWithPath:fileName];
        
        NSDictionary *dic = @{
                              @"code": @0,
                              @"msg": @"success",
                              @"data": @{
                                      @"course": @{
                                              @"id": @24,
                                              @"crowdId": @4,
                                              @"ccode": @"KIa8nNpVmc",
                                              @"cname": @"健健康康",
                                              @"coverImg": @"http://ocd2lp9uj.bkt.clouddn.com/FaceQ1445612150222.jpg",
                                              @"description": @"淋漓尽致",
                                              @"speaker": @2,
                                              @"speakerName": @"刘欣成",
                                              @"speakerHeadIcon": @"http://ocd2lp9uj.bkt.clouddn.com/FaceQ1445612150222.jpg",
                                              @"startTime": @"2016-10-15 11:21:44",
                                              @"endTime": @"2016-10-15 11:26:50",
                                              @"liveStatus": @"2",
                                              @"saveStatus": @"2",
                                              @"handouts": @[@{
                                                                 @"id": @22,
                                                                 @"convertFlag": @"1",
                                                                 @"createAt": @"2016-09-28 18:21:56",
                                                                 @"updateAt": @"2016-11-23 12:31:32",
                                                                 @"indexurl": @"http://ocd2lp9uj.bkt.clouddn.com/FuCjC3mjt3QrYs7V3lzvicf7zg0B",
                                                                 @"key": @"a.ppt",
                                                                 @"bucket": @"file",
                                                                 @"name": @"a.ppt",
                                                                 @"mimetype": @"application/vnd.ms-powerpoint",
                                                                 @"url": @"http://ocd2lp9uj.bkt.clouddn.com/a.ppt"
                                                                 }, @{
                                                                 @"id": @46,
                                                                 @"convertFlag": @"1",
                                                                 @"createAt": @"2016-09-28 18:21:56",
                                                                 @"updateAt": @"2016-11-23 12:31:32",
                                                                 @"indexurl": @"http://ocd2lp9uj.bkt.clouddn.com/FuCjC3mjt3QrYs7V3lzvicf7zg0B",
                                                                 @"key": @"a.ppt",
                                                                 @"bucket": @"file",
                                                                 @"name": @"a.ppt",
                                                                 @"mimetype": @"application/vnd.ms-powerpoint",
                                                                 @"url": @"http://ocd2lp9uj.bkt.clouddn.com/a.ppt"
                                                                 }],
                                              @"pics": @[@"http://ocd2lp9uj.bkt.clouddn.com/FpEo7Td-6SmlRxgS1jfRFsstevjc", @"http://ocd2lp9uj.bkt.clouddn.com/FgfMK50FohHcGx4957rOlyz7hDJq", @"http://ocd2lp9uj.bkt.clouddn.com/Fuz7pFQlLuNoxgkCurVMgxRsW3ej", @"http://ocd2lp9uj.bkt.clouddn.com/Fst2-1uX7dh6p4WLdx80Xea8dqLl", @"http://ocd2lp9uj.bkt.clouddn.com/FsEbY5Z-92eZZZJLbKWXkqbjgEuR", @"http://ocd2lp9uj.bkt.clouddn.com/Fj8XHzgdKeAcl5aFcfxJ_wTknM57", @"http://ocd2lp9uj.bkt.clouddn.com/FuCjC3mjt3QrYs7V3lzvicf7zg0B", @"http://ocd2lp9uj.bkt.clouddn.com/FmufT0gIAcUgaDcbO9bSgftrN7q7", @"http://ocd2lp9uj.bkt.clouddn.com/FhFk0-ErPNILDQbaqGG-g-mU8Psy", @"http://ocd2lp9uj.bkt.clouddn.com/FtfpM4g8rd9-Jc-38M1QOlwH4elP", @"http://ocd2lp9uj.bkt.clouddn.com/Fuw2ikIrdc63_E2beeAw0TDqA8Pu", @"http://ocd2lp9uj.bkt.clouddn.com/FheS4Ob_Ve9aVzQwY6p_v195i_mA", @"http://ocd2lp9uj.bkt.clouddn.com/FlZTrqXti3QOw1uKUogcroBjEdQW", @"http://ocd2lp9uj.bkt.clouddn.com/FqQLN3CpgoaTQOMSGvi4DC_pVy7h", @"http://ocd2lp9uj.bkt.clouddn.com/Fn-TCwZCOPJCNv0dH3SmKwjEE9cO"],
                                              @"playUrl": @{
                                                      @"saveUrl": @"http://oeaqm5upd.bkt.clouddn.com/KIa8nNpVmc"
                                                      },
                                              @"skipPics": @{
                                                      @"00:00:03": @"http://ocd2lp9uj.bkt.clouddn.com/FpEo7Td-6SmlRxgS1jfRFsstevjc",
                                                      @"00:00:04": @"http://ocd2lp9uj.bkt.clouddn.com/FgfMK50FohHcGx4957rOlyz7hDJq",
                                                      @"00:00:05": @"http://ocd2lp9uj.bkt.clouddn.com/Fuz7pFQlLuNoxgkCurVMgxRsW3ej",
                                                      @"00:00:06": @"http://ocd2lp9uj.bkt.clouddn.com/Fst2-1uX7dh6p4WLdx80Xea8dqLl",
                                                      @"00:00:07": @"http://ocd2lp9uj.bkt.clouddn.com/FsEbY5Z-92eZZZJLbKWXkqbjgEuR",
                                                      @"00:00:08": @"http://ocd2lp9uj.bkt.clouddn.com/FpEo7Td-6SmlRxgS1jfRFsstevjc",
                                                      @"00:00:09": @"http://ocd2lp9uj.bkt.clouddn.com/Fj8XHzgdKeAcl5aFcfxJ_wTknM57",
                                                      @"00:00:10": @"http://ocd2lp9uj.bkt.clouddn.com/Fuz7pFQlLuNoxgkCurVMgxRsW3ej",
                                                      @"00:00:11": @"http://ocd2lp9uj.bkt.clouddn.com/FsEbY5Z-92eZZZJLbKWXkqbjgEuR",
                                                      @"00:00:13": @"http://ocd2lp9uj.bkt.clouddn.com/FsEbY5Z-92eZZZJLbKWXkqbjgEuR",
                                                      @"00:00:14": @"http://ocd2lp9uj.bkt.clouddn.com/Fuz7pFQlLuNoxgkCurVMgxRsW3ej",
                                                      @"00:00:15": @"http://ocd2lp9uj.bkt.clouddn.com/FpEo7Td-6SmlRxgS1jfRFsstevjc"
                                                      }
                                              }
                                      }
                              };
        NSString *json = [self dictionaryToJson:dic];
        
        if ([db open]) {
            NSString *insertSql = @"insert into 't_down_course'(courseId,downpath,courseInfo) values(?,?,?)";
            BOOL result = [db executeUpdate:insertSql,[NSString stringWithFormat:@"%d",count],fileName,json];
            if (result) {
                [self showAlertWithMessage:@"添加数据成功" completion:nil];
            } else {
                [self showAlertWithMessage:@"添加数据失败" completion:nil];
            }
            count ++;
            [db close];
        } else {
            [self showAlertWithMessage:@"打开数据库失败" completion:nil];
        }
    } else if (sender.tag == 2) {
        FMDatabase *db = [FMDatabase databaseWithPath:fileName];
        if ([db open]) {
            NSString *selectSql = @"select * from t_down_course";
            FMResultSet *rs = [db executeQuery:selectSql];
            while ([rs next]) {
                int course = [rs intForColumn:@"id"];
                NSString *courseId = [rs stringForColumn:@"courseId"];
                NSString *downPath = [rs stringForColumn:@"downPath"];
                NSString *courseInfo = [rs stringForColumn:@"courseInfo"];
                
                NSLog(@"course id = %d, courseId = %@, downPath = %@, courseInfo = %@",course,courseId,downPath,courseInfo);
                NSMutableDictionary *dic = [self dictionaryWithJsonString:courseInfo];
                NSLog(@"%@",dic);
            }
            [db close];
        } else {
            [self showAlertWithMessage:@"打开数据库失败" completion:nil];
        }
    } else if (sender.tag == 3) {
        FMDatabase *db = [FMDatabase databaseWithPath:fileName];
        if ([db open]) {
            BOOL result = [db executeUpdate:@"update t_down_course set downPath = '更新的数据' where id = 3"];
            if (result) {
                [self showAlertWithMessage:@"更新数据成功" completion:nil];
            } else {
                [self showAlertWithMessage:@"更新数据失败" completion:nil];
            }
            [db close];
        } else {
            [self showAlertWithMessage:@"打开数据库失败" completion:nil];
        }
    } else if (sender.tag == 4) {
        FMDatabase *db = [FMDatabase databaseWithPath:fileName];
        if ([db open]) {
            BOOL result = [db executeUpdate:@"delete from t_down_course where id = 2"];
            if (result) {
                [self showAlertWithMessage:@"删除数据成功" completion:nil];
            } else {
                [self showAlertWithMessage:@"删除数据失败" completion:nil];
            }
            [db close];
        } else {
            [self showAlertWithMessage:@"打开数据库失败" completion:nil];
        }
    } else if (sender.tag == 5) {
        FMDatabase *db = [FMDatabase databaseWithPath:fileName];
        if ([db open]) {
            BOOL result = [db executeUpdate:@"drop table t_down_course"];
            if (result) {
                isTableExist = NO;
                [self showAlertWithMessage:@"删除表成功" completion:nil];
            } else {
                [self showAlertWithMessage:@"删除表失败" completion:nil];
            }
        } else {
            [self showAlertWithMessage:@"打开数据库失败" completion:nil];
        }
    }
}
- (void)showAlertWithMessage:(NSString *)message completion:(void (^)(void))completion
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [controller addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (completion) {
            completion();
        }
    }]];
    [self presentViewController:controller animated:YES completion:nil];
}
/* 字典转JSON字符串 */
-(NSString*)dictionaryToJson:(NSDictionary *)dic{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

/* 字符串转字典 */
-(NSMutableDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                               options:NSJSONReadingMutableContainers
                                                                 error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
