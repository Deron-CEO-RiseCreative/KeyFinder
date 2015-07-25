//
//  InputViewController.m
//  keyfinder
//
//  Created by System Administrator on 7/19/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import "InputViewController.h"
#import "SettingViewController.h"
#import "AppDelegate.h"
#import "KeyLock.h"
@import AssetsLibrary;
#import "ALAssetsLibrary+CustomPhotoAlbum.h"

@interface InputViewController ()

@end

@implementation InputViewController{
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
    
    // set scroll size
    [_scroll1 setContentSize:CGSizeMake(300, 700)];
    
    // Use Comobobox add
    CGRect frame = _viewComboUse.frame;
    ComboBox *cmbUse = [[ComboBox alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    
    [cmbUse.button setTitle:@"USE" forState:UIControlStateNormal];
    
    cmbUse.delegate = self;
    [cmbUse setComboBoxSize:CGSizeMake(frame.size.width, 44*6)];
    [_scroll1 addSubview:cmbUse];
    
    _arrUse = [NSArray arrayWithObjects:@"Door",@"Other Location",@"Auto",@"Lock", @"Furniture", @"Others", nil];
    
    [cmbUse setComboBoxDataArray:_arrUse];
    
    
    // Head
    frame = _viewComboHeader.frame;
    ComboBox *cmbHead = [[ComboBox alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    
    [cmbHead.button setTitle:@"HEAD" forState:UIControlStateNormal];
    
    cmbHead.delegate = self;
    [cmbHead setComboBoxSize:CGSizeMake(frame.size.width, 44*3)];
    [_scroll1 addSubview:cmbHead];
    
    _arrHeader = [NSArray arrayWithObjects:@"Square",@"Round", @"Other", nil];
    
    [cmbHead setComboBoxDataArray:_arrHeader];

    
    // Length
    frame = _viewComboLength.frame;
    ComboBox *cmbLength = [[ComboBox alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    
    [cmbLength.button setTitle:@"LENGTH" forState:UIControlStateNormal];
    
    cmbLength.delegate = self;
    [cmbLength setComboBoxSize:CGSizeMake(frame.size.width, 44*2)];
    [_scroll1 addSubview:cmbLength];
    
    _arrLength = [NSArray arrayWithObjects:@"Short",@"Length", nil];
    
    [cmbLength setComboBoxDataArray:_arrLength];

    
    // Add comboboxs
    frame = _viewComboColor.frame;
    ComboBox *cmbColor = [[ComboBox alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    
    [cmbColor.button setTitle:@"COLOR" forState:UIControlStateNormal];
    
    cmbColor.delegate = self;
    [cmbColor setComboBoxSize:CGSizeMake(frame.size.width, 44*5)];
    [_scroll1 addSubview:cmbColor];
    
    _arrColor = [NSArray arrayWithObjects:@"Gold",@"Silver",@"Black",@"Multi", @"Others", nil];
    
    [cmbColor setComboBoxDataArray:_arrColor];



    _btnMap.layer.cornerRadius = 6;
    _btnSave.layer.cornerRadius = 6;
    _txtSerial.layer.cornerRadius = 6;
    _txtNote.layer.cornerRadius = 6;
    
     cmbColor.layer.cornerRadius = 6;
     cmbUse.layer.cornerRadius = 6;
     cmbLength.layer.cornerRadius = 6;
     cmbHead.layer.cornerRadius = 6;
    
    
    _txtSerial.layer.borderColor = [UIColor blackColor].CGColor;
    _txtNote.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    
    _txtSerial.layer.borderWidth = 0.5f;
    _txtNote.layer.borderWidth = 0.5f;
    
 
    
}

- (void)imageClicked:(UITapGestureRecognizer *)recognizer
{
    [actionSheet showInView:self.view];
    
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
        UIImage *chosenImage = [info objectForKey:UIImagePickerControllerEditedImage];
        if (!chosenImage) {
            chosenImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
        
        
        KeyLock * keyInput = [DELEGATE keyInput];
        
        keyInput.key_imageUrl = [info objectForKey:UIImagePickerControllerReferenceURL];
//        [DELEGATE setKeyInput:keyInput];
        
    }

    [picker dismissViewControllerAnimated:YES completion:^{
    }];
    
    imgKey = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    _imgKey.image = imgKey;
    
    
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
    
    [library addAssetURL:keyInput.key_imageUrl
                 toAlbum:folderName
     withCompletionBlock:^(NSError *error) {
         if (error) {
             NSLog(@"%@", error);
         }
         else{
             // if image copy is successed.
             
             [self performSegueWithIdentifier:@"segueToCreate"
                                       sender:Nil];
         }
     }];


}

-(IBAction)didClickBarButtonHome:(id)sender{
    
    [[[UIAlertView alloc] initWithTitle:@"Alert"
                                message:@"Changes have not be saved.\n Are you sure you want to go back to Main Menu?"
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
    [self performSegueWithIdentifier:@"segueInputKeyMap"
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
