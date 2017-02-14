//
//  AtrinityApplication.h
//  TestApp
//
//  Created by Александр Смоленский on 05.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AtrinityApplication : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@property(strong, nonatomic)NSString *date;
@property(strong, nonatomic)NSString *name;
@property(strong, nonatomic)NSNumber *priority;
@property(strong, nonatomic)NSString *requestID;
@property(strong, nonatomic)NSString *requestNumber;
@property(strong, nonatomic)NSNumber *status;
@property(strong, nonatomic)NSString *statusDisplayName;

@property(strong, nonatomic)NSString *login;
@property(strong, nonatomic)NSString *password;

@end
