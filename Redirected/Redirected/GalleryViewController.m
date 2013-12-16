//
//  TODO: remove
//

#import "GalleryViewController.h"
#import "ImageViewController.h"

@interface GalleryViewController ()

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSInteger selectedImageIndex;

- (NSString *) fromattedImageNameForIndex:(NSInteger)index forFullImage:(BOOL)full;

@end

@implementation GalleryViewController

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

- (NSString *) fromattedImageNameForIndex:(NSInteger)index forFullImage:(BOOL)full
{
    if (full) {
        return [NSString stringWithFormat:@"Image%u_full.png", index];
    }
    
    return [NSString stringWithFormat:@"Image%u_thumb.png", index];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *currentImageName = [self fromattedImageNameForIndex: indexPath.item+1 forFullImage: NO];
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

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedImageIndex = indexPath.item;
    [self performSegueWithIdentifier:@"ShowFullImage" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [segue.destinationViewController setImageName:[self fromattedImageNameForIndex: self.selectedImageIndex+1 forFullImage: YES]];
}

@end
