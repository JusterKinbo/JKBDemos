//
//  NoramlTitleCollectionViewCell.m
//  KBJDemos
//
//  Created by Juster on 2018/10/24.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "NoramlTitleCollectionViewCell.h"

@interface NoramlTitleCollectionViewCell()

@property (nonatomic,strong) UILabel * text;
@property (nonatomic,strong) UIImageView * imgV;

@end

@implementation NoramlTitleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor blueColor];
        //测试这个方法会被调用几次
        NSLog(@"NoramlTitleCollectionViewCell initWithFrame:%@",NSStringFromCGRect(frame));
        
        _text = [[UILabel alloc]init];
        _imgV = [[UIImageView alloc]init];
        _btnDelete = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnDelete setImage:[UIImage imageNamed:@"delete_x"] forState:UIControlStateNormal];
        [_btnDelete setImage:[UIImage imageNamed:@"delete_x"] forState:UIControlStateHighlighted];
        
        _text.numberOfLines = 1;
    }
    return self;
}

- (void)setModel:(NormalColltionViewCellModel *)model
{
    _model = model;
    if ([_model.title length]>8) {
        _model.title = [NSString stringWithFormat:@"%@...",[_model.title substringToIndex:8]];
    }
}

- (void)setupUI
{
    [self addSubview:_text];
    [self addSubview:_imgV];
    [self addSubview:_btnDelete];
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
        make.left.equalTo(self->_text.mas_right).mas_offset(3);
        make.width.and.height.mas_equalTo(20);
    }];
    [_btnDelete mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.and.width.mas_equalTo(20);
    }];
    [self layoutIfNeeded];
}
//这个必须重写
- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    NSLog(@"NoramlTitleCollectionViewCell   preferredLayoutAttributesFittingAttributes");
    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    NSLog(@"preferredLayoutAttributesFittingAttributes title is %@",self.model.title);
    CGRect text_frame = [self.model.title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, Height_NormalColltionViewCell) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:[NSDictionary dictionaryWithObjectsAndKeys:_text.font,NSFontAttributeName, nil] context:nil];
    
    CGRect attFrame = attributes.frame;
    //左右间距+img大小
    attributes.frame = CGRectMake(attFrame.origin.x, attFrame.origin.y, text_frame.size.width + 17+17+3+20, Height_NormalColltionViewCell);
    return attributes;
}

@end
