//
//  XTCategoryItemView.h
//  XTCategoryItemView
//
//  Created by 何凯楠 on 2017/5/18.
//  Copyright © 2017年 HeXiaoBa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XTCategoryItemView;
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, XTCategoryItemViewScrollDirection) {
    XTCategoryItemViewScrollDirectionVertical,
    XTCategoryItemViewScrollDirectionHorizontal
};

@protocol XTCategoryItemViewDelegate <NSObject>

@optional
- (void)xtCategoryItemView:(XTCategoryItemView *)view didSelectItemAtIndex:(NSUInteger)index;

@end


@interface XTCategoryItemView : UIView
/**
 delegate
 */
@property (nonatomic, nullable, weak) id <XTCategoryItemViewDelegate> delegate;
/**
 item title
 */
@property (nonatomic, nullable, strong) NSArray *titles;
/**
 item image, if you nees download imageview, you need image url; or, you need image name
 */
@property (nonatomic, nullable, strong) NSArray *images;
/**
 default is XTCategoryItemViewScrollDirectionVertical
 */
@property (nonatomic) XTCategoryItemViewScrollDirection scrollDirection;
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

@end
NS_ASSUME_NONNULL_END
