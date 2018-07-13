//
//  BBAHisSugTagViewEventsHandler.h
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/25.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBAHisSugEventHandlerProtocol.h"

__attribute__((objc_subclassing_restricted))
@interface BBAHisSugEventsHandler : NSObject <BBAHisSugEventHandlerProtocol>

+ (instancetype)sharedBBAHisSugEventsHandler;

@end
