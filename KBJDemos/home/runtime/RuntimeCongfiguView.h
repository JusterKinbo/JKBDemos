//
//  RuntimeCongfiguView.h
//  KBJDemos
//
//  Created by Juster on 2018/9/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RuntimeCongfiguView : UIView

- (instancetype)initWithCongfiguredDictionary:(NSDictionary *)dict;
- (instancetype)initWithCongfiguredArray:(NSArray *)configArr;
- (instancetype)initWithLayoutArray:(NSArray *)layoutConfigArr;
@end
