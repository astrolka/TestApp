//
//  ApplicationViewModel.m
//  TestApp
//
//  Created by Александр Смоленский on 05.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import "ApplicationItemViewModel.h"
#import "AtrinityApplication.h"
#import "ViewModelServicesProtocol.h"
#import "ReactiveObjC.h"
#import "AtrinityApplicationInfo.h"
//#import "DetailInfoViewModel.m"
#import "ApplicationDetailInfoViewModel.h"

@interface ApplicationItemViewModel ()

@property(strong, nonatomic)AtrinityApplication *application;
@property(strong, nonatomic)id<ViewModelServicesProtocol> services;

@end

@implementation ApplicationItemViewModel

- (instancetype)initWithApplication:(AtrinityApplication *)application services:(id<ViewModelServicesProtocol>)services
{
    self = [super init];
    if (self) {
        _application    = application;
        _services       = services;
        
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.requestNumber  = self.application.requestNumber;
    self.date           = self.application.date;
    self.name           = self.application.name;
    
    self.executeLoadInfo =
    [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [self loadApplicationInfo];
    }];
}

- (RACSignal *)loadApplicationInfo {
    return [[[self.services getLoadService] getApplicationInfoWithLogin:self.application.login
                                                               password:self.application.password
                                                           forRequestId:self.application.requestID]
            doNext:^(AtrinityApplicationInfo *info) {
                ApplicationDetailInfoViewModel *viewModel = [[ApplicationDetailInfoViewModel alloc] initWithModel:info];
                viewModel.title = self.requestNumber;
                [self.services pushViewModel:viewModel];
            }];
}

@end
