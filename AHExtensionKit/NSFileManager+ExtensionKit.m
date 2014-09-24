//
//  NSFileManager+ExtensionKit.m
//  LiveSeen
//
//  Created by Alexey Hippie on 12/05/14.
//  Copyright (c) 2014 LiveSeen. All rights reserved.
//

#import "NSFileManager+ExtensionKit.h"

// Swift macros implement

NSFileManager* defaultFileManager() {
    return fileManager;
}

@implementation NSFileManager (ExtensionKit)

#pragma mark - Standart directories

- (NSString *)documentsDirectory {
    return [[self documentsDirectoryURL] path];
}

- (NSURL *)documentsDirectoryURL {
    NSURL *url = [[self URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    BOOL isDir;
    BOOL exist = [[NSFileManager defaultManager] fileExistsAtPath:[url path] isDirectory:&isDir];
    if (!exist || !isDir) {
        [self createDirectoryAtURL:url withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return url;
}

- (NSString *)cacheDirectory {
    return [[self cacheDirectoryURL] path];
}

- (NSURL *)cacheDirectoryURL {
    NSURL *url = [[self URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject];
    BOOL isDir;
    BOOL exist = [[NSFileManager defaultManager] fileExistsAtPath:[url path] isDirectory:&isDir];
    if (!exist || !isDir) {
        [self createDirectoryAtURL:url withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return url;
}

#pragma mark - checking

- (BOOL)fileExist:(NSString *)filePath {
    BOOL isDir;
    BOOL exist = [self fileExistsAtPath:filePath
                            isDirectory:&isDir];
    return (exist && !isDir);
}

- (BOOL)fileExistAtURL:(NSURL *)url {
    return [self fileExist:[url path]];
}

- (BOOL)dirExist:(NSString *)filePath {
    BOOL isDir;
    BOOL exist = [self fileExistsAtPath:filePath
                            isDirectory:&isDir];
    return (exist && isDir);
}

- (BOOL)dirExistAtURL:(NSURL *)url {
    return [self dirExist:[url path]];
}

#pragma marl - iCloud

- (BOOL)excludeFileFromICloud:(NSString *)filePath {
    return [self excludeFileFromICloudByURL:[NSURL URLWithString:filePath]];
}

- (BOOL)excludeFileFromICloudByURL:(NSURL *)url {
    BOOL result = NO;
    if (!url || ![self fileExistsAtPath:[url path]]) {
        return result;
    }
    
    NSError *error = nil;
    result = [url setResourceValue: [NSNumber numberWithBool: YES]
                            forKey: NSURLIsExcludedFromBackupKey error: &error];
    
    return result;
}

@end
