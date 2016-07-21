//
//  MaskButtonView.m
//  windowDemo
//
//  Created by Teplot_03 on 16/6/20.
//  Copyright © 2016年 Teplot_03. All rights reserved.
//

#import "MaskButtonView.h"
#import "ButtonView.h"

@interface MaskButtonView ()<ButtonViewDelegate>
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) ButtonView *btnView;

@end

@implementation MaskButtonView

+ (instancetype)maskButtonViewWithTitleArray:(NSArray *)titleArray {
    MaskButtonView *maskButtonView = [[MaskButtonView alloc] initWithTitleArray:titleArray];
    maskButtonView.hidden = YES;
    return maskButtonView;
}

- (void)show {
    self.hidden = NO;
}

- (void)hiden {
    self.hidden = YES;
}

- (instancetype)initWithTitleArray:(NSArray *)titleArray {
    self.titleArray = titleArray;
    self = [super init];
    if (self) {
        [self setup];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setup {
    self.frame = [[UIScreen mainScreen] bounds];
    _btnView = [ButtonView buttonViewWithTitleArray:self.titleArray];
    _btnView.hidden = NO;//如果要是单独使用ButtonView的话必须开始市隐藏的，所以需要在这里➕一步隐藏操作
    _btnView.delegate = self;
    [self addSubview:_btnView];

    //给自己一个手势，可以点击隐藏
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBlank)];
    [self addGestureRecognizer:tap];
}


- (void)tapBlank {
    self.hidden = YES;
}

- (void)updateTitle:(NSString *)title index:(NSInteger)index {
    [_btnView updateTitle:title index:index];
}

#pragma mark - buttonView delagate
- (void)buttonView:(ButtonView *)buttonView clickIndex:(NSInteger)index {
    [self hiden];
    if ([self.delegate respondsToSelector:@selector(maskButtonView:clickIndex:)]) {
        [self.delegate maskButtonView:self clickIndex:index];
    }
    
}

@end
