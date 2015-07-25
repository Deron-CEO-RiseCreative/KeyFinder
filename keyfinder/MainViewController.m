//
//  MainViewController.m
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import "MainViewController.h"
#import "SettingViewController.h"
#import "LockSerialSearchViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect frame = _viewCombo.frame;
    ComboBox *comboBox = [[ComboBox alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    
    comboBox.delegate = self;
    [comboBox setComboBoxSize:CGSizeMake(frame.size.width, 44*4)];
    [self.view addSubview:comboBox];
    comboBox.layer.cornerRadius = 6;
    
    _dataObjects = [NSArray arrayWithObjects:@"Door",@"Other Location",@"Auto",@"Lock", @"Furniture", @"Others", nil];
    
    [comboBox setComboBoxDataArray:_dataObjects];

    _btnFindLock.layer.cornerRadius = 6;
    _btnFindLock.layer.borderWidth = 0.5f;
    _btnFindLock.layer.borderColor = [UIColor whiteColor].CGColor;
    
    _btnInput.layer.cornerRadius = 6;
    _btnInput.layer.borderWidth = 0.5f;
    _btnInput.layer.borderColor = [UIColor whiteColor].CGColor;
    
    _viewCombo.layer.cornerRadius = 6;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)didClickBarButtonBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)didClickBarButtonHome:(id)sender{
    SettingViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"vcSetting"];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

-(IBAction)didClickButtonFindLock:(id)sender{
//    [self performSegueWithIdentifier:@"segueLockStartSearch"
//                              sender:Nil];
    LockSerialSearchViewController *aYourViewController = [self.storyboard   instantiateViewControllerWithIdentifier:@"vcLockSerialSearch"];
    [self.navigationController pushViewController:aYourViewController animated:NO];
    
}



-(IBAction)didClickButtonInput:(id)sender{
    [self performSegueWithIdentifier:@"segueInputKeyLock"
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

#pragma mark - Combobox

-(void)comboBox:(ComboBox *)comboBox didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@", [_dataObjects objectAtIndex:indexPath.row]);
    
    if (indexPath.row == 0 || indexPath.row == 1)
        [self performSegueWithIdentifier:@"segueGPSKeySearch"
                                  sender:Nil];
    else
        [self performSegueWithIdentifier:@"segueDirectKeySearch"
                                  sender:Nil];
}


@end
