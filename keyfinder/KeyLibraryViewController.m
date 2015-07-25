//
//  KeyLibraryViewController.m
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import "KeyLibraryViewController.h"
#import "SettingViewController.h"
#import "AppDelegate.h"
@import AssetsLibrary;

@interface KeyLibraryViewController ()

@end

@implementation KeyLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    KeyLockDatabase * keyDb = [DELEGATE keylockDB];
    _mLocks = [keyDb getKeyLockCollection];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return [_mLocks count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* CellIdentifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    
//    cell.textLabel.text = @"I'm a UITableViewCell!";
    
    KeyLock *keylock = [_mLocks objectAtIndex:indexPath.row];
    
    CGRect frame = _tblLocks.frame;
//    cell.imageView.frame = CGRectMake(0,0,frame.size.width,200);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,frame.size.width,250)];
    
    ALAssetsLibrary *assetLib = [[ALAssetsLibrary alloc] init];
    [assetLib assetForURL:keylock.lock_imageUrl
              resultBlock:^(ALAsset *asset) {
                  ALAssetRepresentation *rep = [asset defaultRepresentation];
                  CGImageRef imageRef = [rep fullResolutionImage];
                  if (imageRef) {
                      UIImage  *copyOfOriginalImage = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage] scale:0.5 orientation:UIImageOrientationUp];
                      imageView.image = copyOfOriginalImage;
                  }
              }
             failureBlock:^(NSError *error) {
                 NSLog(@"AssetLib is failing");
             }];
    
    [cell.contentView addSubview:imageView];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"segueLibraryToLock"
                              sender:Nil];
}




@end
