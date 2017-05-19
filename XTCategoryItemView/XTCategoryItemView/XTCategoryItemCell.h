//
//  XTCategoryItemCell.h
//  XTCategoryItemView
//
//  Created by 何凯楠 on 2017/5/18.
//  Copyright © 2017年 HeXiaoBa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XTCategoryItemCell : UICollectionViewCell
/**
 item title
 */
@property (nonatomic, nullable, copy) NSString *title;
/**
 item image name or url
 */
@property (nonatomic, nullable, copy) NSString *images;
/**
 item image palcehorlderImage, if you need download image, you had better images before
 */
@property (nonatomic, nullable, copy) UIImage *placeholderImage;
/**
 item title label font, default system default font
 */
@property (nonatomic, nullable, strong) UIFont *titleLabelFont;
/**
 item title label text color, default black color
 */
@property (nonatomic, nullable, strong) UIColor *titleLabelTextColor;


@end
