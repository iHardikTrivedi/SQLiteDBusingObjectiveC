//
//  RegisterModelManager.h
//  SQLiteDBusingObjectiveC
//
//  Created by Hardik Trivedi on 21/11/2015.
//  Copyright © 2015 TheiHartBit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "RegisterModel.h"

@interface RegisterModelManager : NSObject

@property (nonatomic,strong) FMDatabase *objFMDatabase;

+ (RegisterModelManager *)getDBInstance;
- (BOOL)addRegisterData:(RegisterModel *)objRegisterModel;
- (BOOL)updateRegisterData:(RegisterModel *)objRegisterModel;
- (BOOL)deleteRegisterData:(RegisterModel *)objRegisterModel;
- (RegisterModel *)getRegisterDataByRegisterID:(NSInteger)registerID;
- (NSMutableArray *)getRegisterData;

@end
