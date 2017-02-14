//
//  ArtinityLoadProtocol.h
//  TestApp
//
//  Created by Александр Смоленский on 05.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;

@protocol ArtinityLoadProtocol <NSObject>

-(RACSignal *) getListOfApplicationsWithLogin:(NSString *)login password:(NSString *)password;
- (RACSignal *) getApplicationInfoWithLogin:(NSString *)login password:(NSString *)password forRequestId:(NSString *)requestId;

@end
