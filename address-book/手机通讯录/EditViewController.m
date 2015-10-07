//
//  EditViewController.m
//  手机通讯录
//
//  Created by Scottding on 15/10/4.
//  Copyright (c) 2015年 NYNU. All rights reserved.
//

#import "EditViewController.h"
#import "Contents.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;

- (IBAction)edit:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIButton *save;
@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name.text = self.content.name;
    self.phone.text = self.content.phone;
    
}


- (IBAction)edit:(UIBarButtonItem *)sender {
    if(self.name.enabled == NO)    {
        self.name.enabled = YES;
        self.phone.enabled = YES;
        self.save.hidden = NO;
        sender.title = @"取消";
    }
    else    {
        self.name.enabled = NO;
        self.phone.enabled = NO;
        self.save.hidden = YES;
        sender.title = @"编辑";
    }
}
@end
