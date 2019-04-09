//
//  Utf8Log.h
//  KBJDemos
//
//  Created by Juster on 2018/9/17.
//  Copyright © 2018年 Juster. All rights reserved.
//

#ifndef Utf8Log_h
#define Utf8Log_h

#define NSLog(FORMAT, ...) fprintf(stderr,"\n %s:%d   %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
// 这个方法更优美 NSLog((@"BBABFContentViewController %s %s [Line %d] " ),__FILE__, __PRETTY_FUNCTION__, __LINE__);
#endif /* Utf8Log_h */
