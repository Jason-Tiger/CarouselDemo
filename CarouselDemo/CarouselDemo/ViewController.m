//
//  ViewController.m
//  轮播功能封装
//
//  Created by 若愚 on 16/4/16.
//  Copyright © 2016年 若愚. All rights reserved.
//

#import "ViewController.h"
#import "CycleScrollView.h"
#define ScreenX [UIScreen mainScreen].bounds.size.width
#define ScreenY [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation ViewController
- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;

}
//原始数据源
-(void)getSources
{
    for (int i = 1; i <= 5 ; i ++) {
        
        UIImageView *tempView = [[UIImageView alloc]init];
        tempView.frame = CGRectMake(0, 0, ScreenX, 2*ScreenY/3);
        tempView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
        [self.dataSource addObject:tempView];
        
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self getSources];

    [self setUpCycleView];
    

    
}

//初始化轮播图
-(void)setUpCycleView
{
    
    CycleScrollView *cycleView = [[CycleScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenX, 2*ScreenY/3) animationDuration:3];
    
    cycleView.fetchContentViewAtIndex =^UIView *(NSInteger pageIndex){
        return self.dataSource[pageIndex];
    };
    
    cycleView.totalPagesCount = self.dataSource.count;
    
    [self.view addSubview:cycleView];



}
@end
