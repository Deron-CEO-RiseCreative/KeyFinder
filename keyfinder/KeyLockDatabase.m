//
//  KeyLockDatabase.m
//  keyfinder
//
//  Created by System Administrator on 7/24/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import "KeyLockDatabase.h"
#import "KeyLock.h"

@implementation KeyLockDatabase

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createDBIfNotExists];
    }
    return self;
}

- (void)createDBIfNotExists
{
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    self.databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"keylocks.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: self.databasePath ] == NO)
    {
        const char *dbpath = [self.databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &_photoDB) == SQLITE_OK)
        {
            char *errMsg;
            
            const char *sql_stmt =
            "CREATE TABLE IF NOT EXISTS tblKey (id INTEGER PRIMARY KEY AUTOINCREMENT, key_serial TEXT, key_color TEXT, key_length TEXT, key_header TEXT, key_use TEXT, key_photo TEXT, key_note TEXT, key_latitude TEXT, key_longitude TEXT, lock_location TEXT, lock_latitude TEXT, lock_longitude TEXT, lock_photo TEXT, lock_note TEXT)";
            
            
            if (sqlite3_exec(self.photoDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"Failed to create table");
            }
            
            sqlite3_close(self.photoDB);
            
        }
        else {
            NSLog(@"Failed to open/create database");
        }
    }
    
}

- (BOOL)saveKeyLock:(KeyLock *)key
{
    BOOL isPhotoSaved = NO;
    sqlite3_stmt *statement;
    const char *dbpath = [self.databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_photoDB) == SQLITE_OK)
    {
        
        NSString *insertSQL = [NSString stringWithFormat:
                               @"INSERT INTO tblKey (key_serial, key_color, key_length, key_header, key_use, key_photo, key_note, key_latitude, key_longitude, lock_location, lock_latitude, lock_longitude, lock_photo, lock_note) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")",
                               key.key_serial, key.key_color, key.key_length, key.key_header, key.key_use, key.key_imageUrl, key.key_note, key.key_latitude, key.key_longitude, key.lock_location, key.lock_latitude, key.lock_longitude, key.lock_imageUrl, key.lock_note];
        
        const char *insert_stmt = [insertSQL UTF8String];
        NSLog(@"insert stmt = %s", insert_stmt);
        
        sqlite3_prepare_v2(self.photoDB, insert_stmt,
                           -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            isPhotoSaved = YES;
            NSLog(@"photo saved");
        } else {
            isPhotoSaved = NO;
            NSLog(@"photo not saved");
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(self.photoDB);
    }
    return isPhotoSaved;
}

- (NSArray *)getKeyLockCollection
{
    NSMutableArray *keylocks = [[NSMutableArray alloc] init];
    const char *dbpath = [self.databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &_photoDB) == SQLITE_OK)
    {
        NSString *querySQL = @"SELECT * FROM tblKey ORDER BY id ASC";
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(self.photoDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                KeyLock *currentKey = [[KeyLock alloc] init];
                
                NSString *key_serial = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, KEY_SERIAL)];
                currentKey.key_serial = key_serial;
                
                NSString *key_imageUrl = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, KEY_PHOTO)];
                currentKey.key_imageUrl = [NSURL URLWithString:key_imageUrl];
                
                NSString *key_color = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, KEY_COLOR)];
                NSString *key_length = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, KEY_LENGTH)];
                NSString *key_header = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, KEY_HEADER)];
                NSString *key_use = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, KEY_USE)];

                NSString *key_note = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, KEY_NOTE)];
                NSString *key_latitude = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, KEY_LAT)];
                NSString *key_longitude = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, KEY_LON)];
                NSString *lock_location = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, LOCK_LOCATION)];
                NSString *lock_latitude = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, LOCK_LAT)];
                NSString *lock_longitude = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, LOCK_LON)];
                NSString *lock_photo = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, LOCK_PHOTO)];
                NSString *lock_note = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, LOCK_NOTE)];

                currentKey.key_color = key_color;
                currentKey.key_length = key_length;
                currentKey.key_header = key_header;
                currentKey.key_use = key_use;
                currentKey.key_note = key_note;
                currentKey.key_latitude = key_latitude;
                currentKey.key_longitude = key_longitude;
                currentKey.lock_location = lock_location;
                currentKey.lock_latitude = lock_latitude;
                currentKey.lock_longitude = lock_longitude;
                currentKey.lock_note = lock_note;
              
                currentKey.lock_imageUrl = [NSURL URLWithString:lock_photo];

                [keylocks addObject:currentKey];
            }
            
        }
        else
        {
            NSLog(@"No Data Found");
        }
        
        sqlite3_finalize(statement);
    }
    sqlite3_close(self.photoDB);
    
    return keylocks;
}

- (void)test
{
    
}

@end
