//
//  BBAHisTagViewFactory.m
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/25.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "BBAHisTagViewFactory.h"
#import "BBASuggestionTagView.h"
#import "BBAHisSugTagView.h"
#import "BBASuggestDataItem.h"

@implementation BBAHisTagViewFactory
{
    NSMutableArray<BBAHisSugTagView *> * _hisMutArrs;
    int _hisMutUsed;
    NSMutableArray<BBASuggestionTagView *> * _sugMutArrs;
    int _sugMutUsed;
}

static BBAHisTagViewFactory * _instance = nil;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;//触发在init前，所以会保证只有一个对象，后面使用self就是_instance（因为内存区域在这里）
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        static dispatch_once_t onceToken;
        
        dispatch_once(&onceToken, ^{
            _instance->_hisMutArrs = [[ NSMutableArray<BBAHisSugTagView *> alloc]initWithCapacity:9];
            _instance->_hisMutUsed = 0;
            _instance->_sugMutArrs = [[ NSMutableArray<BBASuggestionTagView *> alloc]initWithCapacity:6];
            _instance->_sugMutUsed = 0;
        });
    }
    return self;
}

+ (instancetype)sharedBBAHisTagViewFactory
{
        static dispatch_once_t onceToken;
        
        dispatch_once(&onceToken, ^{
            if (_instance == nil) {
                _instance = [[BBAHisTagViewFactory alloc]init];
            }
        });
        return _instance;
}


- (id)copy
{
    return _instance;
}

- (id)mutableCopy
{
    return _instance;
}

- (BBAHisSugTagView *)produceHistoryTagViewWithBBASuggestDataItem:(BBASuggestDataItem *)item
{
    BBAHisSugTagView * tagView ;
    NSLog(@"his at:%d current count is %ld *****",_instance->_hisMutUsed,[_instance->_hisMutArrs count]);
    
        if(_instance->_hisMutUsed < [_instance->_hisMutArrs count])
        {
            NSLog(@"his hit at: %d before count is %ld",_instance->_hisMutUsed+1,[_instance->_hisMutArrs count]);
            tagView = _instance->_hisMutArrs[_instance->_hisMutUsed];
            [tagView resetFrameWithItem:item];
            NSLog(@"his hit at: %d after count is %ld",_instance->_hisMutUsed+1,[_instance->_hisMutArrs count]);
        }else{
            NSLog(@"his unHit at: %d before count is %ld *****",_instance->_hisMutUsed+1,[_instance->_hisMutArrs count]);
            tagView = [[BBAHisSugTagView alloc]initWithBBASuggestDataItem:item];
            [_instance->_hisMutArrs addObject:tagView];
            NSLog(@"his unHit at: %d after count is %ld *****",_instance->_hisMutUsed+1,[_instance->_hisMutArrs count]);
        }
        _instance->_hisMutUsed++;
    
    
    return tagView;
}
- (BBAHisSugTagView *)produceSuggestionTagViewWithBBASuggestDataItem:(BBASuggestDataItem *)item
{
    BBASuggestionTagView * tagView;
    NSLog(@"sug at:%d current count is %ld *****",_instance->_sugMutUsed,[_instance->_sugMutArrs count]);
   
        if(_instance->_sugMutUsed<[_instance->_sugMutArrs count])
        {
            NSLog(@"sug hit at: %d before count is %ld",_instance->_sugMutUsed+1,[_instance->_sugMutArrs count]);
            tagView = _instance->_sugMutArrs[_instance->_sugMutUsed];
            [tagView resetFrameWithItem:item];
            NSLog(@"sug hit at: %d after count is %ld",_instance->_sugMutUsed+1,[_instance->_sugMutArrs count]);
        }else
        {
            NSLog(@"sug unHit at: %d before count is %ld",_instance->_sugMutUsed+1,[_instance->_sugMutArrs count]);
            tagView = [[BBASuggestionTagView alloc]initWithBBASuggestDataItem:item];
            [_instance->_sugMutArrs addObject:tagView];
            NSLog(@"sug unHit at: %d before count is %ld",_instance->_sugMutUsed+1,[_instance->_sugMutArrs count]);
        }
        _instance->_sugMutUsed++;
    
    return tagView;
}

- (void)resetHisUsedCount
{
    _instance->_hisMutUsed = 0;
}

- (void)resetSugUsedCount
{
    _instance->_sugMutUsed = 0;
}

@end
