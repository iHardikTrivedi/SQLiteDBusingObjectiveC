//
//  Utility.m
//  SQLiteDBusingObjectiveC
//
//  Created by Hardik Trivedi on 21/11/2015.
//  Copyright © 2015 TheiHartBit. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (NSString *)getFilePathForDB:(NSString *)strFileName
{
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:strFileName];
}


+ (void)copyFileFromProjectToDevice:(NSString *)strFileName
{
    NSString *strDBPath = [self getFilePathForDB:strFileName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:strDBPath]) {
        NSString *strFromPath = [[NSBundle mainBundle] pathForResource:@"iHartDB" ofType:@"sqlite"];
        [fileManager copyItemAtPath:strFromPath toPath:strDBPath error:nil];
        NSLog(@"Your SQLite DB copy successfully on Your Device.");
    } else {
        NSLog(@"DB is already on Your Device.");
    }
}

@end
