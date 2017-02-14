//
//  ViewModelServiceImpl.h
//  TestApp
//
//  Created by Александр Смоленский on 05.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModelServicesProtocol.h"

@class UINavigationController;

@interface ViewModelServiceImpl : NSObject <ViewModelServicesProtocol>

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;

@end
