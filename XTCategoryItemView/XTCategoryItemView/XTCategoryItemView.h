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


@class XTCategoryConfiguration;
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
 udpate configuration, such as: maxRow, maxCountAtRow, titleLabelFont
 */
- (void)updateConfiguration:(void(^)(XTCategoryConfiguration *config))configBlock;

@end
NS_ASSUME_NONNULL_END
