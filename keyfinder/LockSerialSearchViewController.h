//
//  LockSerialSearchViewController.h
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LockSerialSearchViewController : UIViewController <UITextFieldDelegate>



-(IBAction)didClickBarButtonBack:(id)sender;
-(IBAction)didClickBarButtonSetting:(id)sender;

    @property (strong, nonatomic) IBOutlet UIView *viewKeyboard;
    @property (strong, nonatomic) IBOutlet UITextField *txtSerial;
    @property (strong, nonatomic) IBOutlet UILabel *lblPassword;

@end
