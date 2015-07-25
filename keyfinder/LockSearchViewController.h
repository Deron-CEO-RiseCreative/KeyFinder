//
//  LockSearchViewController.h
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComboBox.h"

@interface LockSearchViewController : UIViewController

-(IBAction)didClickBarButtonBack:(id)sender;
-(IBAction)didClickBarButtonSetting:(id)sender;

-(IBAction)didClickButtonSearch:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *viewComboColor;
@property (strong, nonatomic) IBOutlet UIView *viewComboLength;
@property (strong, nonatomic) IBOutlet UIView *viewComboHeader;
@property (strong, nonatomic) IBOutlet UIView *viewComboUse;

@property (strong, nonatomic) IBOutlet UIView *btnSearch;

@property (nonatomic, strong) NSArray *arrColor;
@property (nonatomic, strong) NSArray *arrLength;
@property (nonatomic, strong) NSArray *arrHeader;
@property (nonatomic, strong) NSArray *arrUse;

@end
