//
//  ViewController.m
//  pagecontroltest
//
//  Created by 萧宇 on 8/7/16.
//  Copyright © 2016 萧宇. All rights reserved.
//

#import "ViewController.h"
#import "DLPageView.h"

@interface ViewController ()<DLPageViewDelegate, DLPageViewDatasource>

@property (nonatomic, strong) DLPageView *pageView;
@property (nonatomic, strong) NSArray *imgArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imgArray = @[@"1", @"2", @"3", @"4", @"5"];
    self.pageView = [[DLPageView alloc] initWithFrame:CGRectMake(0.0, 64.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 0.618)];
    self.pageView.delegate = self;
    self.pageView.datasource = self;
    // 设置自动切换的时间间隔，不设置将使用默认值
    self.pageView.animationDuration = 4;
    [self.view addSubview:self.pageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** UIPageViewDatasource */
// 设置总页数
- (NSInteger)numberOfPagesInPageView:(DLPageView *)pageView {
    return self.imgArray.count;
}
// 设置每一页的view
- (UIView *)pageView:(DLPageView *)pageView viewForPageAtIndexPath:(NSIndexPath *)indexPath {
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.pageView.frame.size.width, self.pageView.frame.size.height)];
    imgView.image = [UIImage imageNamed:self.imgArray[indexPath.row]];
    return imgView;
}

/** UIPageViewDelegate */
// 处理点击事件，该方法可选
- (void)pageView:(DLPageView *)pageView didSelectPage:(UIView *)view atIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了第%ld页", (long)indexPath.row);
}

@end
