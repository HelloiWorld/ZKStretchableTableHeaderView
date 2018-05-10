# ZKStretchableTableHeaderView
stretchable table header view，zoom in while pulling down.

![screenshot](https://github.com/HelloiWorld/ZKStretchableTableHeaderView/blob/master/screenshot.gif)

## Usage

### 1. binding stretchView
    @property (weak, nonatomic) IBOutlet UIView *stretchView;
    @property (nonatomic, strong) ZKStretchableTableHeaderView* stretchableTableHeaderView;
    
### 2. init config
    _stretchableTableHeaderView = [ZKStretchableTableHeaderView new];
    [_stretchableTableHeaderView stretchHeaderForTableView:self.tableView withView:_stretchView];
    [_stretchableTableHeaderView resizeView];
    
### 3. add scrollView delegate method
    - (void)scrollViewDidScroll:(UIScrollView *)scrollView {
        [_stretchableTableHeaderView scrollViewDidScroll:scrollView];
    }
    
### 4. layout subviews when frame changed
    - (void)viewDidLayoutSubviews {
        [super viewDidLayoutSubviews];
        [_stretchableTableHeaderView resizeView];
    }
