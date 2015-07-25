//
//  CreateViewController.m
//  keyfinder
//
//  Created by System Administrator on 7/19/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import "CreateViewController.h"
#import "SettingViewController.h"
#import "AppDelegate.h"
#import "KeyLock.h"
@import AssetsLibrary;
#import "ALAssetsLibrary+CustomPhotoAlbum.h"

@interface CreateViewController ()

@end

@implementation CreateViewController{
    UIActionSheet *actionSheet;
    UIImage *imgKey;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initialize Camera dialog
    
    actionSheet = [[UIActionSheet alloc] initWithTitle:Nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                   @"Take Photo",
                   @"Choose Existing",
                   nil];
    actionSheet.tag = 1;
    
    _btnCancel.layer.cornerRadius = 6;
    _btnSave.layer.cornerRadius = 6;
    _btnTakePicture.layer.cornerRadius = 6;
    _btnViewMap.layer.cornerRadius = 6;
    _btnWriteNote.layer.cornerRadius = 6;
    
    _btnCancel.layer.borderColor = [UIColor whiteColor].CGColor;
    _btnViewMap.layer.borderColor = [UIColor whiteColor].CGColor;
    _btnWriteNote.layer.borderColor = [UIColor whiteColor].CGColor;
    
    _btnCancel.layer.borderWidth = 0.5f;
    _btnSave.layer.borderWidth = 0.5f;
    _btnTakePicture.layer.borderWidth = 0.5f;
    _btnViewMap.layer.borderWidth = 0.5f;
    _btnWriteNote.layer.borderWidth = 0.5f;
   
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (actionSheet.tag != 1) {
        return;
    }
    switch (buttonIndex) {
        case 0:{
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                picker.allowsEditing = YES;
                picker.delegate = self;
                [self presentViewController:picker animated:YES completion:^{
                    NSLog(@"presentViewController");
                }];
            }
            
            
        }
            break;
        case 1:{
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
            {
                UIImagePickerController *picker1 = [[UIImagePickerController alloc]init];
                picker1.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                picker1.allowsEditing = YES;
                picker1.delegate = self;
                [self presentViewController:picker1 animated:YES completion:^{
                    NSLog(@"presentViewController");
                }];
            }
            
        }
        default:
            break;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera
        ||picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {

        
        KeyLock * keyInput = [DELEGATE keyInput];
        
        keyInput.lock_imageUrl = [info objectForKey:UIImagePickerControllerReferenceURL];
        
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
    
    imgKey = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
//    _imgKey.image = imgKey;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)didClickButtonCamera:(id)sender{
    [actionSheet showInView:self.view];
}

-(IBAction)didClickBarButtonBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)didClickBarButtonSetting:(id)sender{
    SettingViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"vcSetting"];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

-(IBAction)didClickButtonSave:(id)sender{
    KeyLock *keyInput = [DELEGATE keyInput];
    
    NSString *folderName = @"KeyFinder App";
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    [library addAssetURL:keyInput.lock_imageUrl
                 toAlbum:folderName
     withCompletionBlock:^(NSError *error) {
         if (error) {
             NSLog(@"%@", error);
         }
         else{
             // if image copy is successed.
             KeyLock *keyInput1 = [DELEGATE keyInput];
             BOOL isPhotoSaved = [[DELEGATE keylockDB] saveKeyLock:keyInput1];
             
             if (!isPhotoSaved) {
                 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh-oh"
                                                                 message:@"It seems your photo did not save. Please try again"
                                                                delegate:nil
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil];
                 [alert show];
             }
             else
             {
                 [[[UIAlertView alloc] initWithTitle:@"Saved"
                                             message:@"Your Photo has been saved"
                                            delegate:nil
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles:nil] show];

             }
             
             
             UIViewController *vc = [self.navigationController.viewControllers objectAtIndex:1];
             [self.navigationController popToViewController:vc animated:NO];
         }
     }];

    
    
    
    

}

-(IBAction)didClickButtonCancel:(id)sender{
    
    [[[UIAlertView alloc] initWithTitle:@"Alert"
                                message:@"Changes have not be saved.\n Are you sure you want to cancel?"
                               delegate:self
                      cancelButtonTitle:@"No"
                      otherButtonTitles:@"Yes", nil] show];
    


}

-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:    (NSInteger)buttonIndex
{
    if(buttonIndex==1)  //Ok
    {
        //Code that will run after you press ok button
        
        UIViewController *vc = [self.navigationController.viewControllers objectAtIndex:1];
        
        [self.navigationController popToViewController:vc animated:NO];
    }
}


-(IBAction)didClickButtonMap:(id)sender{
    [self performSegueWithIdentifier:@"segueInputLockMap"
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

@end
