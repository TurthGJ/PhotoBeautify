//
//  UIImage+AddAsset.h
//  PhotoBeautify
//
//  Created by GJ on 2017/3/10.
//  Copyright © 2017年 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Aside1,
    Call1,
    Call2,
    Call3,
    Say1,
    Say2,
    Say3,
    Think1,
    Think2,
    Think3,
    Image_sticker_aside,
    Image_sticker_call,
    Image_sticker_say,
    Image_sticker_think,
    Btn_icon_back_normal,
    Btn_icon_sticker_delete_normal,
    Btn_icon_sticker_delete_pressed,
    Btn_icon_sticker_edit_normal,
    Btn_icon_sticker_edit_pressed,
    Btn_icon_sticker_text_normal,
    Btn_icon_sticker_turn1_pressed,
    Btn_icon_sticker_turn2_normal,
    Btn_icon_sticker_turn2_pressed,
    BubbleButton,
    FilterButton,
    StickerButton,
    Image_icon_filter,
    CrystalFilter,
    OldPictureFilter,
    OriginalFilter,
    PixellateFaceFilter,
    PosterizeFilter
} Asset;

@interface UIImage (AddAsset)

- (instancetype)init:(Asset)asset;

@end
