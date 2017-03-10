//
//  BubblePickerViewController.m
//  PhotoBeautify
//
//  Created by GJ on 2017/3/9.
//  Copyright © 2017年 GJ. All rights reserved.
//

#import "BubblePickerViewController.h"
#import "Masonry.h"

@interface BubblePickerViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView* _collectionView;
    NSDictionary* _bubbleModleDic;
}

@end

@implementation BubblePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"气泡";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initCollectionView];
    [self initBubbleModel];
    
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
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_collectionView.superview).offset(0);
        make.bottom.equalTo(_collectionView.superview).offset(0);
        make.left.right.equalTo(_collectionView.superview).offset(0);
    }];
}

- (void)initBubbleModel {
    _bubbleModleDic = @{@(0):@"Aside1",
                        @(1):@"Call1",
                        @(2):@"Call2",
                        @(3):@"Call3",
                        @(4):@"Say1",
                        @(5):@"Say2",
                        @(6):@"Say3",
                        @(7):@"Think1",
                        @(8):@"Think2",
                        @(9):@"Think3"
                        };
}

//MARK: CollectionView Data Source
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _bubbleModleDic.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:239 green:226 blue:255 alpha:1];
    for (id view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    UIImageView* imageView = [[UIImageView alloc]init];
    NSInteger row = indexPath.row;
    if (row < _bubbleModleDic.count) {
        NSString* imageUrl = [_bubbleModleDic objectForKey:@(row)];
        imageView.image = [UIImage imageNamed:imageUrl];
    }
    CGRect frame = imageView.frame;
    frame.size.height = cell.frame.size.height;
    frame.size.width = cell.frame.size.width;
    imageView.frame = frame;
    [cell.contentView addSubview:imageView];
    return cell;
}

//MARK: CollectionView delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath) {
        
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
