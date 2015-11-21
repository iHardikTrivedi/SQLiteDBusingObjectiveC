//
//  RegisterTableViewCell.h
//  SQLiteDBusingObjectiveC
//
//  Created by Hardik Trivedi on 21/11/2015.
//  Copyright © 2015 TheiHartBit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblContact;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;

@end
