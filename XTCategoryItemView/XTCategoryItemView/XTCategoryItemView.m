//
//  XTCategoryItemView.m
//  XTCategoryItemView
//
//  Created by 何凯楠 on 2017/5/18.
//  Copyright © 2017年 HeXiaoBa. All rights reserved.
//

#import "XTCategoryItemView.h"
#import "XTCategoryItemCell.h"


static NSString *const ReuseIdentifier = @"itemCell";
@interface XTCategoryItemView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, nullable, strong) UICollectionView *collectionView;
@property (nonatomic, nullable, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, nullable, strong) UIPageControl *pageControl;

@end

@implementation XTCategoryItemView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}


- (void)setupViews {
    self.maxCountAtRow = 5;
    self.maxRow = 2;
    [self addSubview:self.collectionView];
    [self addSubview:self.pageControl];
    [self.collectionView registerClass:[XTCategoryItemCell class] forCellWithReuseIdentifier:ReuseIdentifier];
}

#pragma mark- Private
- (void)setupLayoutScollDirection {
    if (self.scrollDirection == XTCategoryItemViewScrollDirectionVertical) {
        self.layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    } else {
        self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    [self.collectionView reloadData];
}

- (void)setupPageControl {
    if (self.titles.count) {
        NSUInteger numbers = self.titles.count / (self.maxCountAtRow * self.maxRow);
        self.pageControl.numberOfPages = self.titles.count % self.maxCountAtRow == 0 ? numbers : numbers + 1;
        if (self.pageControl.numberOfPages == 1) {
            [self layoutIfNeeded];
        }
    }
}

#pragma marl - UICollectionViewDelegate && UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titles.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat itemW = CGRectGetWidth([UIScreen mainScreen].bounds) / self.maxCountAtRow;
    CGFloat itemH = itemW + 20;
    CGSize itemSize = CGSizeMake(itemW, itemH);
    return itemSize;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
 
    XTCategoryItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];
    cell.titleLabelTextColor = self.titleLabelTextColor;
    cell.titleLabelFont = self.titleLabelFont;
    if (self.titles.count > indexPath.item && self.images.count > indexPath.item) {
        NSString *title = self.titles[indexPath.item];
        NSString *image = self.images[indexPath.item];
        cell.title = title;
        cell.images = image;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.scrollDirection == XTCategoryItemViewScrollDirectionHorizontal) {
        double page = scrollView.contentOffset.x / scrollView.frame.size.width;
        NSInteger currentPage = (NSInteger)(page + 0.5);
        self.pageControl.currentPage = currentPage;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.titles.count > indexPath.item) {
//        XTCategoryItemCell *cell = (XTCategoryItemCell *)[collectionView cellForItemAtIndexPath:indexPath];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(xtCategoryItemView:didSelectItemAtIndex:)]) {
            [self.delegate xtCategoryItemView:self didSelectItemAtIndex:indexPath.item];
        }
    }
}


#pragma mark- Setter && Getter
- (void)setTitles:(NSArray *)titles {
    if (_titles != titles) {
        _titles = titles;
        [self setupPageControl];
        [self.collectionView reloadData];
    }
}

- (void)setImages:(NSArray *)images {
    if (_images != images) {
        _images = images;
        [self.collectionView reloadData];
    }
}

- (void)setScrollDirection:(XTCategoryItemViewScrollDirection)scrollDirection {
    if (_scrollDirection != scrollDirection) {
        _scrollDirection = scrollDirection;
        [self setupLayoutScollDirection];
    }
}

- (void)setMaxCountAtRow:(NSUInteger)maxCountAtRow {
    if (_maxCountAtRow != maxCountAtRow) {
        _maxCountAtRow = maxCountAtRow;
        if (maxCountAtRow) {
            [self setupPageControl];
            [self.collectionView reloadData];
        }
    }
}

- (void)setMaxRow:(NSUInteger)maxRow {
    if (_maxRow != maxRow) {
        _maxRow = maxRow;
        if (maxRow) {
            [self setupPageControl];
            [self layoutIfNeeded];
        }
    }
}

- (void)setTitleLabelFont:(UIFont *)titleLabelFont {
    if (_titleLabelFont != titleLabelFont) {
        _titleLabelFont = titleLabelFont;
        [self.collectionView reloadData];
    }
}

- (void)setTitleLabelTextColor:(UIColor *)titleLabelTextColor {
    if (_titleLabelTextColor != titleLabelTextColor) {
        _titleLabelTextColor = titleLabelTextColor;
        [self.collectionView reloadData];
    }
}

- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor {
    if (_pageIndicatorTintColor != pageIndicatorTintColor) {
        _pageIndicatorTintColor = pageIndicatorTintColor;
        self.pageControl.pageIndicatorTintColor = pageIndicatorTintColor;
    }
}

- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor {
    if (_currentPageIndicatorTintColor != currentPageIndicatorTintColor) {
        _currentPageIndicatorTintColor = currentPageIndicatorTintColor;
        self.pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    }
}

- (UICollectionViewFlowLayout *)layout
{
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.sectionInset = UIEdgeInsetsZero;
        _layout.minimumLineSpacing = 0;
        _layout.minimumInteritemSpacing = 0;
        CGFloat itemW = CGRectGetWidth([UIScreen mainScreen].bounds) / self.maxCountAtRow;
        _layout.itemSize = CGSizeMake(itemW, itemW + 20);
        
    }
    return _layout;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
    
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.layout];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
    }
    return _collectionView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.hidesForSinglePage = YES;
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    }
    return _pageControl;
}

#pragma mark- layoutSubviews
- (void)layoutSubviews {
    [super layoutSubviews];
    if (CGRectIsEmpty(self.frame)) {
        CGFloat itemW = CGRectGetWidth([UIScreen mainScreen].bounds) / self.maxCountAtRow;
        CGFloat h = (itemW + 20) * self.maxRow;
        if (self.scrollDirection == XTCategoryItemViewScrollDirectionHorizontal && self.pageControl.numberOfPages > 1) {
            h = h + 20;
        }
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, CGRectGetWidth([UIScreen mainScreen].bounds), h);
    }
    self.collectionView.frame = self.bounds;
    if (self.scrollDirection == XTCategoryItemViewScrollDirectionHorizontal  && self.pageControl.numberOfPages > 1) {
        self.collectionView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - 20);
        self.pageControl.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 20, CGRectGetWidth(self.frame), 20);
    }
    
}

@end
