//
//  LockSerialSearchViewController.m
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import "LockSerialSearchViewController.h"
#import "DaiDodgeKeyboard.h"
#import "SettingViewController.h"

@interface LockSerialSearchViewController ()

@end

@implementation LockSerialSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIToolbar *toolBar = [self createToolbar];
    for (UIView *v in self.view.subviews) {
        if ([v respondsToSelector:@selector(setText:)]) {
            //if ([v isKindOfClass:[UITextView class]]) {
            [v performSelector:@selector(setDelegate:) withObject:self];
            [v performSelector:@selector(setInputAccessoryView:) withObject:toolBar];
        }
    }
    
    if ([_txtSerial respondsToSelector:@selector(setText:)]) {
        //if ([v isKindOfClass:[UITextView class]]) {
        [_txtSerial performSelector:@selector(setDelegate:) withObject:self];
        [_txtSerial performSelector:@selector(setInputAccessoryView:) withObject:toolBar];
    }
    
//    [DaiDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:_viewKeyboard];

    _lblPassword.layer.cornerRadius = 6;
    _lblPassword.layer.borderWidth = 1;
    _lblPassword.layer.borderColor = [UIColor colorWithRed:200.0/256 green:200.0/256 blue:200.0/256 alpha:1.0].CGColor;

    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
    /* Listen for keyboard */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    [_txtSerial performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

-(IBAction)didClickBarButtonBack:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
}

-(IBAction)didClickBarButtonSetting:(id)sender{
    SettingViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"vcSetting"];
    
    [self.navigationController pushViewController:viewController animated:NO];
    
}

- (UIToolbar *)createToolbar
{
    UIToolbar *toolBar = [UIToolbar new];
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    UIBarButtonItem *space1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    UIBarButtonItem *prevButton = [[UIBarButtonItem alloc] initWithTitle:@"Skip" style:UIBarButtonItemStylePlain target:self action:@selector(goSkip)];
    UIBarButtonItem *space2= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(goDone)];
    toolBar.items = @[nextButton, space1, prevButton, space2, done];
    [toolBar sizeToFit];
    return toolBar;
}

- (void)goBack
{
    	[_txtSerial resignFirstResponder];
    [self.navigationController popViewControllerAnimated:NO];
    
}

- (void)goSkip
{
    [_txtSerial resignFirstResponder];
    [self performSegueWithIdentifier:@"segueLockSearch"
                              sender:Nil];
}

- (void)goDone
{
   	[_txtSerial resignFirstResponder];
    [self performSegueWithIdentifier:@"segueDirectKey"
                              sender:Nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITextFieldDelegate


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
