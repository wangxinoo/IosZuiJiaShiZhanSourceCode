//
//  CoreDataDemoViewController.m
//  CoreDataDemo
//
//  Created by msdcn on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CoreDataDemoViewController.h"
#import <CoreData/CoreData.h>

@interface CoreDataDemoViewController ()
@property(strong, nonatomic) UIManagedDocument *document;
@end

@implementation CoreDataDemoViewController
@synthesize document;

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*[[NSNotificationCenter defaultCenter] addObserver:self 
                                            selector:@selector(handleChange:) 
                                            name: NSManagedObjectContextObjectsDidChangeNotification 
                                            object:self.document.managedObjectContext];*/
	// Do any additional setup after loading the view, typically from a nib.
    /*NSFileManager *manager = [NSFileManager defaultManager];
    NSURL *documentsDirectory = [[manager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
    NSURL *filePath = [[NSURL alloc] initWithString:@"coreData.dat" relativeToURL:documentsDirectory];
    NSLog(@"%@", filePath);*/
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"coreData.dat"];
    NSURL *filePath = [NSURL fileURLWithPath:path];
    NSLog(@"%@", filePath);
    document = [[UIManagedDocument alloc] initWithFileURL:filePath];
    NSFileManager *manager = [NSFileManager defaultManager];
    if([manager fileExistsAtPath:path])
    {
        [document openWithCompletionHandler:^(BOOL success)
         {
            if(success)
            {
                [self documentIsReady];
            }
            else 
            {
                NSLog(@"打开文档%@失败", filePath);
            }
         }];
    }
    else 
    {
        [document saveToURL:filePath forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success)
         {
             if(success)
             {
                 [self documentIsReady];
             }
             else 
             {
                 NSLog(@"创建文档%@失败", filePath);
             }
         }];

    }
    
    // NSLog(@"%@", documentDirectory);
}

-(void)documentIsReady
{
    //NSLog(@"文档准备好了！");
    if(self.document.documentState == UIDocumentStateNormal)
    {
        NSManagedObjectContext *context = self.document.managedObjectContext;
        /*NSManagedObject *newMenPai1 = [NSEntityDescription insertNewObjectForEntityForName:@"MenPai" inManagedObjectContext:context];
        [newMenPai1 setValue:@"魔教" forKey:@"name"];
        [newMenPai1 setValue:@"光明顶" forKey:@"address"];
        
        NSManagedObject *newXiaKe1 = [NSEntityDescription insertNewObjectForEntityForName:@"XiaKe" inManagedObjectContext:context];
        
        
        [newXiaKe1 setValue:@"杨逍" forKey:@"name"];
        [newXiaKe1 setValue:[NSNumber numberWithInt:29] forKey:@"age"];
        [newXiaKe1 setValue:newMenPai1 forKey:@"menPai"];*/
        
        //NSLog(@"数据插入成功！");
        /*NSManagedObject *newXiaKe2 = [NSEntityDescription insertNewObjectForEntityForName:@"XiaKe" inManagedObjectContext:context];
        
        
        [newXiaKe2 setValue:@"张三丰" forKey:@"name"];
        [newXiaKe2 setValue:[NSNumber numberWithInt:109] forKey:@"age"];*/
        
        //查询数据
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"XiaKe"];
        request.fetchBatchSize = 20;
        request.fetchLimit = 100;
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains %@", @"杨逍"];
        request.predicate = predicate;
        
        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES];
        request.sortDescriptors = [NSArray arrayWithObject:descriptor];
        //NSSortDescriptor *d = [NSSortDescriptor sortDescriptorWithKey:<#(NSString *)#> ascending:<#(BOOL)#> selector:<#(SEL)#>
        //NSManagedObjectContext *context = self.document.managedObjectContext;
        NSError *error;
        NSArray *xiaKes = [context executeFetchRequest:request error:&error];
        //[context deleteObject:<#(NSManagedObject *)#>
        for(NSManagedObject *xiaKe in xiaKes)
        {
            [context deleteObject:xiaKe];
            [context save:&error];
            NSLog(@"%@", [xiaKe valueForKey:@"name"]);
            //NSLog(@"%@", [[xiaKe menPai] name]);
            //NSLog(@"%@", [[xiaKe valueForKey:@"menPai"] valueForKey:@"name"]);
        }
        
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
