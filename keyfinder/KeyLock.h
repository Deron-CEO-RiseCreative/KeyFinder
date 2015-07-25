//
//  KeyLock.h
//  keyfinder
//
//  Created by System Administrator on 7/24/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

#define KEY_ID 0
#define KEY_SERIAL 1
#define KEY_COLOR 2
#define KEY_LENGTH 3
#define KEY_HEADER 4
#define KEY_USE 5
#define KEY_PHOTO 6
#define KEY_NOTE 7
#define KEY_LAT 8
#define KEY_LON 9
#define LOCK_LOCATION 10
#define LOCK_LAT 11
#define LOCK_LON 12
#define LOCK_PHOTO 13
#define LOCK_NOTE 14

@interface KeyLock : NSObject

@property (nonatomic, strong) NSString *key_serial;
@property (nonatomic, strong) NSURL *key_imageUrl;

@property (nonatomic, strong) NSString *key_color;
@property (nonatomic, strong) NSString *key_length;
@property (nonatomic, strong) NSString *key_header;
@property (nonatomic, strong) NSString *key_use;
@property (nonatomic, strong) NSString *key_note;
@property (nonatomic, strong) NSString *key_latitude;
@property (nonatomic, strong) NSString *key_longitude;

@property (nonatomic, strong) NSString *lock_location;
@property (nonatomic, strong) NSURL *lock_imageUrl;

@property (nonatomic, strong) NSString *lock_latitude;
@property (nonatomic, strong) NSString *lock_longitude;
@property (nonatomic, strong) NSString *lock_note;


@end
