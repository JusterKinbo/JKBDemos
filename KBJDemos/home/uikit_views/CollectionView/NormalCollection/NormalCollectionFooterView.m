
//
//  NormalCollectionFooterView.m
//  KBJDemos
//
//  Created by Juster on 2018/10/24.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "NormalCollectionFooterView.h"


@interface NormalCollectionFooterView()

@property (nonatomic,strong) UILabel * text;

@end

@implementation NormalCollectionFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor greenColor];
        //测试这个方法会被调用几次
        NSLog(@"NormalCollectionFooterView initWithFrame:%@",NSStringFromCGRect(frame));
        
        _text = [[UILabel alloc]init];
    }
    return self;
}

- (void)setupUI
{
    [self addSubview:_text];
    _text.text = self.model.title;
    [_text sizeToFit];
    [_text mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(17);
        make.width.mas_equalTo(self->_text.frame.size.width);
    }];

    
    [self layoutIfNeeded];
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
//    NSLog(@"NormalCollectionFooterView   preferredLayoutAttributesFittingAttributes");
    return [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
}
@end
