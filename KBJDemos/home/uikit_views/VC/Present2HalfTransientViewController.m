//
//  Present2HalfTransientViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/9/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "Present2HalfTransientViewController.h"
#import "PresentedHalfTransientViewController.h"
#import "UIImage+UIColor.h"
#import "UIColor+BBAHexColor.h"

@interface Present2HalfTransientViewController ()

@end

@implementation Present2HalfTransientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [btn setTitle:@"prenset vc" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(modelPresent:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor redColor] size:btn.frame.size]  forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor greenColor] size:btn.frame.size]  forState:UIControlStateNormal];
    UILabel *l = [[UILabel alloc]init]; l.text = @"测试";l.frame = CGRectMake(0, 0, 100, 30);
    [btn addSubview:l];
    
    UIImageView * imv = [[UIImageView alloc]init];
    NSString * str = @"http://cdn01.baidu-img.cn/timg?wisealaddin&size=f200_200&quality=100%&sec=1553051773&di=00f218286be9d3482a2e1d1d6898cfe8&src=http%3A%2F%2Ft11.baidu.com%2Fit%2Fu%3D212207326%2C1889588704%26fm%3D171%26s%3D32D1CF365D22CA139C4AB9DA020040B9%26w%3D480%26h%3D270%26img.JPEG";
//    str = @"http%3A%2F%2Ft11.baidu.com%2Fit%2Fu%3D212207326%2C1889588704%26fm%3D171%26s%3D32D1CF365D22CA139C4AB9DA020040B9%26w%3D480%26h%3D270%26img.JPEG";
    str = [self URLDecodedString:str];
    

//    str = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553086477950&di=98b7697a0ba408ce3291639f6c056870&imgtype=0&src=http%3A%2F%2Fpic.k73.com%2Fup%2Fsoft%2F2016%2F0914%2F160152_18534397.jpg";
    NSURL * url = [NSURL URLWithString:str];
    
    
    [imv sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pengyuyan01"]];
    imv.frame = CGRectMake(100, 200, 100, 100);
    [self.view addSubview:imv];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)modelPresent:(id)sender
{
    PresentedHalfTransientViewController * presentedVC = [[PresentedHalfTransientViewController alloc]init];
    presentedVC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
    presentedVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.definesPresentationContext = YES;
    [self presentViewController:presentedVC animated:YES completion:^{
        
    }];
}



-(NSString *)URLEncodedString:(NSString *)str
{
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)str,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}


-(NSString *)URLDecodedString:(NSString *)str
{
    NSString *decodedString=(__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)str, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return decodedString;
}

    
@end
