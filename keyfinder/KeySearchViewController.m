//
//  KeySearchViewController.m
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import "KeySearchViewController.h"
#import "SettingViewController.h"

@interface KeySearchViewController ()

@end

@implementation KeySearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _txtLockAddress.text = @"Enter Lock's address here.";
    _txtLockAddress.textColor = [UIColor lightGrayColor];
    _txtLockAddress.delegate = self;
    
    _btnFindLock.layer.cornerRadius = 6;
    _btnSearch.layer.cornerRadius = 6;
    _btnMapSearch.layer.cornerRadius = 6;
    _txtLockAddress.layer.cornerRadius = 1;
    
    _btnFindLock.layer.borderColor = [UIColor colorWithRed:55.0/256 green:36.0/256 blue:24.0/256 alpha:1.0].CGColor;
    _btnMapSearch.layer.borderColor = [UIColor colorWithRed:55.0/256 green:36.0/256 blue:24.0/256 alpha:1.0].CGColor;
    _btnFindLock.layer.borderWidth = 0.5f;
    _btnMapSearch.layer.borderWidth = 0.5f;
    _txtLockAddress.layer.borderWidth = 0.5f;
    
    _txtLockAddress.layer.borderColor = [UIColor colorWithRed:197.0/256 green:197.0/256 blue:197.0/256 alpha:1.0].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)didClickBarButtonBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)didClickBarButtonSetting:(id)sender{
    SettingViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"vcSetting"];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

-(IBAction)didClickButtonFindKey:(id)sender{
    [self performSegueWithIdentifier:@"segueLockLibrary"
                              sender:Nil];

}

-(IBAction)didClickButtonSearch:(id)sender{
    [self performSegueWithIdentifier:@"segueDirectLock"
                              sender:Nil];
    
}

-(IBAction)didClickButtonMap:(id)sender{
    [self performSegueWithIdentifier:@"segueKeyMap"
                              sender:Nil];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    if (textField.returnKeyType == UIReturnKeyDefault)
//        [textField resignFirstResponder];
//    return (textField.returnKeyType == UIReturnKeyDefault);
//}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    _txtLockAddress.text = @"";
    _txtLockAddress.textColor = [UIColor blackColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(_txtLockAddress.text.length == 0){
        _txtLockAddress.textColor = [UIColor lightGrayColor];
        _txtLockAddress.text = @"Enter Lock's address here.";
        [_txtLockAddress resignFirstResponder];
    }
}

@end
