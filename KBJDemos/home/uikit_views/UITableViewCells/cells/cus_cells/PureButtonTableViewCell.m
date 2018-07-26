//
//  PureButtonTableViewCell.m
//  KBJDemos
//
//  Created by Juster on 2018/7/26.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "PureButtonTableViewCell.h"

@interface PureButtonTableViewCell()
{
    UIButton * _button;
}
@end

@implementation PureButtonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier
{
    self = [super initWithStyle:style reuseIdentifier:identifier];
    if(self)
    {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.layer.borderColor = [UIColor grayColor].CGColor;
        _button.layer.borderWidth = 1;
        _button.layer.cornerRadius = 3;
        [_button addTarget:self action:@selector(down:) forControlEvents:UIControlEventTouchDown];
        [_button addTarget:self action:@selector(inside:) forControlEvents:UIControlEventTouchUpInside];
        
        [_button setTitle:@"AL、frame必须二选一，因为heightForAtIndexPath" forState:UIControlStateNormal];
//        self.textLabel.text = @"AL、frame必须二选一，因为heightForAtIndexPath";
        [self.contentView addSubview:_button];
    }
    return self;
}
- (void)doSelection
{
    NSLog(@"pure button tableview cell doselection");
}

-(void)layoutSubviews
{
    [super layoutSubviews];
     self.contentView.frame = _button.frame;
}
- (void)updateUI
{
    
    _button.frame = CGRectMake(0, 0, ScreenWith, 44);
    
    self.cellHeight = CGRectGetMaxY(_button.bounds);//frame自定义用，需要结合heightForRow
}

- (void)down:(UIButton *)sender{
    NSLog(@"pure button tableview cell down");
}

- (void)inside:(UIButton *)sender{
    NSLog(@"pure button tableview cell inside");
}

@end
