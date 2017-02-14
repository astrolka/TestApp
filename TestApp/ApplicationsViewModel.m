//
//  ApplicationsViewModel.m
//  TestApp
//
//  Created by Александр Смоленский on 05.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import "ApplicationsViewModel.h"
#import "ViewModelServicesProtocol.h"
#import "ApplicationItemViewModel.h"

@implementation ApplicationsViewModel

- (instancetype)initWithModels:(NSArray *)models services:(id<ViewModelServicesProtocol>)services
{
    self = [super init];
    if (self) {
        self.title = @"Заявки";
        
        NSMutableArray *tempArr = [NSMutableArray array];
        
        for (id application in models) {
            ApplicationItemViewModel *viewModel = [[ApplicationItemViewModel alloc] initWithApplication:application
                                                                                               services:services];
            [tempArr addObject:viewModel];
        }
        
        _cellsViewModel = tempArr;
    }
    return self;
}

@end
