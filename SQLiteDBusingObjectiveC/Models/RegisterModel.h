//
//  RegisterModel.h
//  SQLiteDBusingObjectiveC
//
//  Created by Hardik Trivedi on 21/11/2015.
//  Copyright © 2015 TheiHartBit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterModel : NSObject

@property (nonatomic) NSInteger RegisterID;
@property (nonatomic, strong) NSString* Name;
@property (nonatomic, strong) NSString* ContactNo;
@property (nonatomic, strong) NSString* Email;

@end
