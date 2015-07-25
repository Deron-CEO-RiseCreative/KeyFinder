//
//  LockViewController.h
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LockViewController : UIViewController <UITextViewDelegate>

-(IBAction)didClickBarButtonBack:(id)sender;
-(IBAction)didClickBarButtonSetting:(id)sender;

-(IBAction)didClickBarButtonHome:(id)sender;


-(IBAction)didClickButtonLockMap:(id)sender;
-(IBAction)didClickButtonViewKey:(id)sender;

    @property (strong, nonatomic) IBOutlet UIButton *btnViewKey;
    @property (strong, nonatomic) IBOutlet UIButton *btnViewMap;
    @property (strong, nonatomic) IBOutlet UITextView *txtKeySerial;
    @property (strong, nonatomic) IBOutlet UIImageView *imgLock;

@property (nonatomic) BOOL bFromLock;

@end
