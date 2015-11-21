//
//  RegisterModelManager.m
//  SQLiteDBusingObjectiveC
//
//  Created by Hardik Trivedi on 21/11/2015.
//  Copyright © 2015 TheiHartBit. All rights reserved.
//

#import "RegisterModelManager.h"
#import "FMDatabase.h"
#import "Utility.h"

static RegisterModelManager *sharedInstance = nil;

@implementation RegisterModelManager

+ (RegisterModelManager *)getDBInstance
{
    if (sharedInstance.objFMDatabase == nil) {
        sharedInstance = [[RegisterModelManager alloc] init];
        sharedInstance.objFMDatabase = [FMDatabase databaseWithPath:[Utility getFilePathForDB:@"iHartDB.sqlite"]];
    }
    
    return sharedInstance;
}

- (BOOL)addRegisterData:(RegisterModel *)objRegisterModel
{
    [sharedInstance.objFMDatabase open];
    
    BOOL isDataInserted = [sharedInstance.objFMDatabase executeUpdate:@"INSERT INTO tblRegister (Name, ContactNo, Email) VALUES (?, ?, ?)", objRegisterModel.Name, objRegisterModel.ContactNo, objRegisterModel.Email];
    
    [sharedInstance.objFMDatabase close];
    
    return isDataInserted;
}

- (BOOL)updateRegisterData:(RegisterModel *)objRegisterModel
{
    [sharedInstance.objFMDatabase open];
    
    BOOL isDataUpdated = [sharedInstance.objFMDatabase executeUpdate:@"UPDATE tblRegister SET Name = ?, ContactNo = ?, Email = ? WHERE RegisterID = ?", objRegisterModel.Name, objRegisterModel.ContactNo, objRegisterModel.Email, [NSString stringWithFormat:@"%ld", (long)objRegisterModel.RegisterID]];
    
    [sharedInstance.objFMDatabase close];
    
    return isDataUpdated;
}

- (BOOL)deleteRegisterData:(RegisterModel *)objRegisterModel
{
    [sharedInstance.objFMDatabase open];
    
    BOOL isDataDeleted = [sharedInstance.objFMDatabase executeUpdate:@"DELETE FROM tblRegister WHERE RegisterID = ?", [NSString stringWithFormat:@"%ld", (long)objRegisterModel.RegisterID]];
    
    [sharedInstance.objFMDatabase close];
    
    return isDataDeleted;
}

- (RegisterModel *)getRegisterDataByRegisterID:(NSInteger)registerID
{
    [sharedInstance.objFMDatabase open];
    
    FMResultSet *resultSet = [sharedInstance.objFMDatabase executeQuery:@"SELECT * FROM tblRegister WHERE RegisterID = ?", [NSString stringWithFormat:@"%ld", (long)registerID]];
    RegisterModel *objRegisterModel = [[RegisterModel alloc] init];
    
    if (resultSet != nil) {
        while ([resultSet next]) {
            
            [objRegisterModel setRegisterID:[[resultSet stringForColumn:@"RegisterID"] integerValue]];
            [objRegisterModel setName:[resultSet stringForColumn:@"Name"]];
            [objRegisterModel setContactNo:[resultSet stringForColumn:@"ContactNo"]];
            [objRegisterModel setEmail:[resultSet stringForColumn:@"Email"]];
        }
    }
    
    [sharedInstance.objFMDatabase close];
    
    return objRegisterModel;
}

- (NSMutableArray *)getRegisterData
{
    [sharedInstance.objFMDatabase open];
    
    FMResultSet *resultSet = [sharedInstance.objFMDatabase executeQuery:@"SELECT * FROM tblRegister"];
    NSMutableArray *marrRegister = [[NSMutableArray alloc] init];
    
    if (resultSet != nil) {
        while ([resultSet next]) {
            RegisterModel *objRegisterModel = [[RegisterModel alloc] init];
            
            [objRegisterModel setRegisterID:[[resultSet stringForColumn:@"RegisterID"] integerValue]];
            [objRegisterModel setName:[resultSet stringForColumn:@"Name"]];
            [objRegisterModel setContactNo:[resultSet stringForColumn:@"ContactNo"]];
            [objRegisterModel setEmail:[resultSet stringForColumn:@"Email"]];
            
            [marrRegister addObject:objRegisterModel];
        }
    }
    
    [sharedInstance.objFMDatabase close];
    
    return marrRegister;
}

@end
