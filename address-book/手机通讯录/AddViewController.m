//
//  AddViewController.m
//  手机通讯录
//
//  Created by Scottding on 15/9/29.
//  Copyright (c) 2015年 NYNU. All rights reserved.
//

#import "AddViewController.h"
#import "Contents.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *Account;

@property (weak, nonatomic) IBOutlet UITextField *Pwd;

@property (weak, nonatomic) IBOutlet UIButton *login;

- (IBAction)addlogin:(UIButton *)sender;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valuChange) name:UITextFieldTextDidChangeNotification object:self.Account];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valuChange) name:UITextFieldTextDidChangeNotification object:self.Pwd];
   
    
}

- (void)viewDidAppear:(BOOL)animated    {
    [super viewDidAppear:animated];
    [self.Account becomeFirstResponder];
}

- (void)valuChange  {
    if(self.Account.text.length > 0 && self.Pwd.text.length > 0)    {
        self.login.enabled = YES;
    }
    else    {
        self.login.enabled = NO;
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (IBAction)addlogin:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    Contents *contents = [[Contents alloc] init];
    contents.name = self.Account.text;
    contents.phone = self.Pwd.text;
    if([self.delegate respondsToSelector:@selector(addViewController:addContents:)])
        [self.delegate addViewController:self addContents:contents];
}
@end
