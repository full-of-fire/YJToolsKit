//
//  YJViewController.m
//  YJToolsKit
//
//  Created by full-of-fire on 04/26/2017.
//  Copyright (c) 2017 full-of-fire. All rights reserved.
//

#import "YJViewController.h"
#import <YJTools.h>
#import <YJCatagories.h>
@interface YJViewController ()

@end

@implementation YJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [YJPopupTool showHUDFailWithMessage:@"test"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
