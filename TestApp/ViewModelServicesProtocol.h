//
//  ViewModelServicesProtocol.h
//  TestApp
//
//  Created by Александр Смоленский on 05.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArtinityLoadProtocol.h"

@protocol ViewModelServicesProtocol <NSObject>

- (void) pushViewModel:(id)viewModel;

- (id<ArtinityLoadProtocol>)getLoadService;

@end
