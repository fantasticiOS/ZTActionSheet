//
//  ViewController.m
//  ZTActionSheet
//
//  Created by 张彤 on 6/24/16.
//  Copyright © 2016 itcast. All rights reserved.
//

#import "ViewController.h"


#import "WantSunView.h"

#import "Masonry.h"
#import "ActionSheetCell.h"
#import "ActionSheetCellModel.h"

@interface ViewController ()<UIAlertViewDelegate>
@property (nonatomic, strong) WantSunView *sunView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)setUI{
    UIButton *btn= [[UIButton alloc]initWithFrame:CGRectMake(0, 200, 100, 40)];
    [self.view addSubview:btn];
    [btn setTitle:@"弹出自定义ActionSheet" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showSunView) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];



}
-(void)showSunView{
    //1.创建自定义view
    WantSunView *sunView= [[WantSunView alloc]initWithFrame:self.view.bounds];
    self.sunView =sunView;
    sunView.tableViewController = [[UITableViewController alloc]init];
    [self.view addSubview:sunView];
    
    //2.传递自定义cell
    static NSString *reuseId =@"reuseId";
    ActionSheetCell *action1 = [[ActionSheetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    ActionSheetCell *action2 = [[ActionSheetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    ActionSheetCell *action3 = [[ActionSheetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    ActionSheetCell *action4 = [[ActionSheetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    
    //2.0设置action的风格,destructive或者default
    action1.actionSheetCellStyle = ActionCellStyleDefault;
    action2.actionSheetCellStyle = ActionCellStyleDefault;
    action3.actionSheetCellStyle = ActionCellStyleDefault;
    action4.actionSheetCellStyle = ActionCellStyleDestructive;
    
    //2.1准备cell的模型数据
    ActionSheetCellModel *modelOfAction1 = [[ActionSheetCellModel alloc]init];
    modelOfAction1.imageName=@"拍照";
    modelOfAction1.title =@"拍照";
    
    ActionSheetCellModel *modelOfAction2 = [[ActionSheetCellModel alloc]init];
    modelOfAction2.imageName=@"相册";
    modelOfAction2.title =@"从相册选择";
    
    ActionSheetCellModel *modelOfAction3 = [[ActionSheetCellModel alloc]init];
    modelOfAction3.imageName=@"拍照";
    modelOfAction3.title =@"晒已完成挑战";
    
    ActionSheetCellModel *modelOfAction4 = [[ActionSheetCellModel alloc]init];
    modelOfAction4.imageName=@"取消";
    modelOfAction4.title =@"取消";
    
    //2.2给cell设置模型数据
    action1.entity = modelOfAction1;
    action2.entity = modelOfAction2;
    action3.entity = modelOfAction3;
    action4.entity = modelOfAction4;
    
    //2.3传递cell数组给sunView对象
    self.sunView.cellArray = @[action1,action2,action3,action4];
    
    
    
    //3.定制自定义cell的点击事件
    __weak typeof (self)weakSelf =self;
    self.sunView.actionBlock=^(NSIndexPath *indexPath){
        switch (indexPath.row) {
            case 0:
                [weakSelf showAlertWithTitle:@"选中第零行"];
                break;
            case 1:
                [weakSelf showAlertWithTitle:@"选中第一行"];
                break;
            case 2:
                [weakSelf showAlertWithTitle:@"选中第二行"];
                break;
            case 3:
                [weakSelf showAlertWithTitle:@"选中第三行"];
                break;
            default:
                break;
        }
    };
    
    //4.动画展示自定义view
    [sunView show];
}

-(void)showAlertWithTitle:(NSString *)title{

    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
