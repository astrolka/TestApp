//
//  ApplicationViewModel.h
//  TestApp
//
//  Created by Александр Смоленский on 05.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AtrinityApplication, RACCommand;
@protocol ViewModelServicesProtocol;

@interface ApplicationItemViewModel : NSObject

@property(strong, nonatomic)NSString *date;
@property(strong, nonatomic)NSString *name;
@property(strong, nonatomic)NSString *requestNumber;
@property(strong, nonatomic)RACCommand *executeLoadInfo;


- (instancetype)initWithApplication:(AtrinityApplication *)application services:(id<ViewModelServicesProtocol>)services;

@end
