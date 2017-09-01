//
//  XTCategoryConfiguration.m
//  XTCategoryItemView
//
//  Created by 何凯楠 on 2017/8/31.
//  Copyright © 2017年 HeXiaoBa. All rights reserved.
//

#import "XTCategoryConfiguration.h"

@implementation XTCategoryConfiguration


+ (instancetype)configuration {
    XTCategoryConfiguration *config = [[XTCategoryConfiguration alloc] init];
    config.maxCountAtRow = 5;
    config.maxRow = 2;
    return config;
}

- (XTCategoryConfiguration * _Nullable (^)(NSUInteger))configMaxRow {
    return ^(NSUInteger maxRow) {
        self.maxRow = maxRow;
        return self;
    };
}

- (XTCategoryConfiguration * _Nullable (^)(NSUInteger))configMaxCountAtRow {
    return ^(NSUInteger maxCountAtRow) {
        self.maxCountAtRow = maxCountAtRow;
        return self;
    };
}

- (XTCategoryConfiguration * _Nullable (^)(UIFont * _Nullable))configTitleLabelFont {
    return ^(UIFont *titleLabelFont) {
        self.titleLabelFont = titleLabelFont;
        return self;
    };
}

- (XTCategoryConfiguration * _Nullable (^)(UIColor * _Nullable))configTtitleLabelTextColor {
    return ^(UIColor *titleLabelTextColor) {
        self.titleLabelTextColor = titleLabelTextColor;
        return self;
    };
}

- (XTCategoryConfiguration * _Nullable (^)(UIColor * _Nullable))configPageIndicatorTintColor {
    return ^(UIColor *indicatorTintColor) {
        self.pageIndicatorTintColor = indicatorTintColor;
        return self;
    };
}

- (XTCategoryConfiguration * _Nullable (^)(UIColor * _Nullable))configCurrentPageIndicatorTintColor {
    return ^(UIColor *currentIndicatorTintColor) {
        self.currentPageIndicatorTintColor = currentIndicatorTintColor;
        return self;
    };
}

@end
