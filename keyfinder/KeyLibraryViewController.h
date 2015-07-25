//
//  KeyLibraryViewController.h
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyLockDatabase.h"

@interface KeyLibraryViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

-(IBAction)didClickBarButtonBack:(id)sender;
-(IBAction)didClickBarButtonSetting:(id)sender;
-(IBAction)didClickBarButtonHome:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *tblLocks;
@property (nonatomic, strong) NSArray *mLocks;

@end
