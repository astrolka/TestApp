//
//  EditViewController.m
//  TestApp
//
//  Created by Александр Смоленский on 11.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import "EditViewController.h"
#import "ReactiveObjC.h"
#import "ApplicationDetailInfoViewModel.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    
}

- (void)initialize {
    
    self.textView.text = self.oldText;
    
    [[self.closeBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         [self.textView resignFirstResponder];
         [self dismissViewControllerAnimated:YES completion:nil];
     }];
    
    [[self.saveBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         [self.textView resignFirstResponder];
         self.viewModel.solutionDescription = self.textView.text;
         self.viewModel.shouldReloadData = YES;
         [self dismissViewControllerAnimated:YES completion:nil];
     }];
    
    [self.textView becomeFirstResponder];
}


@end
