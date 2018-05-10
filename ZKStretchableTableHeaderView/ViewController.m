//
//  ViewController.m
//  ZKStretchableTableHeaderView
//
//  Created by PengZK on 2018/5/10.
//  Copyright © 2018年 KUN. All rights reserved.
//

#import "ViewController.h"
#import "ZKStretchableTableHeaderView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *stretchView;
@property (nonatomic, strong) ZKStretchableTableHeaderView* stretchableTableHeaderView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configView];
}

- (void)configView {
    _stretchableTableHeaderView = [ZKStretchableTableHeaderView new];
    [_stretchableTableHeaderView stretchHeaderForTableView:self.tableView withView:_stretchView];
    [_stretchableTableHeaderView resizeView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_stretchableTableHeaderView scrollViewDidScroll:scrollView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_stretchableTableHeaderView resizeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
