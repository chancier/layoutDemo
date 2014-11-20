//
//  ViewController.m
//  DemoAutolayout
//
//  Created by chen on 14-11-19.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AutoLayout.h"
#import "TestTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dataArr;
}
@end

@implementation ViewController

-(UIImage*) imagePathed:(NSString*)imageName
{
    NSString *strPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:imageName];
    UIImage *img = [UIImage imageWithContentsOfFile:strPath];
    
    if ( nil == img )
    {
        img = [UIImage imageNamed:imageName];
    }
    
    return img;
}

/*
 *
 如果@2x、@3x都存在
｛
    6以及一下自动取@2x图片
    6+取@3x图片
 ｝
 
 以下是取了各个图片后的处理方式：
 
 @2x： @2x全部自动除以2 无论是否带了后缀@2x.png
 @3x： @3x全部自动除以3 无论是否带了后缀@3x.png
 
 
 建议：不带@2x @3x 
 这样  6以及一下自动取@2x图片
       6+取@3x图片
 
 *
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image =[self imagePathed:@"banner_1.png"];
//    [self imagePathed:@"banner_1@3x.png"];
    NSLog(@"image%f %f",image.size.width,image.size.height);
    
    dataArr = [NSArray arrayWithObjects:@"sfafaxxCC",@"afasxcvasfasfsadfasdfsdfsadfasdfasdfasdfsadfsdfasdfasxcvasfasfsadfasdfsdfsadfasdfasdfasdfsadfsdfasdfsasxcvasfasfsadfasdfsdfsadfasdfasdfasdfsadfsdfasdfssd",@"afasxcvasfasfsadfasdfsdfsadfasdfasdfasdfsadfsdfasdfasxcvasfasfsadfasdfsdfsadfasdfasdfasdfsadfsdfasdfsasxcvasfsadfasdfasdfasdfsadfsdfasdfasxcvasfasfsadfasdfsdfsadfasdfasdfasdfsadfsdfasdfsasxcvasfasfsadasfsadfasdfsdfsadfasdfasdfasdfsadfsdfasdfssd", nil];
    
    UITableView *myTable = [UITableView autoLayoutView];
    myTable.delegate = self;
    myTable.dataSource = self;
    [self.view addSubview:myTable];
    [myTable pinToSuperviewEdges:JRTViewPinAllEdges inset:10.0 usingLayoutGuidesFrom:self];
    
    [myTable registerClass:[TestTableViewCell class] forCellReuseIdentifier:@"TestTableViewCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *reuseIndentifier = @"reuseIndentifier";
//    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndentifier];
//    
//    if (!cell)
//    {
//        cell = [[TestTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIndentifier];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        
//    }
     TestTableViewCell *cell = (TestTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"TestTableViewCell"];
    [cell setData:dataArr[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

     TestTableViewCell *cell = (TestTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"TestTableViewCell"];
    [cell setData:dataArr[indexPath.row]];
   CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
