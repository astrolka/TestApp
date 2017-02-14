//
//  ApplicationItemCell.m
//  TestApp
//
//  Created by Александр Смоленский on 06.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import "ApplicationItemCell.h"
#import "ApplicationItemViewModel.h"
#import "ReactiveObjC.h"

@interface ApplicationItemCell ()

@property(weak, nonatomic)ApplicationItemViewModel *viewModel;

@end

@implementation ApplicationItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)bindViewModel:(ApplicationItemViewModel *)viewModel {
    
    self.requestNumberLabel.text    = viewModel.requestNumber;
    self.descriptionLabel.text      = viewModel.name;
    self.timeLabel.text             = viewModel.date;
    
    self.viewModel = viewModel;
    RAC(self.activityIndicator, animating) = [self.viewModel.executeLoadInfo.executing
                                              takeUntil:self.rac_prepareForReuseSignal];
    
    [[self.viewModel.executeLoadInfo.executing
     takeUntil:self.rac_prepareForReuseSignal]
     subscribeNext:^(NSNumber * _Nullable x) {
         [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:[x boolValue]];
     }];
    
}



@end
