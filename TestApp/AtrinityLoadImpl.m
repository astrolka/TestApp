//
//  AtrinityLoadImpl.m
//  TestApp
//
//  Created by Александр Смоленский on 05.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import "AtrinityLoadImpl.h"
#import "AFNetworking.h"
#import "ReactiveObjC.h"
#import "AtrinityApplication.h"
#import "AtrinityApplicationInfo.h"

@interface AtrinityLoadImpl ()

@property(strong, nonatomic)AFHTTPSessionManager *sessionManager;

@end

static NSString *apiKey = @"e8e6a311d54985a067ece5a008da280a";

@implementation AtrinityLoadImpl

- (RACSignal *)signalFromApplicationRequestWithParameters:(NSDictionary *)parameters
                                                transform:(id (^)(id response))transformBlock {

    [self.sessionManager invalidateSessionCancelingTasks:YES];
    NSURL *url = [NSURL URLWithString:@"http://mobile.atrinity.ru/api"];
    self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [self.sessionManager POST:@"service"
                       parameters:parameters
                         progress:nil
                          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                              if ([responseObject isKindOfClass:NSDictionary.class] &&
                                   [responseObject objectForKey:@"error"]) {
                                  NSError *error = [NSError errorWithDomain:@"Error" code:1 userInfo:responseObject];
                                  [subscriber sendError:error];
                                  [subscriber sendCompleted];
                              } else {
                                  [subscriber sendNext:transformBlock(responseObject)];
                                  [subscriber sendCompleted];
                              }
                          }
                          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                              NSLog(@"%@", error.userInfo);
                              NSError *unknownError =
                              [NSError errorWithDomain:@"unknownError"
                                                  code:1
                                              userInfo:@{@"error" : @"Unknown error, please try again..."}];
                              [subscriber sendError:unknownError];
                              [subscriber sendCompleted];
                          }];
        
        return nil;
    }];
    
}


- (RACSignal *) getListOfApplicationsWithLogin:(NSString *)login password:(NSString *)password {
    
    NSDictionary *params = @{@"ApiKey"      : apiKey,
                             @"Login"       : login,
                             @"Password"    : password,
                             @"ObjectCode"  : @"300",
                             @"Action"      : @"GET_LIST",
                             @"Fields"      : @{@"FilterID" : @"3CD0E650-4B81-E511-A39A-1CC1DEAD694D"}};
    
    return [self signalFromApplicationRequestWithParameters:params
                                                  transform:^NSArray *(NSArray *response) {
                                                      
                                                      NSMutableArray *applications = [NSMutableArray array];
                                                      
                                                      for (NSDictionary *object in response) {
                                                          AtrinityApplication *application = [[AtrinityApplication alloc] initWithDictionary:object];
                                                          application.login = login;
                                                          application.password = password;
                                                          [applications addObject:application];
                                                      }
                                                      
                                                      return applications;
                                                  }];
}

- (RACSignal *) getApplicationInfoWithLogin:(NSString *)login password:(NSString *)password forRequestId:(NSString *)requestId {
    
    NSDictionary *params = @{@"ApiKey"      : apiKey,
                             @"Login"       : login,
                             @"Password"    : password,
                             @"ObjectCode"  : @"300",
                             @"Action"      : @"GET_INFO",
                             @"Fields"      : @{@"RequestID" : requestId}};
    
    return [self signalFromApplicationRequestWithParameters:params
                  transform:^AtrinityApplicationInfo *(NSDictionary *response) {
                      
                      AtrinityApplicationInfo *appInfo = [[AtrinityApplicationInfo alloc] initWithDictionary:response];
                      return appInfo;
                      
                  }];
}

@end
