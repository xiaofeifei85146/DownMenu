//
//  MaskButtonView.h
//  windowDemo
//
//  Created by Teplot_03 on 16/6/20.
//  Copyright © 2016年 Teplot_03. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MaskButtonView;

@protocol MaskButtonViewDelegate <NSObject>

- (void)maskButtonView:(MaskButtonView *)maskButtonView clickIndex:(NSInteger)index;

@end

@interface MaskButtonView : UIView
@property (nonatomic, weak) id<MaskButtonViewDelegate> delegate;

+ (instancetype)maskButtonViewWithTitleArray:(NSArray *)titleArray;

/**
 *  改变title的文字
 */
- (void)updateTitle:(NSString *)title index:(NSInteger)index;

- (void)show;
- (void)hiden;

@end
