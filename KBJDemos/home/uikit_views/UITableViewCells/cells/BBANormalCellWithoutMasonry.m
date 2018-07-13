//
//  BBANormalCellWithoutMasonry.m
//  KBJDemos
//
//  Created by Juster on 2018/7/13.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "BBANormalCellWithoutMasonry.h"

@implementation BBANormalCellWithoutMasonry

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier
{
    self = [super initWithStyle:style reuseIdentifier:identifier];
    if(self)
    {
        self.imageView.image = [UIImage imageNamed:@"games"];
        self.detailTextLabel.text = @"detailTextLabel";
        self.textLabel.text = @"textLabel";
    }
    return self;
}

@end
