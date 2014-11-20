//
//  TestTableViewCell.m
//  DemoAutolayout
//
//  Created by chen on 14-11-19.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "TestTableViewCell.h"
#import "UIView+AutoLayout.h"

@implementation TestTableViewCell
{
    UILabel *firstView;
    UILabel *secondView;
}

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        firstView = [UILabel autoLayoutView];
        firstView.numberOfLines = 0;
        firstView.lineBreakMode = NSLineBreakByCharWrapping;
        firstView.textColor = [UIColor blackColor];
        firstView.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:firstView];
        
        [firstView constrainToWidth:60];
        [firstView pinToSuperviewEdges:JRTViewPinLeftEdge inset:10.0];
        
        //    [firstView centerInContainerOnAxis:NSLayoutAttributeCenterX];
        [firstView pinToSuperviewEdges:JRTViewPinTopEdge inset:30];
        
        
        secondView = [UILabel autoLayoutView];
        [self.contentView addSubview:secondView];
        [secondView pinAttribute:NSLayoutAttributeLeft toSameAttributeOfItem:firstView];
        [secondView constrainToWidth:300];
        [secondView pinAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeBottom ofItem:firstView withConstant:0];
        
        [secondView pinToSuperviewEdges:JRTViewPinBottomEdge inset:10];
        
    }
    return self;
}

-(void)setData:(NSString *)testStr
{
    firstView.text = testStr;
    secondView.text = @"my is the second";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
