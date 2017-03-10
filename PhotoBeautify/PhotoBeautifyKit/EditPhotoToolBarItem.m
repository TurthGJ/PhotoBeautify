//
//  EditPhotoToolBarItem.m
//  PhotoBeautify
//
//  Created by GJ on 2017/3/4.
//  Copyright © 2017年 GJ. All rights reserved.
//

#import "EditPhotoToolBarItem.h"
#import "Masonry.h"

@interface EditPhotoToolBarItem()
{
    float imageWidth;
    UIStackView* stackView;
    UILabel* label;
    UIImageView* imageView;
    UIButton* button;
}
@end

@implementation EditPhotoToolBarItem

- (instancetype)init:(UIImage*)image title:(NSString*)title{
    self = [super init];
    if (self) {
        [self initController];
        imageView.image = image;
        label.text = title;
        [self addSubview:stackView];
        [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(stackView.superview);
        }];
        [self addSubview:_line];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(1));
            make.width.equalTo(@(imageWidth));
            make.centerX.bottom.equalTo(_line.superview);
        }];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(button.superview);
        }];
    }
    return self;
}

- (void)initController{
    imageWidth = 22;
    __weak typeof(self) weakSelf = self;
    imageView = [[UIImageView alloc]init];
    imageView.tintColor = [UIColor whiteColor];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@(imageWidth));
    }];
    label = [[UILabel alloc]init];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:12];
    _line = [[UIView alloc]init];
    _line.hidden = YES;
    _line.backgroundColor = [UIColor whiteColor];
    button = [[UIButton alloc]init];
    [button addTarget:self action:@selector(touchUpInside) forControlEvents:UIControlEventTouchUpInside];
    stackView = [[UIStackView alloc]initWithArrangedSubviews:@[imageView,label]];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.spacing = 1;
    stackView.alignment = UIStackViewAlignmentCenter;
}

- (void)touchUpInside {
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    imageView.tintColor = [UIColor whiteColor];
    label.textColor = [UIColor whiteColor];
    _line.hidden = NO;
}

@end
