//
//  LoginViewModel.m
//  TestApp
//
//  Created by Александр Смоленский on 06.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import "LoginViewModel.h"
#import "ViewModelServicesProtocol.h"
#import "ReactiveObjC.h"
#import "ApplicationsViewModel.h"

@interface LoginViewModel ()

@property(weak, nonatomic)id<ViewModelServicesProtocol> services;

@end

@implementation LoginViewModel

- (instancetype)initWithServices:(id<ViewModelServicesProtocol>)services
{
    self = [super init];
    if (self) {
        _services = services;
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.title = @"Вход в систему";
    
    RACSignal *credentialsSignals =
    [RACSignal merge:@[RACObserve(self, login), RACObserve(self, password)]];
    
    RACSignal *validLoadSignal =
    [credentialsSignals map:^id _Nullable(id  _Nullable x) {
        return @(self.login.length > 3 && self.password.length > 3);
    }];
    
    self.executeApplicationsLoad =
     [[RACCommand alloc] initWithEnabled:validLoadSignal
                             signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
                                 return [self loadApplications];
                             }];
    
    self.errorSignals = self.executeApplicationsLoad.errors;
}

- (RACSignal *)loadApplications {
    return [[[self.services getLoadService]
            getListOfApplicationsWithLogin:self.login password:self.password]
            doNext:^(NSArray *applicationModels) {
                ApplicationsViewModel *resultViewModel = [[ApplicationsViewModel alloc]  initWithModels:applicationModels
                                                                                               services:self.services];
                
                [self.services pushViewModel:resultViewModel];
            }];
}

@end
