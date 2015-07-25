//
//  LockSearchViewController.m
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import "LockSearchViewController.h"
#import "SettingViewController.h"

@interface LockSearchViewController ()

@end

@implementation LockSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    // Use Comobobox add
    CGRect frame = _viewComboUse.frame;
    ComboBox *cmbUse = [[ComboBox alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    
    [cmbUse.button setTitle:@"USE" forState:UIControlStateNormal];
    
    cmbUse.delegate = self;
    [cmbUse setComboBoxSize:CGSizeMake(frame.size.width, 44*6)];
    
    
    
    [self.view addSubview:cmbUse];
    
    _arrUse = [NSArray arrayWithObjects:@"Door",@"Other Location",@"Auto",@"Lock", @"Furniture", @"Others", nil];
    
    [cmbUse setComboBoxDataArray:_arrUse];
    
    
    // Head
    frame = _viewComboHeader.frame;
    ComboBox *cmbHead = [[ComboBox alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    
    [cmbHead.button setTitle:@"HEAD" forState:UIControlStateNormal];
    
    cmbHead.delegate = self;
    [cmbHead setComboBoxSize:CGSizeMake(frame.size.width, 44*3)];
    [self.view addSubview:cmbHead];
    
    _arrHeader = [NSArray arrayWithObjects:@"Square",@"Round", @"Other", nil];
    
    [cmbHead setComboBoxDataArray:_arrHeader];
    
    
    // Length
    frame = _viewComboLength.frame;
    ComboBox *cmbLength = [[ComboBox alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    
    [cmbLength.button setTitle:@"LENGTH" forState:UIControlStateNormal];
    
    cmbLength.delegate = self;
    [cmbLength setComboBoxSize:CGSizeMake(frame.size.width, 44*2)];
    [self.view addSubview:cmbLength];
    
    _arrLength = [NSArray arrayWithObjects:@"Short",@"Length", nil];
    
    [cmbLength setComboBoxDataArray:_arrLength];
    
    
    // Add comboboxs
    frame = _viewComboColor.frame;
    ComboBox *cmbColor = [[ComboBox alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    
    [cmbColor.button setTitle:@"COLOR" forState:UIControlStateNormal];
    
    cmbColor.delegate = self;
    [cmbColor setComboBoxSize:CGSizeMake(frame.size.width, 44*5)];
    [self.view addSubview:cmbColor];
    
    _arrColor = [NSArray arrayWithObjects:@"Gold",@"Silver",@"Black",@"Multi", @"Others", nil];
    
    [cmbColor setComboBoxDataArray:_arrColor];
    
    
    
    _btnSearch.layer.cornerRadius = 6;
    cmbColor.layer.cornerRadius = 6;
    cmbHead.layer.cornerRadius = 6;
    cmbLength.layer.cornerRadius = 6;
    cmbUse.layer.cornerRadius = 6;
    
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

-(IBAction)didClickButtonSearch:(id)sender{
    [self performSegueWithIdentifier:@"segueKeyLibrary"
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
    //    NSLog(@"%@", [_dataObjects objectAtIndex:indexPath.row]);
    
}

@end
