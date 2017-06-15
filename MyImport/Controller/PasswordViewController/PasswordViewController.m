//
//  PasswordViewController.m
//  MyImport
//
//  Created by Rahul Mane on 05/11/15.
//  Copyright © 2015 Rahul Mane. All rights reserved.
//

#import "PasswordViewController.h"

@interface PasswordViewController ()

@end

@implementation PasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(nullable id)sender{
    
    if([identifier isEqualToString:@"segueHome"]){
        if(self.txtPassword.text.length && [self.txtPassword.text isEqualToString:@"zxcvbnm"]){
            self.txtPassword.text = @"";
            return YES;
        }
        
    }
    return NO;
}



@end
