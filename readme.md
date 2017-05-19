pod "XTCategoryItemView"

### 使用场景
![image](https://github.com/XiangtaiCompany/XTCategoryItemView/blob/master/demo.png)

- 使用方法
```
    //1.初始化
    XTCategoryItemView *view = [[XTCategoryItemView alloc] init];
    //默认宽高根据maxRow自动计算（宽默认为整个屏幕的宽），只用设置x和y
    view.frame = CGRectMake(0, 100, 0, 0);
    //设置背景颜色
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //设置滑动方向
    view.scrollDirection = XTCategoryItemViewScrollDirectionHorizontal;
    //设置每行最多就几个item，默认5
    view.maxCountAtRow = 4;
    //设置最多就几行，默认2
    view.maxRow = 2;
    //设置标题文字字体
    view.titleLabelFont = [UIFont systemFontOfSize:14];
    //设置标题文字颜色
    view.titleLabelTextColor = [UIColor redColor];
    //设置代理
    view.delegate = self;
    [self.view addSubview:view];
    
    //2.赋值
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
    //给图片赋值，可以直接给出图片的名字，也可以给出url
    view.images = [imageNames copy];
    //给标题赋值
    view.titles = [titles copy];
    
    //3.实现代理方法
    - (void)xtCategoryItemView:(XTCategoryItemView *)view didSelectItemAtIndex:(NSUInteger)index {
    NSLog(@"%ld", index);
}

```
