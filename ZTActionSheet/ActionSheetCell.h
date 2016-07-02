//
//  ActionSheetCell.h
//  ImagePicker
//
//  Created by 张彤 on 6/21/16.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActionSheetCellModel.h"

typedef enum {
    
    ActionCellStyleDefault,
    ActionCellStyleDestructive
    

}ActionCellStyle;


@interface ActionSheetCell : UITableViewCell
@property (nonatomic, strong) ActionSheetCellModel *entity;
@property (nonatomic, assign) ActionCellStyle actionSheetCellStyle;
@end
