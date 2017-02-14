//
//  ApplicationDetailInfo.m
//  TestApp
//
//  Created by Александр Смоленский on 07.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import "ApplicationDetailInfo.h"
#import "ApplicationDetailInfoViewModel.h"
#import "ReactiveObjC.h"
#import "EditViewController.h"

@interface ApplicationDetailInfo ()

@end

@implementation ApplicationDetailInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 40;
    
    [self bindViewModel];
}

- (void)bindViewModel {
    
    self.navigationItem.title = self.viewModel.title;
    
    self.statusLabel.text               = self.viewModel.statusText;
    self.fullNameLabel.text             = self.viewModel.fullName;
    self.descriptionLabel.text          = self.viewModel.applicationDescription;
    self.solutionDescriptionLabel.text  = self.viewModel.solutionDescription;
    self.createdDateLabel.text          = self.viewModel.createdAt;
    self.recoveryTime.text              = self.viewModel.recoveryTime;
    self.actualRecoveryTime.text        = self.viewModel.actualRecoveryTime;
    
    [[self.editButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         EditViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EditViewController"];
         vc.oldText = self.solutionDescriptionLabel.text;
         vc.viewModel = self.viewModel;
         [self presentViewController:vc animated:YES completion:nil];
     }];
    
    RAC(self.solutionDescriptionLabel, text) = RACObserve(self.viewModel, solutionDescription);
    
    [[RACObserve(self.viewModel, shouldReloadData)
      filter:^BOOL(NSNumber *value) {
          return value;
      }]
      subscribeNext:^(id  _Nullable x) {
          [self.tableView beginUpdates];
          [self.tableView endUpdates];
      }];
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}


@end
