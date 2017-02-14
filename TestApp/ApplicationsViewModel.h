//
//  ApplicationsViewModel.h
//  TestApp
//
//  Created by Александр Смоленский on 05.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ViewModelServicesProtocol;

@interface ApplicationsViewModel : NSObject

@property(strong, nonatomic)NSArray     *cellsViewModel;
@property(strong, nonatomic)NSString    *title;

- (instancetype)initWithModels:(NSArray *)models services:(id<ViewModelServicesProtocol>)services;

@end
