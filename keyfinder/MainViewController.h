//
//  MainViewController.h
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComboBox.h"

@interface MainViewController : UIViewController <ComBoxDelegate>

-(IBAction)didClickBarButtonBack:(id)sender;
-(IBAction)didClickBarButtonHome:(id)sender;

-(IBAction)didClickButtonFindLock:(id)sender;
-(IBAction)didClickButtonInput:(id)sender;

    @property (strong, nonatomic) IBOutlet UIView *viewCombo;
    @property (strong, nonatomic) IBOutlet UIButton *btnFindLock;
    @property (strong, nonatomic) IBOutlet UIView *btnInput;


    @property (nonatomic, strong) NSArray *dataObjects;

@end
