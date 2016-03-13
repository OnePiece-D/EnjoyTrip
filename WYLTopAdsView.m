//
//  WYLTopAdsView.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/10.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLTopAdsView.h"

#import "WYLAdsModel.h"

#define baseImageViewTag 77
#define timeLong 30

#define imageWidth (SCREEN_Size.width - 8*2)

@interface WYLTopAdsView()<UIScrollViewDelegate>

@property (nonatomic,weak) UIScrollView * scrollView;

@property (nonatomic,weak) UIPageControl * pageControl;

@property (nonatomic,weak) NSTimer * timer;

@end

@implementation WYLTopAdsView

+ (instancetype)adsView {
    return [[self alloc] initWithFrame:CGRectZero];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    CGFloat selfX = 8;
    CGFloat selfY = 5;
    CGFloat selfW = imageWidth;
    CGFloat selfH = selfW / 2.f;
    self.frame = CGRectMake(selfX, selfY, selfW, selfH + 5);
    
    self.scrollView.frame = CGRectMake(selfX, selfY, selfW, selfH);
    
    //分页计时器
    CGPoint center = self.center;
    center.y = CGRectGetHeight(self.frame) - 15;
    self.pageControl.frame = CGRectMake(0, 0, 80, 30);
    self.pageControl.center = center;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        //此处创建界面组件
        UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        scrollView.delegate = self;
        [self addSubview:scrollView];
        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        
        UIPageControl * pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
        [self addSubview:pageControl];
        self.pageControl = pageControl;
        
        self.scrollView = scrollView;
        
        
        NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:timeLong target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        self.timer = timer;
    }
    return self;
}

- (void)setAdsDataSource:(NSArray *)adsDataSource {
    _adsDataSource = adsDataSource;
    
    //赋值
    if (adsDataSource.count == 0) {
        return;
    }
    
    CGFloat width = imageWidth;
    CGFloat height = imageWidth / 2.f;
    for (int i = 0; i < adsDataSource.count + 2; i++) {
        WYLAdsModel * model = nil;
        
        
        UIImageView * imageView = [[UIImageView alloc] init];
        //        UIButton * imageView = [[UIButton alloc] init];
        imageView.frame = CGRectMake(width * i, 0, width, height);
        //        imageView.tag = baseImageViewTag + i;
        imageView.userInteractionEnabled = YES;
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = imageView.bounds;
        button.tag = baseImageViewTag + i;
        [imageView addSubview:button];
        
        if (i == 0) {
            model = adsDataSource[adsDataSource.count - 1];
            //            [imageView sd_setImageWithURL:adsDataSource[adsDataSource.count - 1]];
        }else if (i == adsDataSource.count + 1) {
            model = adsDataSource[0];
            //            [imageView sd_setImageWithURL:adsDataSource[0]];
        }else {
            model = adsDataSource[i - 1];
            //            [imageView sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
            
        }
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
        
        //        UIGestureRecognizer * tap = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(tapTouch:)];
        //        [imageView addGestureRecognizer:tap];
        [button addTarget:self action:@selector(tapTouch:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:imageView];
        self.scrollView.contentSize = CGSizeMake(CGRectGetMaxX(imageView.frame), 0);
    }
    
    self.scrollView.contentOffset = CGPointMake(width, 0);
    self.pageControl.numberOfPages = adsDataSource.count;
}

- (void)tapTouch:(UIButton *)tap {
    
    if (self.adsTouchBlock) {
        self.adsTouchBlock(tap.tag - baseImageViewTag - 1);
    }
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self pageNext:scrollView];
}

- (void)pageNext:(UIScrollView *)scrollView {
    CGFloat width = CGRectGetWidth(scrollView.frame);
    NSInteger page = (self.scrollView.contentOffset.x + width * 0.5)/ width;
    self.pageControl.currentPage = page - 1;
    if (page == 0) {
        self.pageControl.currentPage = self.adsDataSource.count - 1;
        [self.scrollView setContentOffset:CGPointMake(width * self.adsDataSource.count, 0) animated:NO];
    }
    if (page == self.adsDataSource.count + 1) {
        self.pageControl.currentPage = 0;
        [self.scrollView setContentOffset:CGPointMake(width, 0) animated:NO];
    }
}


- (void)timerAction {
    // 改变, 其实就是翻一页, 当前页+1
    NSInteger page = self.scrollView.contentOffset.x / CGRectGetWidth(self.scrollView.frame);
    // 通过改变contentOffSet来改变显示的内容
    [self.scrollView setContentOffset:CGPointMake(++page * CGRectGetWidth(self.scrollView.frame), 0) animated:YES];
}

@end
