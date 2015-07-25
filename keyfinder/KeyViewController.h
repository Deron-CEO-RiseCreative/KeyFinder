//
//  KeyViewController.h
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyViewController : UIViewController <UITextViewDelegate>

-(IBAction)didClickBarButtonBack:(id)sender;
-(IBAction)didClickBarButtonSetting:(id)sender;

-(IBAction)didClickBarButtonHome:(id)sender;

-(IBAction)didClickButtonKeyMap:(id)sender;
-(IBAction)didClickButtonViewLock:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btnViewLock;
@property (strong, nonatomic) IBOutlet UIButton *btnViewMap;
@property (strong, nonatomic) IBOutlet UITextView *txtKeySerial;
@property (strong, nonatomic) IBOutlet UIImageView *imgLock;

@property (nonatomic) BOOL bFromLock;

@end
