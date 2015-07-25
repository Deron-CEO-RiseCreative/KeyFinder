//
//  SettingViewController.m
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_swNotification setOnTintColor:[UIColor colorWithRed:74/255.0 green:58/255.0 blue:43/255.0 alpha:1.0]];
    _swNotification.transform = CGAffineTransformMakeScale(0.80, 0.75);

    [_swGPS setOnTintColor:[UIColor colorWithRed:74/255.0 green:58/255.0 blue:43/255.0 alpha:1.0]];
    _swGPS.transform = CGAffineTransformMakeScale(0.80, 0.75);

    [_swAutoUpdate setOnTintColor:[UIColor colorWithRed:74/255.0 green:58/255.0 blue:43/255.0 alpha:1.0]];
    _swAutoUpdate.transform = CGAffineTransformMakeScale(0.80, 0.75);

    [_swFacebook setOnTintColor:[UIColor colorWithRed:74/255.0 green:58/255.0 blue:43/255.0 alpha:1.0]];
    _swFacebook.transform = CGAffineTransformMakeScale(0.80, 0.75);

    [_swPassword setOnTintColor:[UIColor colorWithRed:74/255.0 green:58/255.0 blue:43/255.0 alpha:1.0]];
    _swPassword.transform = CGAffineTransformMakeScale(0.80, 0.75);

    _sliderVoice.transform = CGAffineTransformMakeScale(0.55, 0.55);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)didClickBarButtonBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
