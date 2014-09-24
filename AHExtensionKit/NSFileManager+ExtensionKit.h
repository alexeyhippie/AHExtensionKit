//
//  NSFileManager+ExtensionKit.h
//  LiveSeen
//
//  Created by Alexey Hippie on 12/05/14.
//  Copyright (c) 2014 LiveSeen. All rights reserved.
//

#import <Foundation/Foundation.h>

#define fileManager [NSFileManager defaultManager]

// Swift macros functions
extern NSFileManager* defaultFileManagerA();

@interface NSFileManager (ExtensionKit)

#pragma mark - Standart directories
- (NSString *)documentsDirectory;
- (NSURL *)documentsDirectoryURL;
- (NSString *)cacheDirectory;
- (NSURL *)cacheDirectoryURL;

#pragma mark - checking
- (BOOL)fileExist:(NSString *)filePath;
- (BOOL)fileExistAtURL:(NSURL *)url;
- (BOOL)dirExist:(NSString *)filePath;
- (BOOL)dirExistAtURL:(NSURL *)url;

#pragma marl - iCloud
- (BOOL)excludeFileFromICloud:(NSString *)filePath;
- (BOOL)excludeFileFromICloudByURL:(NSURL *)url;

@end
