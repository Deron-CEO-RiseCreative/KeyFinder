//
//  SettingViewController.h
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController

-(IBAction)didClickBarButtonBack:(id)sender;

@property (strong, nonatomic) IBOutlet UISwitch *swNotification;
@property (strong, nonatomic) IBOutlet UISwitch *swGPS;
@property (strong, nonatomic) IBOutlet UISwitch *swFacebook;
@property (strong, nonatomic) IBOutlet UISwitch *swAutoUpdate;
@property (strong, nonatomic) IBOutlet UISwitch *swPassword;

@property (strong, nonatomic) IBOutlet UISlider *sliderVoice;

@property (strong, nonatomic) IBOutlet UIButton *btnAssign;
@property (strong, nonatomic) IBOutlet UIButton *btnHelp;
@property (strong, nonatomic) IBOutlet UIButton *btnTerms;
@property (strong, nonatomic) IBOutlet UIButton *btnPrivacy;
@property (strong, nonatomic) IBOutlet UIButton *btnAbout;

@end
