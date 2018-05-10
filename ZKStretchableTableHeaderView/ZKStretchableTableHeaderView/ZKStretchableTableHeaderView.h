//
//  ZKStretchableTableHeaderView.h
//  职通车
//
//  Created by PengZK on 2018/5/10.
//  Copyright © 2018年 ZTC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ZKStretchableTableHeaderView : NSObject

@property (nonatomic, weak) UITableView* tableView;
@property (nonatomic, weak) UIView* view;

- (void)stretchHeaderForTableView:(UITableView*)tableView withView:(UIView*)view;
- (void)scrollViewDidScroll:(UIScrollView*)scrollView;
- (void)resizeView;

@end
