//
//  FileUtility.h
//  MyApp
//
//  Created by Rahul Mane on 30/10/15.
//  Copyright (c) 2015 Rahul Mane. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileUtility : NSObject
-(NSString *)getBaseFilePath;

-(NSArray *)listFileAtPath:(NSString *)strFilePath;

-(BOOL)createFolderWithName:(NSString *)foldername;
-(void)saveFile:(NSString *)filename andFile:(NSData *)file;

@end
