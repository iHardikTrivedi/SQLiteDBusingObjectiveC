//
//  RegisterAddEditViewController.m
//  SQLiteDBusingObjectiveC
//
//  Created by Hardik Trivedi on 21/11/2015.
//  Copyright © 2015 TheiHartBit. All rights reserved.
//

#import "RegisterAddEditViewController.h"
#import "RegisterModel.h"
#import "RegisterModelManager.h"

@interface RegisterAddEditViewController () <UITextFieldDelegate>

@end

@implementation RegisterAddEditViewController

#pragma mark - ViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.lblTitle setText:[NSString stringWithFormat:@"%@ Register", self.openViewMode]];
    
    if (self.registerID == -1) {
        [self.btnSave setTitle:@"Save" forState:UIControlStateNormal];
    } else {
        [self.btnSave setTitle:@"Update" forState:UIControlStateNormal];
        [self loadDataFromRegisterID];
    }
}

#pragma mark - UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - IBAction Methods

- (IBAction)btnBackClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnSaveClicked:(id)sender
{
    if ([self.txtName.text isEqualToString:@""] || [self.txtContact.text isEqualToString:@""] || [self.txtEmail.text isEqualToString:@""]) {
        
        [self displayAlertView:@"Fill all Data" withMessage:@"Please fill all three (Name, Email, Contact) data."];
        return;
    } else {
        RegisterModel *objRegisterModel = [[RegisterModel alloc] init];
        
        objRegisterModel.RegisterID = self.registerID;
        objRegisterModel.Name = self.txtName.text;
        objRegisterModel.ContactNo = self.txtContact.text;
        objRegisterModel.Email = self.txtEmail.text;
        
        if (self.registerID == -1) {
          
            if ([[RegisterModelManager getDBInstance] addRegisterData:objRegisterModel]) {
                [self displayAlertView:@"Add Successfully" withMessage:@"Your Data saved Successfully."];
            }
        } else {
            
            if ([[RegisterModelManager getDBInstance] updateRegisterData:objRegisterModel]) {
                [self displayAlertView:@"Update Successfully" withMessage:@"Your Data updated Successfully."];
            }
        }
    }
}

#pragma mark - Other Methods

- (void)loadDataFromRegisterID
{
    RegisterModel *objRegisterModel = [[RegisterModelManager getDBInstance] getRegisterDataByRegisterID:self.registerID];
    
    if (objRegisterModel != nil) {
        self.registerID = objRegisterModel.RegisterID;
        [self.txtName setText:objRegisterModel.Name];
        [self.txtContact setText:objRegisterModel.ContactNo];
        [self.txtEmail setText:objRegisterModel.Email];
    }
}

- (void)displayAlertView:(NSString *)strTitle withMessage:(NSString *)strMessage
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:strTitle message:strMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
