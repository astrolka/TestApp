//
//  LoginViewModel.h
//  TestApp
//
//  Created by Александр Смоленский on 06.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACCommand, RACSignal;
@protocol ViewModelServicesProtocol;

@interface LoginViewModel : NSObject

@property(strong, nonatomic)NSString *title;
@property(strong, nonatomic)NSString *login;
@property(strong, nonatomic)NSString *password;
@property(strong, nonatomic)RACCommand *executeApplicationsLoad;
@property(strong, nonatomic)RACSignal *errorSignals;

- (instancetype)initWithServices:(id<ViewModelServicesProtocol>)services;

@end
