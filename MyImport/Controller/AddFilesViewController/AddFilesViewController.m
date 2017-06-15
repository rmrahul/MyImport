//
//  AddFilesViewController.m
//  MyApp
//
//  Created by Rahul Mane on 30/10/15.
//  Copyright (c) 2015 Rahul Mane. All rights reserved.
//

#import "AddFilesViewController.h"
#import "GCDWebUploader.h"
#import "FileUtility.h"

@interface AddFilesViewController () <GCDWebUploaderDelegate> {

@private
    GCDWebUploader* _webServer;
}
@end

@implementation AddFilesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    FileUtility *file=[[FileUtility alloc]init];

    
    _webServer = [[GCDWebUploader alloc] initWithUploadDirectory:[file getBaseFilePath] ];
    _webServer.delegate = self;
    _webServer.allowHiddenItems = YES;
    [_webServer start];
    
    self.lblURL.text=[NSString stringWithFormat:@"Please load this URL in browser :\n %@",[[_webServer serverURL] absoluteString]];
   // NSLog(@"Paht %@",documentsPath);
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [_webServer stop];

}
- (void)webUploader:(GCDWebUploader*)uploader didUploadFileAtPath:(NSString*)path {
    NSLog(@"[UPLOAD] %@", path);
    
    self.lblStatus.text=@"File uplaoded successfully.. You can take back";
    
}

- (void)webUploader:(GCDWebUploader*)uploader didMoveItemFromPath:(NSString*)fromPath toPath:(NSString*)toPath {
    NSLog(@"[MOVE] %@ -> %@", fromPath, toPath);
}

- (void)webUploader:(GCDWebUploader*)uploader didDeleteItemAtPath:(NSString*)path {
    NSLog(@"[DELETE] %@", path);
}

- (void)webUploader:(GCDWebUploader*)uploader didCreateDirectoryAtPath:(NSString*)path {
    NSLog(@"[CREATE] %@", path);
}



@end
