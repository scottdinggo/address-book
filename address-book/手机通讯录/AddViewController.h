//
//  AddViewController.h
//  手机通讯录
//
//  Created by Scottding on 15/9/29.
//  Copyright (c) 2015年 NYNU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddViewController,Contents;

@protocol AddViewControllerDelegate <NSObject>

@optional
- (void)addViewController:(AddViewController *)addVc addContents:(Contents *)contents;

@end

@interface AddViewController : UIViewController

@property(nonatomic, weak) id<AddViewControllerDelegate> delegate;

@end
