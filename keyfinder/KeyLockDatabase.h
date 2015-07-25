//
//  KeyLockDatabase.h
//  keyfinder
//
//  Created by System Administrator on 7/24/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "KeyLock.h"

@interface KeyLockDatabase : NSObject

@property (nonatomic) sqlite3 *photoDB;
@property (strong, nonatomic) NSString *databasePath;

- (BOOL)saveKeyLock:(KeyLock *)key;
- (NSArray *)getKeyLockCollection;

@end
