//
//  ButtonView.h
//  下拉菜单
//
//  Created by Teplot_03 on 16/6/20.
//  Copyright © 2016年 Teplot_03. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ButtonView;

@protocol ButtonViewDelegate <NSObject>

- (void)buttonView:(ButtonView *)buttonView clickIndex:(NSInteger)index;

@end

@interface ButtonView : UIView
@property (nonatomic, weak) id<ButtonViewDelegate> delegate;

+ (instancetype)buttonViewWithTitleArray:(NSArray *)titleArray;
- (void)updateTitle:(NSString *)title index:(NSInteger)index;

- (void)show;
- (void)dissmiss;

@end
