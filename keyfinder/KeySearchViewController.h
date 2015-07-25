//
//  KeySearchViewController.h
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeySearchViewController : UIViewController <UITextViewDelegate>

-(IBAction)didClickBarButtonBack:(id)sender;
-(IBAction)didClickBarButtonSetting:(id)sender;

-(IBAction)didClickButtonFindKey:(id)sender;
-(IBAction)didClickButtonSearch:(id)sender;
-(IBAction)didClickButtonMap:(id)sender;

    @property (strong, nonatomic) IBOutlet UIButton *btnSearch;
    @property (strong, nonatomic) IBOutlet UIButton *btnFindLock;
    @property (strong, nonatomic) IBOutlet UIButton *btnMapSearch;
    @property (strong, nonatomic) IBOutlet UITextView *txtLockAddress;

@end
