//
//  ViewController.m
//  XTCategoryItemView
//
//  Created by 何凯楠 on 2017/5/18.
//  Copyright © 2017年 HeXiaoBa. All rights reserved.
//

#import "ViewController.h"
#import "XTCategoryItemView.h"

@interface ViewController ()<XTCategoryItemViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CGFloat w = CGRectGetWidth(self.view.frame);
    XTCategoryItemView *view = [[XTCategoryItemView alloc] init];
    view.frame = CGRectMake(0, 100, 0, 0);
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    view.scrollDirection = XTCategoryItemViewScrollDirectionHorizontal;
    view.maxCountAtRow = 4;
    view.maxRow = 2;
    view.titleLabelFont = [UIFont systemFontOfSize:14];
    view.titleLabelTextColor = [UIColor redColor];
    view.delegate = self;
    [self.view addSubview:view];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HomeCategory.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *titles = [NSMutableArray array];
    NSMutableArray *imageNames = [NSMutableArray array];
    for (NSDictionary *tempDic in array) {
        NSString *imageName  = tempDic[@"imageName"];
        NSString *title = tempDic[@"title"];
        [titles addObject:title];
        [imageNames addObject:imageName];
    }
    view.images = [imageNames copy];
    view.titles = [titles copy];

}

- (void)xtCategoryItemView:(XTCategoryItemView *)view didSelectItemAtIndex:(NSUInteger)index {
    NSLog(@"%ld", index);
}

@end
