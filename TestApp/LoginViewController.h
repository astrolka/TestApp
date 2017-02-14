//
//  LoginViewController.h
//  TestApp
//
//  Created by Александр Смоленский on 06.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LoginViewModel;

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ativityIndicator;

- (instancetype)initWithViewModel:(LoginViewModel *)viewModel;

@end
