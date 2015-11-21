//
//  Utility.h
//  SQLiteDBusingObjectiveC
//
//  Created by Hardik Trivedi on 21/11/2015.
//  Copyright © 2015 TheiHartBit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (NSString *)getFilePathForDB:(NSString *)strFileName;
+ (void)copyFileFromProjectToDevice:(NSString *)strFileName;

@end
