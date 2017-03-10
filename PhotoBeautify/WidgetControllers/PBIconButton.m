//
//  PBIconButton.m
//  PhotoBeautify
//
//  Created by GJ on 2017/3/1.
//  Copyright © 2017年 GJ. All rights reserved.
//

#import "PBIconButton.h"
#import "Masonry.h"

@interface PBIconButton()
{
    float imageWidth;
    UIButton* button;
    UIImageView* imageView;
    UILabel* label;
    UIStackView* stackView;
}
@end

@implementation PBIconButton

-(instancetype)init:(UIImage*)imgae title:(NSString*)title
{
    self = [super init];
    if (self) {
        [self initWidgets];
        imageView.image = imgae;
        label.text = title;
        [self addSubview:stackView];
        [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(stackView.superview);
        }];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(button.superview);
        }];
    }
    return self;
}

- (void)initWidgets{
    imageView = [[UIImageView alloc]init];
    imageView.tintColor = [UIColor whiteColor];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(imageView);
    }];
    button = [[UIButton alloc]init];
    [button addTarget:self action:@selector(touchUpInside) forControlEvents:UIControlEventTouchUpInside];
    
    label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:18];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    stackView = [[UIStackView alloc]initWithArrangedSubviews:@[imageView,label]];
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.spacing = 35;
    stackView.axis = UILayoutConstraintAxisVertical;
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(label.superview);
    }];
}

- (void)touchUpInside {
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}

@end
