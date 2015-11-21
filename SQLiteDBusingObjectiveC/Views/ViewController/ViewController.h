//
//  ViewController.h
//  SQLiteDBusingObjectiveC
//
//  Created by Hardik Trivedi on 21/11/2015.
//  Copyright © 2015 TheiHartBit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSMutableArray *marrRegisterData;
}

@property (weak, nonatomic) IBOutlet UITableView *tblRegister;

@end

