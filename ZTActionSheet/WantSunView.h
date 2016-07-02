//
//  WantSunView.h
//  ImagePicker
//
//  Created by 张彤 on 6/21/16.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ConfigureActionBlock)(NSIndexPath *indexPath);

@interface WantSunView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableViewController *tableViewController;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *bgAlphaView;

@property (nonatomic, copy)ConfigureActionBlock actionBlock;
@property (nonatomic, strong)NSArray *cellArray;


-(void)show;
@end
