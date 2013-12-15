//
//  GalleryViewController.m
//  Redirected
//
//  Created by Nerijus on 12/15/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "GalleryViewController.h"

@interface GalleryViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation GalleryViewController

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *currentImageName = [NSString stringWithFormat:@"Image%u_thumb.png", indexPath.item+1];
    UIImage *imageToDisplay = [UIImage imageNamed:currentImageName];
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageTemplate" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UICollectionViewCell alloc] init];
    }

    //cell.backgroundColor = [UIColor redColor];
    
    UIView *imageView = [cell viewWithTag:1];
    if (imageView && [imageView isKindOfClass:UIImageView.class]) {
        UIImageView *existingImageView = (UIImageView *)imageView;
        existingImageView.image = imageToDisplay;
    } else {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:imageToDisplay];
        imageView.tag = 1;
        imageView.contentMode = UIViewContentModeCenter;
        imageView.frame = cell.bounds;
        
        [cell.contentView addSubview:imageView];
    }

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSString *currentImageName = [NSString stringWithFormat:@"Image%u_thumb.png", indexPath.item+1];
    //UIImage *currentImage = [UIImage imageNamed:currentImageName];
    return CGSizeMake(150, 150);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
