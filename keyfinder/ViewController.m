//
//  ViewController.m
//  keyfinder
//
//  Created by System Administrator on 7/17/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.hidden = YES;
    
    _lblPassword.layer.cornerRadius = 6;
    _lblPassword.layer.borderWidth = 1;
    _lblPassword.layer.borderColor = [UIColor colorWithRed:200.0/256 green:200.0/256 blue:200.0/256 alpha:1.0].CGColor;

    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    if ([password isEqualToString:@""] || password == Nil)
        [[NSUserDefaults standardUserDefaults]setValue:@"key" forKey:@"password"];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
    /* Listen for keyboard */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    

    [_txtPassword performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //[textField resignFirstResponder];
    
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    NSString *textPass = _txtPassword.text;
    
    if ([password isEqualToString:textPass])
         [self performSegueWithIdentifier:@"segueMain"
                              sender:Nil];
    
    return YES;
}

CGRect preframe;

- (void)keyboardWillShow:(NSNotification *)notification
{
    /* Move the toolbar to above the keyboard */
    NSLog(@"Keyboard was shown");
    NSDictionary* info = [notification userInfo];
   
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    //Given size may not ACCOUNT for screen rotation
    int height = MIN(keyboardSize.height,keyboardSize.width);
    int width = MAX(keyboardSize.height,keyboardSize.width);
    
    
    // Get animation info from userInfo
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    CGRect keyboardFrame;
    [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] getValue:&keyboardFrame];
    
    // Move
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    
    CGRect frame = _viewKeyboard.frame;
    preframe = _viewKeyboard.frame;
    
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        frame.origin.y = self.view.frame.size.height - frame.size.height - height;
    }
    
    _viewKeyboard.frame = frame;
    
    [UIView commitAnimations];
    
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    /* Move the toolbar to above the keyboard */
    NSLog(@"Keyboard was shown");
    NSDictionary* info = [notification userInfo];
    
    // Get animation info from userInfo
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    CGRect keyboardFrame;
    [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] getValue:&keyboardFrame];
    
    // Move
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    
    _viewKeyboard.frame = preframe;
    [UIView commitAnimations];
    
}


@end
