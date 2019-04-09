//
//  HomeRootViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/6/30.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "HomeRootViewController.h"
#import "TransitonAnimationViewController.h"
#import "HisSugViewController.h"
#import "MarcosViewController.h"
#import "UITableViewCustomCellsController.h"
#import "RichTextViewController.h"
#import "PrivateAPIViewController.h"
#import "ModuleCompileViewController.h"
#import "Gesture2TouchEventsViewController.h"


@interface HomeRootViewController ()<UITableViewDataSource,UITableViewDelegate>
{
        NSArray * _vcs;//实例变量
}
@property (nonatomic,strong)UITableView *table;//私有属性
@end

@implementation HomeRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    //添加一个tableview
    _table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWith,ScreenHeight) style:UITableViewStyleGrouped];
    _table.dataSource=self;
    _table.delegate=self;
//    _table.allowsMultipleSelection = YES;//非编辑模式下也可以支持多选
    _vcs=[self getSectionAndRows];
    _table.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];//不显示底下的空list
    [self.view addSubview:_table];
    
//    [[CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkAction:)] addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
//    @try {
//        id x = [[HomeRootViewController alloc] init];
//        NSData * d = [x valueForKey:@"xfyefjei"];
//        NSLog(@"valueForKeyxfyefjei %@",d);
//    } @catch (NSException *exception) {
//         NSLog(@"catched");
//    } @finally {
//        
//    }
    
    
}

- (void)displayLinkAction:(CADisplayLink *)link {
    static NSTimeInterval lastTime = 0;
    static int frameCount = 0;
    if (lastTime == 0) { lastTime = link.timestamp; return; }
    frameCount++; // 累计帧数
    NSTimeInterval passTime = link.timestamp - lastTime;// 累计时间
    if (passTime > 1) { // 1秒左右获取一次帧数
        int fps = frameCount / passTime; // 帧数 = 总帧数 / 时间
        lastTime = link.timestamp; // 重置
        frameCount = 0; // 重置
        NSLog(@"%d", fps);
    }
    
}

- (NSArray *)getSectionAndRows
{
    NSArray * animations=@[@{@"title":@"Transition animation",@"class":@"TransitonAnimationViewController"}];
        NSArray * views=@[@{@"title":@"half presented vc",@"class":@"Present2HalfTransientViewController"},
                          @{@"title":@"tableview",@"class":@"CustomeTableViewViewController"},
                          @{@"title":@"casecade picker view",@"class":@"CaseCadePickerViewController"},
                          @{@"title":@"congfigured view",@"class":@"ConfiguredViewViewController"},
                          @{@"title":@"Hissug",@"class":@"HisSugViewController"},
                          @{@"title":@"custom cells",@"class":@"UITableViewCustomCellsController"},
                          @{@"title":@"coverd vc",@"class":@"CoveredVCViewController"},
                          @{@"title":@"decoration view -> collection vc",@"class":@"Decoration_CollectionViewController"},
                          @{@"title":@"normal -> collection vc",@"class":@"NormalCollectionViewController"},
                          @{@"title":@"rich effect -> tcollection vc",@"class":@"RichCollectionViewViewController"},
                          @{@"title":@"rich text",@"class":@"RichTextViewController"},];
        NSArray * marcos=@[@{@"title":@"Marcos",@"class":@"MarcosViewController"}];
        NSArray * privateApis=@[@{@"title":@"which app is installed",@"class":@"PrivateAPIViewController"}];
        NSArray * modules=@[@{@"title":@"module files",@"class":@"ModuleCompileViewController"}];
        NSArray * xcode=@[@{@"title":@"xcode template",@"class":@"XcodeTemplateViewController"},
                          @{@"title":@"code snippet",@"class":@"CodeSnippetViewController"}];
        NSArray * runtime=@[@{@"title":@"runtime",@"class":@"RuntimeViewController"},
                            @{@"title":@"js patch",@"class":@"RuntimeJS2OCFeatureViewController"}];
        NSArray * gestures=@[@{@"title":@"gesture",@"class":@"Gesture2TouchEventsViewController"}];

        //vcs 分组容器
        NSArray * container=@[
                              @{@"sectionTitle":@"Animations",@"sectionData":animations},
                              @{@"sectionTitle":@"Gestures",@"sectionData":gestures},
                              @{@"sectionTitle":@"UIKit--Views",@"sectionData":views},
                              @{@"sectionTitle":@"Tools",@"sectionData":marcos},
                              @{@"sectionTitle":@"private api",@"sectionData":privateApis},
                              @{@"sectionTitle":@"modules",@"sectionData":modules},
                              @{@"sectionTitle":@"xcode",@"sectionData":xcode},
                              @{@"sectionTitle":@"runtime",@"sectionData":runtime},
                              ];
    
      
        return [container copy];
}

#pragma TableView DataSourceDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        return ((NSArray *)[[_vcs objectAtIndex:section] objectForKey:@"sectionData"]).count;
    }
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
    {
        return _vcs.count;
    }
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        
        
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:CellIdentifier];
            
        }
        NSString* labelText= [[((NSArray *)[[_vcs objectAtIndex:indexPath.section] objectForKey:@"sectionData"]) objectAtIndex:indexPath.row] objectForKey:@"title"];
        [cell.textLabel setText:labelText];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
    {
        return [[_vcs objectAtIndex:section] objectForKey:@"sectionTitle"];
    }
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return @[@"Ani",@"GE",@"UI",@"Tool",@"Mod",@"XC",@"RT"];
}

#pragma TableView Delegata
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
        
        
        NSString* classText= [[((NSArray *)[[_vcs objectAtIndex:indexPath.section] objectForKey:@"sectionData"]) objectAtIndex:indexPath.row] objectForKey:@"class"];
        Class vc=NSClassFromString(classText);
        UIViewController * vcc=[[vc alloc]init];
        [self.navigationController pushViewController:vcc animated:YES];
        
        /*
         NSTimeZone *systemZone = [NSTimeZone systemTimeZone];
         NSLog(@"系统时区: %@",systemZone);
         // 本地时区可以被修改，而系统时区不能修改。
         //        [NSTimeZone setDefaultTimeZone:[[NSTimeZone alloc] initWithName:@"America/Chicago"]];
         NSTimeZone *localZone = [NSTimeZone localTimeZone];
         NSLog(@"本地时区: %@",localZone);
         NSTimeZone *defaultZone = [NSTimeZone defaultTimeZone];
         NSLog(@"默认时区: %@",defaultZone);
         NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone] ;///获取当前时区信息
         NSLog(@"当前时区: %@",destinationTimeZone);
         NSString * utcStartTime = @"2019-01-10 07:16:00";
         NSLog(@"活动开始时间: %@",utcStartTime);
         NSString * utcEndTime   = @"2019-01-10 07:19:00";
         NSLog(@"活动结束时间: %@",utcEndTime);
         NSInteger utcStartTimeMils = [self getUTC2LocalTime:utcStartTime];
         NSInteger utcEndTimeMils   = [self getUTC2LocalTime:utcEndTime];
         NSDate * date = [NSDate date];
         NSLog(@"date 对象: %@",date);
         NSInteger currentTimeMils  = [self getMilsecons:date];
         NSString * dateTime = [[self utcDateFormater] stringFromDate:date];
         NSLog(@"当前时间: %@",dateTime);
         if(currentTimeMils<utcEndTimeMils && currentTimeMils> utcStartTimeMils){
         NSLog(@"在活动时间内");
         }else{
         NSLog(@"不在活动时间内");
         }
         */
       
        
        
    }



#pragma --mark IOS 世界标准时间UTC /GMT 转为当前系统时区对应的时间
/**
 utc date formatter
 
 @return utc date formmater
 */
- (NSDateFormatter *)utcDateFormater{
    static NSDateFormatter * dateFormater = nil;
    if(!dateFormater){
        dateFormater = [[NSDateFormatter alloc] init];
        dateFormater.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
        [dateFormater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    return dateFormater;
}
/**
 utc转为本地时间，单位:毫秒
 
 @param time utc time string
 @return utc转为本地时间，单位:毫秒
 */
- (NSInteger)getUTC2LocalTime:(NSString *)time{
    NSDateFormatter * dateFormater  = [self utcDateFormater];
    NSDate          * utcDate       = [dateFormater dateFromString:time];
    return [self getMilsecons:utcDate];
}

/**
 统一将date转成国际时间，以毫秒为单位
 
 @param date 本地时区date
 @return 毫秒数
 */
- (NSInteger)getMilsecons:(NSDate *)date{
    return date.timeIntervalSince1970 * 1000;
}

@end
