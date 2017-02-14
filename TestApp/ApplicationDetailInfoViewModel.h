//
//  ApplicationDetailInfoViewModel.h
//  TestApp
//
//  Created by Александр Смоленский on 11.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AtrinityApplicationInfo;

@interface ApplicationDetailInfoViewModel : NSObject

@property(assign, nonatomic) BOOL shouldReloadData;
@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *statusText;
@property(strong, nonatomic) NSString *fullName;
@property(strong, nonatomic) NSString *applicationDescription;
@property(strong, nonatomic) NSString *solutionDescription;
@property(strong, nonatomic) NSString *createdAt;
@property(strong, nonatomic) NSString *recoveryTime;
@property(strong, nonatomic) NSString *actualRecoveryTime;

- (instancetype)initWithModel:(AtrinityApplicationInfo *)model;

@end
