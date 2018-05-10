//
//  ZKStretchableTableHeaderView.m
//  职通车
//
//  Created by PengZK on 2018/5/10.
//  Copyright © 2018年 ZTC. All rights reserved.
//

#import "ZKStretchableTableHeaderView.h"
#import "UIImageView+ContentFrame.h"

@implementation ZKStretchableTableHeaderView
{
    CGRect initialFrame;
    CGFloat defaultViewHeight;
}

- (void)stretchHeaderForTableView:(UITableView*)tableView withView:(UIView*)view
{
    _tableView = tableView;
    _view = view;
    
    if ([view isKindOfClass:[UIImageView class]]) {
        UIImageView *imageV = (UIImageView *)_view;
        [imageV setContentMode:UIViewContentModeScaleAspectFit];
        CGSize content = imageV.contentSize;
        CGFloat hei = [[UIScreen mainScreen] bounds].size.width*content.height/content.width;
        [imageV setContentMode:UIViewContentModeScaleAspectFill];
        
        initialFrame       = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, MIN(hei, [[UIScreen mainScreen] bounds].size.width));
        defaultViewHeight  = initialFrame.size.height;
    }
    else if ([view isKindOfClass:[UIView class]]) {
        initialFrame       = _view.frame;
        initialFrame.size.height = initialFrame.size.height*[[UIScreen mainScreen] bounds].size.width/320.0;
        defaultViewHeight  = initialFrame.size.height;
    }
    
    UIView* emptyTableHeaderView = [[UIView alloc] initWithFrame:initialFrame];
    emptyTableHeaderView.userInteractionEnabled = NO;
    _tableView.tableHeaderView = emptyTableHeaderView;
    
    [_tableView addSubview:_view];
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    CGRect f = _view.frame;
    f.size.width = _tableView.frame.size.width;
    _view.frame = f;
    
    if(scrollView.contentOffset.y < 0) {
        CGFloat offsetY = (scrollView.contentOffset.y /*+ scrollView.contentInset.top*/) * -1;
        initialFrame.origin.y = offsetY * -1;
        initialFrame.size.height = defaultViewHeight + offsetY;
        _view.frame = initialFrame;
    } else {
        // 导航栏渐变...
    }
}

- (void)resizeView
{
    initialFrame.size.width = _tableView.frame.size.width;
    _view.frame = initialFrame;
}

@end
