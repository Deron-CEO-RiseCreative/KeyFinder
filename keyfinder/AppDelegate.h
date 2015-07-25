//
//  AppDelegate.h
//  keyfinder
//
//  Created by System Administrator on 7/17/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyLockDatabase.h"

#define kKeyboardHeightPortrait 216
#define kKeyboardHeightLandscape 140
#define DELEGATE (AppDelegate *)[[UIApplication sharedApplication]delegate]

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) KeyLockDatabase *keylockDB;
@property (strong, nonatomic) KeyLock *keyInput;

@end

