//
//  FilterPickerViewController.h
//  PhotoBeautify
//
//  Created by GJ on 2017/3/7.
//  Copyright © 2017年 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,FilterCellType) {
    Original,
    Sepia,
    Posterize,
    Crystal,
    PixellateFace,
    Count
};

@class FilterPickerViewController;

@protocol FilterPickerViewControllerDelegate <NSObject>

- (void)filterPickerViewController:(FilterPickerViewController*)filterPickerViewController didSelectFilter:(FilterCellType)filter;

@end

@interface FilterPickerViewController : UIViewController

@property(weak,nonatomic)id<FilterPickerViewControllerDelegate>delegate;

@end


