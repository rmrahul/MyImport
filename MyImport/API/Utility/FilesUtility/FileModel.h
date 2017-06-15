//
//  FileModel.h
//  MySharingApp
//
//  Created by Rahul Mane on 04/11/15.
//  Copyright © 2015 Rahul Mane. All rights reserved.
//

enum fileType{
    fileTypeDirectory,
    fileTypeFile,
    fileTypeImage,
    fileTypeAudio,
    fileTypeVideo,
};


#import <Foundation/Foundation.h>

@interface FileModel : NSObject

@property(strong, nonatomic) NSString *strFileName;
@property(strong, nonatomic) NSString *strFilePath;
@property(strong, nonatomic) NSDate *dateCreated;
@property(strong, nonatomic) NSDate *dateModified;
@property(strong, nonatomic) NSNumber *sizeInBytes;
@property(readwrite, nonatomic) enum fileType fileType;

@end
