//
//  FilterPickerViewController.m
//  PhotoBeautify
//
//  Created by GJ on 2017/3/7.
//  Copyright © 2017年 GJ. All rights reserved.
//

#import "FilterPickerViewController.h"
#import "Masonry.h"
#import "LDDefine.h"

@interface FilterPickerViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView* _collectionView;
}

@end

@implementation FilterPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"滤镜";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initCollectionView];
    
    UIBarButtonItem* leftButton = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
}

- (void)initCollectionView{
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc]init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
    __weak typeof(self) weakSelf = self;
    NSLog(@"%@",self.topLayoutGuide);
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_collectionView.superview).offset(0);
        make.bottom.equalTo(_collectionView.superview).offset(0);
        make.left.right.equalTo(_collectionView.superview).offset(0);
    }];
}

- (UICollectionViewCell*)makeFilterCell:(NSIndexPath*)indexPath{
    UICollectionViewCell* cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:239 green:226 blue:255 alpha:1];
    for (id view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    UIImageView* imageView = [[UIImageView alloc]init];
    CGRect frame = imageView.frame;
    frame.size.height = cell.frame.size.height;
    frame.size.width = cell.frame.size.width;
    imageView.frame = frame;
    [cell.contentView addSubview:imageView];
    
    FilterCellType type = indexPath.row;
    switch (type) {
        case Original:
            imageView.image = [UIImage imageNamed:@"OriginalFilter"];
            break;
        case Sepia:
            imageView.image = [UIImage imageNamed:@"OldPictureFilter"];
        case Posterize:
            imageView.image = [UIImage imageNamed:@"PosterizeFilter"];
            break;
        case PixellateFace:
            imageView.image = [UIImage imageNamed:@"PixellateFaceFilter"];
            break;
        case Crystal:
            imageView.image = [UIImage imageNamed:@"CrystalFilter"];
            break;
        default:
            break;
    }
    return cell;
}

- (void)handleSelectFilter:(FilterCellType)type {
    switch (type) {
        case Original:
            [_delegate filterPickerViewController:self didSelectFilter:Original];
            break;
        case Sepia:
            [_delegate filterPickerViewController:self didSelectFilter:Sepia];
            break;
        case Posterize:
            [_delegate filterPickerViewController:self didSelectFilter:Posterize];
            break;
        case PixellateFace:
            [_delegate filterPickerViewController:self didSelectFilter:PixellateFace];
            break;
        case Crystal:
            [_delegate filterPickerViewController:self didSelectFilter:Crystal];
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:true completion:nil];
}

//MARK: CollectionView Data Source
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return Count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [self makeFilterCell:indexPath];
}

//MARK: CollectionView delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath) {
        [self handleSelectFilter:indexPath.row];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(collectionView.frame.size.width/2 - 15,collectionView.frame.size.width/2 - 15);
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
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
