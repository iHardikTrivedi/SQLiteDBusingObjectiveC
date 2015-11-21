//
//  RegisterAddEditViewController.h
//  SQLiteDBusingObjectiveC
//
//  Created by Hardik Trivedi on 21/11/2015.
//  Copyright © 2015 TheiHartBit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterAddEditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtContact;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;

@property (nonatomic) NSInteger registerID;
@property (nonatomic, strong) NSString *openViewMode;

@end
