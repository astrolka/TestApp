//
//  ApplicationsViewController.m
//  TestApp
//
//  Created by Александр Смоленский on 05.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import "ApplicationsViewController.h"
#import "ApplicationsViewModel.h"
#import "ApplicationItemCell.h"
#import "ReactiveObjC.h"
#import "ApplicationItemViewModel.h"

@interface ApplicationsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic)ApplicationsViewModel *viewModel;

@end

@implementation ApplicationsViewController {
    NSString *cellIdentifier;
}

- (instancetype)initWithViewModel:(ApplicationsViewModel *)viewModel
{
    self = [super init];
    if (self) {
        _viewModel = viewModel;
        cellIdentifier = NSStringFromClass(ApplicationItemCell.class);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self bindViewModel];
    
}

- (void)bindViewModel {
    [self.tableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellReuseIdentifier:cellIdentifier];
    
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = self.viewModel.title;
    
    self.tableView.estimatedRowHeight = 50;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Выход" style:UIBarButtonItemStylePlain target:self action:@selector(logout:)];
    
    [self.navigationItem setLeftBarButtonItem:logoutBtn];
    
}

#pragma mark - Navigation

- (void)logout:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.navigationController.navigationBar.hidden = YES;
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.cellsViewModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ApplicationItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    [cell bindViewModel:self.viewModel.cellsViewModel[indexPath.row]];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ApplicationItemViewModel *itemViewModel = self.viewModel.cellsViewModel[indexPath.row];
    
    [itemViewModel.executeLoadInfo execute:nil];
}


@end
