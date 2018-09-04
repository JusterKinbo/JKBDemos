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
    _table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWith,ScreenHeight)];
    _table.dataSource=self;
    _table.delegate=self;
    _vcs=[self getSectionAndRows];
    _table.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];//不显示底下的空list
    [self.view addSubview:_table];
}
    
- (NSArray *)getSectionAndRows
{
    NSArray * animations=@[@{@"title":@"Transition animation",@"class":@"TransitonAnimationViewController"}];
        NSArray * views=@[@{@"title":@"half presented vc",@"class":@"Present2HalfTransientViewController"},
                          @{@"title":@"congfigured view",@"class":@"ConfiguredViewViewController"},
                          @{@"title":@"Hissug",@"class":@"HisSugViewController"},
                          @{@"title":@"custom cells",@"class":@"UITableViewCustomCellsController"},
                          @{@"title":@"rich text",@"class":@"RichTextViewController"},];
        NSArray * marcos=@[@{@"title":@"Marcos",@"class":@"MarcosViewController"}];
        NSArray * privateApis=@[@{@"title":@"which app is installed",@"class":@"PrivateAPIViewController"}];
        NSArray * modules=@[@{@"title":@"module files",@"class":@"ModuleCompileViewController"}];
        NSArray * xcode=@[@{@"title":@"xcode template",@"class":@"XcodeTemplateViewController"},
                          @{@"title":@"code snippet",@"class":@"CodeSnippetViewController"}];
        NSArray * runtime=@[@{@"title":@"runtime",@"class":@"RuntimeViewController"}];
        //vcs 分组容器
        NSArray * container=@[
                              @{@"sectionTitle":@"Animations",@"sectionData":animations},
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
    
#pragma TableView Delegata
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
        NSString* classText= [[((NSArray *)[[_vcs objectAtIndex:indexPath.section] objectForKey:@"sectionData"]) objectAtIndex:indexPath.row] objectForKey:@"class"];
        Class vc=NSClassFromString(classText);
        UIViewController * vcc=[[vc alloc]init];
        [self.navigationController pushViewController:vcc animated:YES];
        
    }

@end
