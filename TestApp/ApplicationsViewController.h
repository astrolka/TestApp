//
//  ApplicationsViewController.h
//  TestApp
//
//  Created by Александр Смоленский on 05.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ApplicationsViewModel;

@interface ApplicationsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (instancetype)initWithViewModel:(ApplicationsViewModel *)viewModel;

@end
