//
//  SQLiteDemoViewController.m
//  SQLiteDemo
//
//  Created by msdcn on 8/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SQLiteDemoViewController.h"
#import <sqlite3.h>

@interface SQLiteDemoViewController ()

@end

@implementation SQLiteDemoViewController
@synthesize dataFilePath;
@synthesize btnCreateDB;
@synthesize btnCreateTable;
@synthesize btnInsertData;
@synthesize btnQueryData;
@synthesize txtView;
@synthesize message;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    message = [NSMutableString stringWithString:@""];
    txtView.editable = NO;
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dataFilePath = [documentsDirectory stringByAppendingPathComponent:DBFileName];
    NSLog(@"%@", dataFilePath);
    NSFileManager *manager = [NSFileManager defaultManager];
    if([manager fileExistsAtPath:dataFilePath])
    {
        btnCreateDB.enabled = NO;
        [btnCreateDB.titleLabel setTextColor:[UIColor lightGrayColor]];
        [message appendString:@"数据库文件已经存在！\n禁用创建数据库按钮！\n"];
        txtView.text = message;
    }
}

- (void)viewDidUnload
{
    [self setBtnCreateDB:nil];
    [self setBtnCreateTable:nil];
    [self setBtnInsertData:nil];
    [self setBtnQueryData:nil];
    [self setTxtView:nil];
    [self setMessage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (IBAction)createDB:(id)sender {
    [message appendString:@"开始创建数据库！\n"];
    sqlite3 *database;
    int result = sqlite3_open([dataFilePath UTF8String], &database);
    if(result == SQLITE_OK)
    {
        [message appendString:@"数据库创建成功！\n"];
    }
    sqlite3_close(database);
    txtView.text = message;
}

- (IBAction)createTable:(id)sender {
    [message appendString:@"开始创建PERSON表！\n"];
    sqlite3 *database;
    char *errorMsg;
    int result1 = sqlite3_open([dataFilePath UTF8String], &database);
    if(result1 == SQLITE_OK)
    {
        
        char *createSQL = "CREATE TABLE IF NOT EXISTS PERSON (ID INTEGER PRIMARY KEY AUTOINCREMENT, FIRSTNAME TEXT, LASTNAME TEXT, AGE INTEGER);";
        int result2 = sqlite3_exec(database, createSQL, NULL, NULL, &errorMsg);
        if(result2 == SQLITE_OK)
        {
            [message appendString:@"PERSON表创建成功！\n"];
        }
        else
        {
            [message appendFormat:@"PERSON表创建失败！失败错误信息是：%s", errorMsg]; 
        }
    }
    sqlite3_close(database);
    txtView.text = message;
}

- (IBAction)insertData:(id)sender {
    [message appendString:@"开始往PERSON表插入数据！\n"];
    sqlite3 *database;
    char *errorMsg;
    int result1 = sqlite3_open([dataFilePath UTF8String], &database);
    if(result1 == SQLITE_OK)
    {
        
        char *insertSQL = "INSERT INTO PERSON(FIRSTNAME, LASTNAME, AGE) VALUES('靖', '郭', 58);";
        int result2 = sqlite3_exec(database, insertSQL, NULL, NULL, &errorMsg);
        if(result2 == SQLITE_OK)
        {
            [message appendString:@"PERSON表数据插入成功！\n"];
        }
        else
        {
            [message appendFormat:@"PERSON表数据插入失败！失败错误信息是：%s", errorMsg]; 
        }
    }
    sqlite3_close(database);
    txtView.text = message;
}

- (IBAction)queryData:(id)sender {
    [message appendString:@"开始从PERSON表查询数据！\n"];
    sqlite3 *database;
    int result1 = sqlite3_open([dataFilePath UTF8String], &database);
    if(result1 == SQLITE_OK)
    {
        
        char *selectSQL = "SELECT ID, FIRSTNAME, LASTNAME, AGE FROM PERSON WHERE FIRSTNAME = ?;";
        sqlite3_stmt *stmt;
        int result2 = sqlite3_prepare_v2(database, selectSQL, -1, &stmt, NULL);
        if(result2 == SQLITE_OK)
        {
            sqlite3_bind_text(stmt, 1, "靖", -1, NULL);
            while(sqlite3_step(stmt) == SQLITE_ROW)
            {
                int personID = sqlite3_column_int(stmt, 0);
                NSString *firstName = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(stmt, 1)];
                NSString *lastName = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(stmt, 2)];
                int age = sqlite3_column_int(stmt, 3);
                [message appendFormat:@"编号：%d；姓：%@；名：%@；年龄：%d。\n", personID, lastName, firstName, age];
            }
            sqlite3_finalize(stmt);
        }
    }    
    sqlite3_close(database);
    txtView.text = message;
}
@end
