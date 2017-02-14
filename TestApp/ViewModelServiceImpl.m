//
//  ViewModelServiceImpl.m
//  TestApp
//
//  Created by Александр Смоленский on 05.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import "ViewModelServiceImpl.h"
#import <UIKit/UIKit.h>
#import "AtrinityLoadImpl.h"
#import "ApplicationsViewModel.h"
#import "ApplicationsViewController.h"
#import "ApplicationDetailInfoViewModel.h"
#import "ApplicationDetailInfo.h"

@interface ViewModelServiceImpl ()

@property (strong, nonatomic)AtrinityLoadImpl *loadService;
@property (weak, nonatomic)UINavigationController *navigationController;

@end

@implementation ViewModelServiceImpl

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
{
    self = [super init];
    if (self) {
        _navigationController = navigationController;
        _loadService = [[AtrinityLoadImpl alloc] init];
    }
    return self;
}

- (id<ArtinityLoadProtocol>)getLoadService {
    return self.loadService;
}

- (void) pushViewModel:(id)viewModel {
    
    if ([viewModel isKindOfClass:ApplicationsViewModel.class]) {
        ApplicationsViewController *vc = [[ApplicationsViewController alloc] initWithViewModel:viewModel];
        [self.navigationController pushViewController:vc animated:YES];
    } else if ([viewModel isKindOfClass:ApplicationDetailInfoViewModel.class]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ApplicationDetailInfo" bundle:nil];
        ApplicationDetailInfo *vc = [storyboard instantiateViewControllerWithIdentifier:@"ApplicationDetailInfo"];
        vc.viewModel = viewModel;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
