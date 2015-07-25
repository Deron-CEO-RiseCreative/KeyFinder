//
//  LockViewController.m
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import "LockViewController.h"
#import "SettingViewController.h"
#import "KeyViewController.h"

@interface LockViewController ()

@end

@implementation LockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _btnViewKey.layer.cornerRadius = 6;
    _btnViewMap.layer.cornerRadius = 6;
    
    _imgLock.layer.masksToBounds = YES;
    _imgLock.layer.cornerRadius = 6;
    _txtKeySerial.layer.cornerRadius = 6;
    
    _btnViewMap.layer.borderColor = [UIColor whiteColor].CGColor;

    _btnViewMap.layer.borderWidth = 0.5f;
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)didClickBarButtonBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)didClickBarButtonSetting:(id)sender{
    SettingViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"vcSetting"];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

-(IBAction)didClickBarButtonHome:(id)sender{
    UIViewController *vc = [self.navigationController.viewControllers objectAtIndex:1];
    
    [self.navigationController popToViewController:vc animated:NO];
}

-(IBAction)didClickButtonLockMap:(id)sender{
    [self performSegueWithIdentifier:@"segueLockMapView"
                              sender:Nil];
}

-(IBAction)didClickButtonViewKey:(id)sender{
    if (_bFromLock == YES)
        [self.navigationController popViewControllerAnimated:YES];
    else
        [self performSegueWithIdentifier:@"segueKeyView"
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([[segue identifier] isEqualToString:@"segueKeyView"]) {
        KeyViewController* vcKeyView = (KeyViewController*)[segue destinationViewController];

        vcKeyView.bFromLock = YES;

    }
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
    {
        [self _moveViewByY:-80];
    }
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
    {
        [self _moveViewByY:80];
    }
    return YES;
}

- (void)_moveViewByY:(CGFloat)dy {
    NSTimeInterval animationDuration = 0.2f;
    [self _moveView:self.view byY:dy withAnimationDuration:animationDuration];
}

- (void)_moveView:(UIView *)view byY:(CGFloat)dy withAnimationDuration:(NSTimeInterval)duration {
    __block UIView *blockSafeView = view;
    [UIView animateWithDuration:duration animations:^(void){
        blockSafeView.frame = CGRectOffset(blockSafeView.frame, 0, dy);
    }];
}


@end
