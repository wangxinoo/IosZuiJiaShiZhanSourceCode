//
//  SQLiteDemoViewController.h
//  SQLiteDemo
//
//  Created by msdcn on 8/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DBFileName @"database.sqlite3"

@interface SQLiteDemoViewController : UIViewController
@property (nonatomic, strong) NSString *dataFilePath;
@property (weak, nonatomic) IBOutlet UIButton *btnCreateDB;
@property (weak, nonatomic) IBOutlet UIButton *btnCreateTable;
@property (weak, nonatomic) IBOutlet UIButton *btnInsertData;
@property (weak, nonatomic) IBOutlet UIButton *btnQueryData;
@property (weak, nonatomic) IBOutlet UITextView *txtView;
@property (strong, nonatomic) NSMutableString *message;
- (IBAction)createDB:(id)sender;
- (IBAction)createTable:(id)sender;
- (IBAction)insertData:(id)sender;
- (IBAction)queryData:(id)sender;

@end


