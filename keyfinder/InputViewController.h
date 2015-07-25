//
//  InputViewController.h
//  keyfinder
//
//  Created by System Administrator on 7/19/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComboBox.h"

@interface InputViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scroll1;

-(IBAction)didClickBarButtonBack:(id)sender;
-(IBAction)didClickBarButtonSetting:(id)sender;
-(IBAction)didClickBarButtonHome:(id)sender;

-(IBAction)didClickButtonSave:(id)sender;
-(IBAction)didClickButtonMap:(id)sender;

-(IBAction)didClickButtonCamera:(id)sender;

    @property (strong, nonatomic) IBOutlet UIImageView *imgKey;

    @property (strong, nonatomic) IBOutlet UIView *viewComboColor;
    @property (strong, nonatomic) IBOutlet UIView *viewComboLength;
    @property (strong, nonatomic) IBOutlet UIView *viewComboHeader;
    @property (strong, nonatomic) IBOutlet UIView *viewComboUse;

    @property (strong, nonatomic) IBOutlet UIButton *btnSave;
    @property (strong, nonatomic) IBOutlet UIButton *btnMap;
    @property (strong, nonatomic) IBOutlet UITextView *txtNote;
    @property (strong, nonatomic) IBOutlet UITextField *txtSerial;

    @property (nonatomic, strong) NSArray *arrColor;
    @property (nonatomic, strong) NSArray *arrLength;
    @property (nonatomic, strong) NSArray *arrHeader;
    @property (nonatomic, strong) NSArray *arrUse;

@end
