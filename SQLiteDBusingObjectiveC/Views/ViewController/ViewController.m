//
//  ViewController.m
//  SQLiteDBusingObjectiveC
//
//  Created by Hardik Trivedi on 21/11/2015.
//  Copyright © 2015 TheiHartBit. All rights reserved.
//

#import "ViewController.h"
#import "RegisterTableViewCell.h"
#import "RegisterModel.h"
#import "RegisterModelManager.h"
#import "RegisterAddEditViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

#pragma mark - ViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    marrRegisterData = [[NSMutableArray alloc] init];
    [self fetchRegisterDataFromDB];
}

#pragma mark - UITableViewDelegate & DataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [marrRegisterData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RegisterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RegisterCell" forIndexPath:indexPath];
    RegisterModel *objRegisterModel = [marrRegisterData objectAtIndex:indexPath.row];
    
    [cell.lblName setText:objRegisterModel.Name];
    [cell.lblContact setText:[NSString stringWithFormat:@"Contact : %@", objRegisterModel.ContactNo]];
    [cell.lblEmail setText:[NSString stringWithFormat:@"Email : %@", objRegisterModel.Email]];
    [cell setAccessibilityHint:[NSString stringWithFormat:@"%ld", (long)objRegisterModel.RegisterID]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RegisterModel *objRegisterModel = [marrRegisterData objectAtIndex:indexPath.row];
    [self openAddEditViewScreen:@"Edit" WithRecordID:objRegisterModel.RegisterID];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        RegisterModel *objRegisterModel = [marrRegisterData objectAtIndex:indexPath.row];
        
        if ([[RegisterModelManager getDBInstance] deleteRegisterData:objRegisterModel]) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Delete Successfully" message:@"Your Data deleted Successfully." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [alertController dismissViewControllerAnimated:YES completion:nil];
            }];
            
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:nil];
            
            [self fetchRegisterDataFromDB];
        }
    }
}

#pragma mark - IBAction Methods

- (IBAction)btnAddClicked:(id)sender
{
    [self openAddEditViewScreen:@"Add" WithRecordID:-1];
}

#pragma mark - Other Methods

- (void)fetchRegisterDataFromDB
{
    marrRegisterData = [[RegisterModelManager getDBInstance] getRegisterData];
    [self.tblRegister reloadData];
}

- (void)openAddEditViewScreen:(NSString *)screenType WithRecordID:(NSInteger)recordID
{
    RegisterAddEditViewController *objRegisterAddEditViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterAddEditViewController"];
    [objRegisterAddEditViewController setOpenViewMode:screenType];
    [objRegisterAddEditViewController setRegisterID:recordID];
    [self presentViewController:objRegisterAddEditViewController animated:YES completion:nil];
}

@end
