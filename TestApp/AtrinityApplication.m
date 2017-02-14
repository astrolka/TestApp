//
//  AtrinityApplication.m
//  TestApp
//
//  Created by Александр Смоленский on 05.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import "AtrinityApplication.h"

@interface AtrinityApplication ()

@property(strong, nonatomic)NSDictionary *response;

@end

@implementation AtrinityApplication

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _response   = dict;
        [self intialize];
    }
    return self;
}

-(void)intialize {
    
    self.date               = [self.response objectForKey:@"CreatedAt"];
    self.name               = [self.response objectForKey:@"Name"];
    self.priority           = [self.response objectForKey:@"Priority"];
    self.requestID          = [self.response objectForKey:@"RequestID"];
    self.requestNumber      = [self.response objectForKey:@"RequestNumber"];
    self.status             = [self.response objectForKey:@"Status"];
    self.statusDisplayName  = [self.response objectForKey:@"StatusDisplayName"];
    
}

@end
