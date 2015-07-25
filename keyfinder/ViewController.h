//
//  ViewController.h
//  keyfinder
//
//  Created by System Administrator on 7/17/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

    @property (strong, nonatomic) IBOutlet UITextField *txtPassword;
    @property (strong, nonatomic) IBOutlet UILabel *lblPassword;
    @property (strong, nonatomic) IBOutlet UIView *viewKeyboard;

@end

