//
//  ApplicationDetailInfo.h
//  TestApp
//
//  Created by Александр Смоленский on 07.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ApplicationDetailInfoViewModel;

@interface ApplicationDetailInfo : UITableViewController

@property (strong, nonatomic)ApplicationDetailInfoViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *solutionDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *createdDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *recoveryTime;
@property (weak, nonatomic) IBOutlet UILabel *actualRecoveryTime;

@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end
