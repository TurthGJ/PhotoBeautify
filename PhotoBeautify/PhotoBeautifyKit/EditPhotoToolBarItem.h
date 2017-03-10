//
//  EditPhotoToolBarItem.h
//  PhotoBeautify
//
//  Created by GJ on 2017/3/4.
//  Copyright © 2017年 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditPhotoToolBarItem : UIControl

@property(nonatomic,retain)UIView* line;
- (instancetype)init:(UIImage*)image title:(NSString*)title;

@end
