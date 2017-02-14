//
//  LoginViewController.m
//  TestApp
//
//  Created by Александр Смоленский on 06.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginViewModel.h"
#import "ReactiveObjC.h"

@interface LoginViewController () <UITextFieldDelegate>

@property(strong, nonatomic)LoginViewModel *viewModel;

@end

@implementation LoginViewController

- (instancetype)initWithViewModel:(LoginViewModel *)viewModel
{
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindViewModel];
    
}

- (void)bindViewModel {
    self.loginButton.rac_command = self.viewModel.executeApplicationsLoad;
    
    RAC(self.viewModel, login) = self.loginTextField.rac_textSignal;
    RAC(self.viewModel, password) = self.passwordTextField.rac_textSignal;
    
    RAC(self.ativityIndicator, animating) = self.viewModel.executeApplicationsLoad.executing;
    RAC([UIApplication sharedApplication], networkActivityIndicatorVisible) = self.viewModel.executeApplicationsLoad.executing;
    
    [self.viewModel.executeApplicationsLoad.executionSignals
     subscribeNext:^(id  _Nullable x) {
         [self.passwordTextField resignFirstResponder];
         [self.loginTextField resignFirstResponder];
     }];
    
    [self.viewModel.errorSignals
     subscribeNext:^(NSError *error) {
         [self alertWithError:error];
     }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Allert

- (void)alertWithError:(NSError *)error {
    NSString *message = [error.userInfo objectForKey:@"error"];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Ошибка!"
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *retryAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:retryAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - <UITextFieldDelegate>

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.loginTextField]) {
        [self.loginTextField resignFirstResponder];
        [self.passwordTextField becomeFirstResponder];
    } else {
        [self.viewModel.executeApplicationsLoad execute:nil];
    }
    
    return YES;
}

@end
