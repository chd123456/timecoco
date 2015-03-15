//
//  TCEditorVC.m
//  timecoco
//
//  Created by Xie Hong on 3/15/15.
//  Copyright (c) 2015 timecoco. All rights reserved.
//

#import "TCEditorVC.h"

@interface TCEditorVC ()

@property (nonatomic, weak) UIView *lineView;
@property (nonatomic, weak) UITextView *textView;

@end

@implementation TCEditorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = TC_BACK_COLOR;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem createBarButtonItemWithImage:[UIImage imageNamed:@"button_back"] Target:self Selector:@selector(backAction:)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem createBarButtonItemWithImages:@[[UIImage imageNamed:@"button_confirm"], [UIImage imageNamed:@"button_confirm_disable"]] Target:self Selector:@selector(confirmAction:)];
    [self setUpUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.textView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation action

- (void)backAction:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)confirmAction:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UI

- (void)setUpUI {
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.navigationController.navigationBar.frame) + 20, self.view.frame.size.width - 40, self.view.bounds.size.height / 3)];
    lineView.backgroundColor = TC_WHITE_COLOR;
    lineView.layer.borderColor = TC_RED_COLOR.CGColor;
    lineView.layer.borderWidth = 1.0f;
    [self.view addSubview:lineView];
    self.lineView = lineView;
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(5 + 20, 5 + CGRectGetMaxY(self.navigationController.navigationBar.frame) + 20, self.lineView.frame.size.width - 10, self.lineView.frame.size.height - 10)];
    textView.backgroundColor = TC_WHITE_COLOR;
    textView.textColor = TC_DARK_GRAY_COLOR;
    textView.font = [UIFont systemFontOfSize:16.0f];
    [self.view addSubview:textView];
    self.textView = textView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
