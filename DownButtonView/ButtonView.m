//
//  ButtonView.m
//  下拉菜单
//
//  Created by Teplot_03 on 16/6/20.
//  Copyright © 2016年 Teplot_03. All rights reserved.
//

#import "ButtonView.h"

#define KScreenSize [[UIScreen mainScreen] bounds].size

@interface ButtonView ()
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation ButtonView

#pragma mark - public method
+ (instancetype)buttonViewWithTitleArray:(NSArray *)titleArray {

    ButtonView *btnV = [[ButtonView alloc] initWithTitleArray:titleArray];
    btnV.hidden = YES;
    return btnV;
}

- (void)show {
    self.hidden = NO;
}

- (void)dissmiss {
    self.hidden = YES;
}

- (instancetype)initWithTitleArray:(NSArray *)titleArray {
    self.titleArray = titleArray;
    self = [super init];
    if (self) {
        [self setup];
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)setup {
    CGFloat height = KScreenSize.width/9;
    CGFloat width = KScreenSize.width/3;
    CGFloat gap = 0.5;
    //根据titleArray创建button
    for (int i = 0; i<_titleArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i+10;//防止和其它的view冲突（默认都为0所以不能用0）
        
        [btn setBackgroundColor:[UIColor blackColor]];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];
        [self addSubview:btn];
        btn.frame = CGRectMake(0, (height+gap)*i+gap, width, height);
        if (i == _titleArray.count - 1) {
            self.frame = CGRectMake(KScreenSize.width-width, 20+44, KScreenSize.width, _titleArray.count*(height+gap));
        }
    }
    
}

- (void)btnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(buttonView:clickIndex:)]) {
        [self.delegate buttonView:self clickIndex:sender.tag-10];
    }
}

- (void)updateTitle:(NSString *)title index:(NSInteger)index {
    UIButton *btn = [self viewWithTag:index+10];
    [btn setTitle:title forState:UIControlStateNormal];
}

@end
