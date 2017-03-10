//
//  ViewController.m
//  PhotoBeautify
//
//  Created by GJ on 2017/3/1.
//  Copyright © 2017年 GJ. All rights reserved.
//

#import "EntranceViewController.h"
#import "PBIconButton.h"
#import "Masonry.h"
#import "BSImagePickerController.h"
#import "UIViewController+BSImagePicker.h"
#import "EditPhotoViewController.h"

@interface EntranceViewController ()
{
    PBIconButton* beatifyPhotoBtn;
    PBIconButton* mergePhotosBtn;
    UIStackView* stackView;
    UIView* line;
}

@end

@implementation EntranceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(stackView.superview);
    }];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(245));
        make.height.equalTo(@(1));
        make.center.equalTo(line.superview);
    }];
    
}

- (void)initController
{
    beatifyPhotoBtn = [[PBIconButton alloc]init:[UIImage imageNamed:@"EditPhotoEntranceButton"] title:@"美化"];
    [beatifyPhotoBtn addTarget:self action:@selector(editPhoto) forControlEvents:UIControlEventTouchUpInside];
    mergePhotosBtn = [[PBIconButton alloc]init:[UIImage imageNamed:@"CollageEntranceButton"] title:@"拼图"];
    [mergePhotosBtn addTarget:self action:@selector(makeCollage) forControlEvents:UIControlEventTouchUpInside];
    stackView = [[UIStackView alloc]initWithArrangedSubviews:@[beatifyPhotoBtn,mergePhotosBtn]];
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.spacing = 0;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFillEqually;
    line = [[UIView alloc]init];
    line.backgroundColor = [UIColor whiteColor];
}

- (void)editPhoto{
    BSImagePickerController* viewController = [[BSImagePickerController alloc]initWithNibName:nil bundle:nil];
    viewController.maximumNumberOfImages = 1;
    [self presentPicker:viewController finish:^(NSArray *assets) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (assets.firstObject) {
                EditPhotoViewController* edpViewController = [[EditPhotoViewController alloc]init:assets];
                UINavigationController* navViewController = [[UINavigationController alloc]initWithRootViewController:edpViewController];
                [self dismissViewControllerAnimated:true completion:nil];
                [self presentViewController:navViewController animated:true completion:nil];
            }
        });
    }];
}

- (void)makeCollage{
    NSLog(@"makeCollage");
}

- (void)presentPicker:(BSImagePickerController*)picker finish:(void (^)(NSArray *assets))finish{
    [self presentImagePickerController:picker animated:true completion:nil toggle:nil cancel:^(NSArray* asssets){
        [self dismissViewControllerAnimated:true completion:nil];
    }finish:finish];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
