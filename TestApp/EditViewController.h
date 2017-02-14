//
//  EditViewController.h
//  TestApp
//
//  Created by Александр Смоленский on 11.12.16.
//  Copyright © 2016 Александр Смоленский. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ApplicationDetailInfoViewModel;

@interface EditViewController : UIViewController

@property(strong, nonatomic)NSString *oldText;
@property(weak, nonatomic)ApplicationDetailInfoViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
