//
//  EditPhotoViewController.m
//  PhotoBeautify
//
//  Created by GJ on 2017/3/2.
//  Copyright © 2017年 GJ. All rights reserved.
//

#import "EditPhotoViewController.h"
#import "BSImagePickerController.h"
#import <Photos/Photos.h>
#import "Masonry.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "LDDefine.h"
#import "EditPhotoToolBarItem.h"
#import "FilterPickerViewController.h"
#import "BubblePickerViewController.h"
#import "MZFormSheetPresentationViewController.h"

@interface EditPhotoViewController ()<FilterPickerViewControllerDelegate,BubblePickerViewControllerDelegate>
{
    ALAsset* _assets;
    UIImageView* _preview;
    PHContentEditingInput* input;
    FilterPickerViewController* _filterPickerVC;
    BubblePickerViewController* _bubblePickerVC;
    EditPhotoToolBarItem* filterItem;
    EditPhotoToolBarItem* bubbleItem;
    EditPhotoToolBarItem* stickerItem;
}

@end

@implementation EditPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem* leftButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    UIBarButtonItem* rightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(done)];
    self.navigationItem.title = @"美化";
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    [self.view addSubview:_preview];
    [_preview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_preview.superview);
    }];
    [[PHImageManager defaultManager]requestImageForAsset:[self ALAssetToPHAsset:_assets] targetSize:CGSizeMake(512, 512) contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        if (result) {
            _preview.image = result;
        }
    }];
    [self initMenuView];
}

- (instancetype)init:(NSArray*)assets{
    self = [super init];
    if (self) {
        _assets = assets.firstObject;
        _preview = [[UIImageView alloc]init];
        _preview.contentMode = UIViewContentModeScaleAspectFill;
        _preview.userInteractionEnabled = YES;
    }
    return self;
}

- (void)initMenuView{
    UIView* menuView = [[UIView alloc]init];
    menuView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self.view addSubview:menuView];
    [menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(menuView.superview).offset(0);
        make.left.equalTo(menuView.superview).offset(0);
        make.right.equalTo(menuView.superview).offset(0);
        make.height.equalTo(@(50));
    }];
    
    filterItem = [[EditPhotoToolBarItem alloc]init:[UIImage imageNamed:@"FilterButton"] title:@"滤镜"];
    [filterItem addTarget:self action:@selector(touchFilterButton) forControlEvents:UIControlEventTouchUpInside];
    bubbleItem = [[EditPhotoToolBarItem alloc]init:[UIImage imageNamed:@"BubbleButton"] title:@"气泡"];
    [bubbleItem addTarget:self action:@selector(touchBubbleButton) forControlEvents:UIControlEventTouchUpInside];
    stickerItem = [[EditPhotoToolBarItem alloc]init:[UIImage imageNamed:@"StickerButton"] title:@"贴纸"];
    [stickerItem addTarget:self action:@selector(touchStickerButton) forControlEvents:UIControlEventTouchUpInside];
    UIStackView* stackView = [[UIStackView alloc]initWithArrangedSubviews:@[filterItem,bubbleItem,stickerItem]];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.spacing = 0;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.alignment = UIStackViewAlignmentCenter;
    [menuView addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(stackView.superview);
    }];
}

//editToolBarAction
- (void)touchFilterButton {
    bubbleItem.line.hidden = YES;
    stickerItem.line.hidden = YES;
    _filterPickerVC = [[FilterPickerViewController alloc]init];
    _filterPickerVC.delegate = self;
    [self presentViewController:_filterPickerVC];
}

- (void)touchBubbleButton {
    filterItem.line.hidden = YES;
    stickerItem.line.hidden = YES;
    _bubblePickerVC = [[BubblePickerViewController alloc]init];
    _bubblePickerVC.delegate = self;
    [self presentViewController:_bubblePickerVC];
}

- (void)touchStickerButton {
    filterItem.line.hidden = YES;
    bubbleItem.line.hidden = YES;
}

- (void)presentViewController:(UIViewController*)vc {
    UINavigationController* navigationVC = [[UINavigationController alloc]initWithRootViewController:vc];
    MZFormSheetPresentationViewController* formSheetController = [[MZFormSheetPresentationViewController alloc]initWithContentViewController:navigationVC];
    formSheetController.presentationController.shouldUseMotionEffect = YES;
    formSheetController.presentationController.shouldCenterVertically = YES;
    [self.parentViewController presentViewController:formSheetController animated:YES completion:nil];

}

- (void)dismiss{
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)done{
    
}

- (PHAsset*)ALAssetToPHAsset:(ALAsset*)asset{
    PHFetchOptions* fetchOptions = [[PHFetchOptions alloc]init];
    NSURL* url = [asset valueForProperty:@"ALAssetPropertyAssetURL"];
    PHFetchResult* fetchResult = [PHAsset fetchAssetsWithALAssetURLs:@[url] options:fetchOptions];
    return fetchResult.firstObject;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
