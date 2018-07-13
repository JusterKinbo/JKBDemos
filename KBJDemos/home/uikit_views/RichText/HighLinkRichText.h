//
//  HighLinkRichText.h
//  KBJDemos
//
//  Created by Juster on 2018/7/13.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HighLinkRichTextDelegate <NSObject>

@optional

/**
 点击text的回调
 @param text 点击的文字
 @param href 对应的<a>xx</a>内容
 */
- (void) clickOnText:(NSString * )text href:(NSString*) href;

@end

/**
 HighLinkRichText 继承自UITextView
 
 提供的功能是根据<a>xx</a>动态识别出xx并支持点击
 
 如果外部需要根据点击获取某些事件，需要实现代理和clickOnText方法
 
 *支持多个<a>xx</a>格式*
 */
@interface HighLinkRichText : UITextView

@property(nonatomic,weak) id <HighLinkRichTextDelegate> delegate;

- (instancetype) initWithFrame:(CGRect)frame text:(NSString*)text;

- (instancetype) initWithText:(NSString *)text;

@end
