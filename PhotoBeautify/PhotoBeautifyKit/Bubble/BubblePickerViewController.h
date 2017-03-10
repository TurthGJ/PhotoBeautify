//
//  BubblePickerViewController.h
//  PhotoBeautify
//
//  Created by GJ on 2017/3/9.
//  Copyright © 2017年 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BubblePickerViewController;

@protocol BubblePickerViewControllerDelegate <NSObject>

- (void)BubblePickerViewController:(BubblePickerViewController*)filterPickerViewController didSelectFilter:(NSInteger)index;

@end

@interface BubblePickerViewController : UIViewController
@property(weak,nonatomic)id<BubblePickerViewControllerDelegate>delegate;
@end
