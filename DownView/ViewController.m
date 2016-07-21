//
//  ViewController.m
//  DownView
//
//  Created by Teplot_03 on 16/7/21.
//  Copyright © 2016年 Teplot_03. All rights reserved.
//

#import "ViewController.h"
#import "MaskButtonView.h"

@interface ViewController ()

@property (nonatomic, strong) MaskButtonView *buttonView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下拉菜单" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    
    _buttonView = [MaskButtonView maskButtonViewWithTitleArray:@[@"第一个按钮",@"第二个按钮",@"第三个按钮"]];
    
    [self.view addSubview:_buttonView];
}

- (void)rightAction {
    _buttonView.hidden = !_buttonView.hidden;
}

@end
