//
//  CoveredVCViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/10/25.
//  Copyright © 2018 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CoverdVCAViewController.h"
#import "ConverdVCBViewController.h"



/**
 wiew will appear
 will will disapper
 针对的是一个vc作为主视图而讲，如果是VC里面子VC，那么在进行hidden以及obscure时不会调用
 但是remove的时候会调用will dis
 单纯移除vc不移除view也不会调用disappear
 相对的加入childVC的view会出现wiewWillAppear
 */
@interface CoveredVCViewController : UIViewController

@property (nonatomic,strong) CoverdVCAViewController * childA;
@property (nonatomic,strong) ConverdVCBViewController * childB;

@end


