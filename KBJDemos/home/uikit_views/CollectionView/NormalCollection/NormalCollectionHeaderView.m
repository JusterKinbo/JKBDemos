//
//  NormalCollectionHeaderView.m
//  KBJDemos
//
//  Created by Juster on 2018/10/24.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "NormalCollectionHeaderView.h"

@interface NormalCollectionHeaderView()

@property (nonatomic,strong) UILabel * text;
@property (nonatomic,strong) UIImageView * imgV;

@end

@implementation NormalCollectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor greenColor];
        //测试这个方法会被调用几次
        NSLog(@"NormalCollectionHeaderView initWithFrame:%@",NSStringFromCGRect(frame));
        
        _text = [[UILabel alloc]init];
        _imgV = [[UIImageView alloc]init];
        [self addSubview:_text];
        [self addSubview:_imgV];
    }
    return self;
}

- (void)setupUI
{
    _text.text = self.model.title;
    [_text sizeToFit];
    [_text mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(17);
        make.width.mas_equalTo(self->_text.frame.size.width);
    }];
    _imgV.image = [UIImage imageNamed:self.model.imgName];
    [_imgV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-17);
        make.width.and.height.mas_equalTo(20);
    }];
    
    [self layoutIfNeeded];
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
//    NSLog(@"NormalCollectionHeaderView   preferredLayoutAttributesFittingAttributes");
    return [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
}
@end
