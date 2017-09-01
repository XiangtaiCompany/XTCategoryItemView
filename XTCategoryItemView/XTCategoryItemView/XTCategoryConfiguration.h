//
//  XTCategoryConfiguration.h
//  XTCategoryItemView
//
//  Created by 何凯楠 on 2017/8/31.
//  Copyright © 2017年 HeXiaoBa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XTCategoryConfiguration : NSObject

+ (instancetype _Nullable )configuration;

/**
 a row have item max count, default 5
 */
@property (nonatomic) NSUInteger maxCountAtRow;
/**
 max row count, default 2
 */
@property (nonatomic) NSUInteger maxRow;
/**
 item title label font, default system default font
 */
@property (nonatomic, nullable, strong) UIFont *titleLabelFont;
/**
 item title label text color, default black color
 */
@property (nonatomic, nullable, strong) UIColor *titleLabelTextColor;
/**
 if scrollDirection is XTCategoryItemViewScrollDirectionHorizontal and
 the pages more than 1, you will display UIPageControl,
 you can setting pageIndicatorTintColor
 */
@property (nonatomic, nullable, strong) UIColor *pageIndicatorTintColor NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;
/**
 you can setting currentPageIndicatorTintColor
 */
@property (nonatomic, nullable, strong) UIColor *currentPageIndicatorTintColor NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;;

//
@property (nonatomic, nullable, copy, readonly) XTCategoryConfiguration * _Nullable (^configMaxRow)(NSUInteger maxRow);
@property (nonatomic, nullable, copy, readonly) XTCategoryConfiguration * _Nullable (^configMaxCountAtRow)(NSUInteger maxCountAtRow);
@property (nonatomic, nullable, copy, readonly) XTCategoryConfiguration * _Nullable (^configTitleLabelFont)(UIFont * _Nullable titleLabelFont);
@property (nonatomic, nullable, copy, readonly) XTCategoryConfiguration * _Nullable (^configTtitleLabelTextColor)(UIColor * _Nullable titleLabelTextColor);
@property (nonatomic, nullable, copy, readonly) XTCategoryConfiguration * _Nullable (^configPageIndicatorTintColor)(UIColor * _Nullable pageIndicatorTintColor);
@property (nonatomic, nullable, copy, readonly) XTCategoryConfiguration * _Nullable (^configCurrentPageIndicatorTintColor)(UIColor * _Nullable currentPageIndicatorTintColor);

@end
