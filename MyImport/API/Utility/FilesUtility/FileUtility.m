//
//  FileUtility.m
//  MyApp
//
//  Created by Rahul Mane on 30/10/15.
//  Copyright (c) 2015 Rahul Mane. All rights reserved.
//

#import "FileUtility.h"
#import "FileModel.h"
@import AssetsLibrary;
@import MobileCoreServices;

@implementation FileUtility


-(NSString *)getBaseFilePath{
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];

    return documentsPath;
}




-(NSArray *)listFileAtPath:(NSString *)strFilePath
{
    NSMutableArray *arrayToReturn=[[NSMutableArray alloc]init];
    NSString *documentPath=[self getBaseFilePath];
    
    if(strFilePath.length>0){
        documentPath=[documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",strFilePath]];
    }
    
    
    NSArray *directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentPath error:NULL];
    for (int count = 0; count < (int)[directoryContent count]; count++)
    {
        FileModel *fileModel = [[FileModel alloc]init];
        
        NSString *nameOfFile =[directoryContent objectAtIndex:count];
        NSError* error;
        NSDictionary *fileDictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:[NSString stringWithFormat:@"%@/%@",documentPath,nameOfFile] error: &error];
   

        fileModel.strFileName = nameOfFile;
        fileModel.strFilePath = [NSString stringWithFormat:@"%@/%@",documentPath,nameOfFile];

        fileModel.dateCreated = [fileDictionary objectForKey:NSFileCreationDate];
        fileModel.dateModified = [fileDictionary objectForKey:NSFileModificationDate];
        fileModel.sizeInBytes = [fileDictionary objectForKey:NSFileSize];

        NSString *pathExtension = [fileModel.strFilePath pathExtension];
        CFStringRef preferredUTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)pathExtension, NULL);
      //  BOOL fileConformsToAudio = UTTypeConformsTo(preferredUTI, kUTTypeAudio);

        CFStringRef fileUTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef _Nonnull)(pathExtension), NULL);

        
        if (UTTypeConformsTo(fileUTI, kUTTypeImage)){
            fileModel.fileType = fileTypeImage;

        }
        else if (UTTypeConformsTo(fileUTI, kUTTypeMovie)) {
            fileModel.fileType = fileTypeVideo;
        }
        else if (UTTypeConformsTo(fileUTI, kUTTypeAudio)){
            fileModel.fileType = fileTypeAudio;
        }

        
        if([fileDictionary objectForKey:NSFileType] == NSFileTypeDirectory){
            fileModel.fileType = fileTypeDirectory;
        }

        [arrayToReturn addObject:fileModel];
    }
    return arrayToReturn;
}

-(BOOL)createFolderWithName:(NSString *)foldername{
    BOOL isSuccess=NO;
    
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *dataPath = [documentsPath stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",foldername]];
    NSError *error;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath]){
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error]; //Create folder
        isSuccess=YES;
    }
    else {
        isSuccess=NO;
    }
    
    return isSuccess;
}

-(void)saveFile:(NSString *)filename andFile:(NSData *)file{
    NSString *documentPath=[self getBaseFilePath];
    NSString *filePath = [documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",filename]];

    [file writeToFile:filePath atomically:YES]; //Write the file
}
@end
