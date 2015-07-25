//
//  CreateViewController.h
//  keyfinder
//
//  Created by System Administrator on 7/19/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateViewController : UIViewController

-(IBAction)didClickBarButtonBack:(id)sender;
-(IBAction)didClickBarButtonSetting:(id)sender;
-(IBAction)didClickButtonSave:(id)sender;
-(IBAction)didClickButtonCancel:(id)sender;

-(IBAction)didClickButtonMap:(id)sender;
-(IBAction)didClickButtonCamera:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btnTakePicture;
@property (strong, nonatomic) IBOutlet UIButton *btnWriteNote;
@property (strong, nonatomic) IBOutlet UIButton *btnViewMap;
@property (strong, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) IBOutlet UIButton *btnCancel;

@end
