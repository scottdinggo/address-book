//
//  LoginViewController.m
//  手机通讯录
//
//  Created by Scottding on 15/9/29.
//  Copyright (c) 2015年 NYNU. All rights reserved.
//

#import "LoginViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *Account;
@property (weak, nonatomic) IBOutlet UITextField *Pwd;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UISwitch *remeberPwd;
@property (weak, nonatomic) IBOutlet UISwitch *autoLogin;
- (IBAction)log:(UIButton *)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valuChange) name:UITextFieldTextDidChangeNotification object:self.Account];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valuChange) name:UITextFieldTextDidChangeNotification object:self.Pwd];
    [self.remeberPwd addTarget:self action:@selector(switchChange1) forControlEvents:UIControlEventValueChanged];
    [self.autoLogin addTarget:self action:@selector(switchChange2) forControlEvents:UIControlEventValueChanged];
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

- (void)switchChange1    {
    if(self.remeberPwd.isOn == NO)
        self.autoLogin.on = NO;
}

- (void)switchChange2    {
    if (self.autoLogin.on == YES)
        self.remeberPwd.on = YES;
}

- (IBAction)log:(UIButton *)sender {
    if([self.Account.text isEqualToString:@"scottding"] && [self.Pwd.text isEqualToString:@"DHL314159"])
        [self performSegueWithIdentifier:@"login" sender:nil];
    
    else    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"账号或密码错误" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

- (void)viewDidAppear:(BOOL)animated    {
    [super viewDidAppear:animated];
    [self.Account becomeFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender    {
    UIViewController *vc = segue.destinationViewController;
    vc.title = [NSString stringWithFormat:@"%@的联系人列表",self.Account.text];
}
@end
