//
//  AtrinityApplicationInfo.m
//  TestApp
//
//  Created by Александр Смоленский on 11.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import "AtrinityApplicationInfo.h"

@implementation AtrinityApplicationInfo

- (instancetype)initWithDictionary:(NSDictionary *)response
{
    self = [super init];
    if (self) {
        self.statusText = [response valueForKeyPath:@"Request.StatusText"];
        self.fullName = [response valueForKeyPath:@"Request.CreatedByFullName"];
        self.applicationDescription = [response valueForKeyPath:@"Request.Description"];
        if ([[response valueForKeyPath:@"Request.SolutionDescription"] isKindOfClass:NSString.class]) {
            self.solutionDescription = [response valueForKeyPath:@"Request.SolutionDescription"];
        } else {
            self.solutionDescription = @"";
        }
        self.createdAt = [response valueForKeyPath:@"Request.CreatedAt"];
        self.recoveryTime = [response valueForKeyPath:@"Request.SLARecoveryTime"];
        self.actualRecoveryTime = [response valueForKeyPath:@"Request.ActualRecoveryTime"];

    }
    return self;
}

@end
