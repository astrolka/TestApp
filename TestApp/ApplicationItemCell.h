//
//  ApplicationItemCell.h
//  TestApp
//
//  Created by Александр Смоленский on 06.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ApplicationItemViewModel;

@interface ApplicationItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *requestNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (void)bindViewModel:(ApplicationItemViewModel *)viewModel;

@end
