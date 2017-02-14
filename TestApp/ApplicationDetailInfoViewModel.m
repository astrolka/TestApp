//
//  ApplicationDetailInfoViewModel.m
//  TestApp
//
//  Created by Александр Смоленский on 11.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import "ApplicationDetailInfoViewModel.h"
#import "AtrinityApplicationInfo.h"


@interface ApplicationDetailInfoViewModel ()

@property(strong, nonatomic) AtrinityApplicationInfo *model;

@end

@implementation ApplicationDetailInfoViewModel

- (instancetype)initWithModel:(AtrinityApplicationInfo *)model
{
    self = [super init];
    if (self) {
        _model  = model;
        [self initialize];
    }
    return self;
}

- (void)initialize {
    
    self.shouldReloadData = NO;
    self.statusText = self.model.statusText;
    self.fullName = self.model.fullName;
    self.applicationDescription = self.model.applicationDescription;
    self.solutionDescription = self.model.solutionDescription;
    
    NSDateFormatter *standartFormater = [[NSDateFormatter alloc] init];
    [standartFormater setDateFormat:@"dd.MM.yyyy HH:mm"];
    
    NSDateFormatter *shortFormater = [[NSDateFormatter alloc] init];
    
    shortFormater.dateStyle = NSDateFormatterShortStyle;
    shortFormater.timeStyle = NSDateFormatterShortStyle;
    shortFormater.doesRelativeDateFormatting = YES;
    
    NSDate *tempDate = [standartFormater dateFromString:self.model.createdAt];
    self.createdAt = [shortFormater stringFromDate:tempDate];
    
    tempDate = [standartFormater dateFromString:self.model.recoveryTime];
    self.recoveryTime = [shortFormater stringFromDate:tempDate];
    
    tempDate = [standartFormater dateFromString:self.model.actualRecoveryTime];
    self.actualRecoveryTime = [shortFormater stringFromDate:tempDate];
}

@end

