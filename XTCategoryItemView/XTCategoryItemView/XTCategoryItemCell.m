//
//  XTCategoryItemCell.m
//  XTCategoryItemView
//
//  Created by 何凯楠 on 2017/5/18.
//  Copyright © 2017年 HeXiaoBa. All rights reserved.
//

#import "XTCategoryItemCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface XTCategoryItemCell()

@property (nonatomic, nullable, strong) UIImageView *imgView;
@property (nonatomic, nullable, strong) UILabel *titleLabel;

@end

@implementation XTCategoryItemCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void)setImages:(NSString *)images {
    _images = images;
    if ([images hasPrefix:@"http"]) {
        //download imageview
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:images] placeholderImage:self.placeholderImage];
    } else {
        self.imgView.image = [UIImage imageNamed:images];
    }
}

- (void)setTitleLabelFont:(UIFont *)titleLabelFont {
    _titleLabelFont = titleLabelFont;
    self.titleLabel.font = titleLabelFont;
}

- (void)setTitleLabelTextColor:(UIColor *)titleLabelTextColor {
    _titleLabelTextColor = titleLabelTextColor;
    self.titleLabel.textColor = titleLabelTextColor;
}

- (void)setupViews {

    UIImageView *imgView = [[UIImageView alloc] init];
    [self.contentView addSubview:imgView];
    self.imgView = imgView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat w = CGRectGetWidth(self.frame);
//    CGFloat h = CGRectGetHeight(self.frame);
    
    CGFloat imgW = w * 0.7;
    CGFloat leftPadding = (w - imgW) * 0.5;
    CGFloat topPadding = 10;
    CGFloat imgH = imgW;
    self.imgView.frame = CGRectMake(leftPadding, topPadding, imgW, imgH);
    
    CGFloat titleY = CGRectGetMaxY(self.imgView.frame) + 10;
    CGFloat titleH = 20;
    self.titleLabel.frame = CGRectMake(0, titleY, w, titleH);
    
    
}

@end
