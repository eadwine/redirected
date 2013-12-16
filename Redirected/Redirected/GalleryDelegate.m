//
//  TODO: remove
//

#import "GalleryDelegate.h"

@implementation GalleryDelegate

- (NSString *) fromattedImageNameForIndex:(NSInteger)index forFullImage:(BOOL)full
{
    if (full) {
        return [NSString stringWithFormat:@"Image%u_full.png", index];
    }
    
    return [NSString stringWithFormat:@"Image%u_thumb.png", index];
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return 12;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    NSString *currentImageName = [self fromattedImageNameForIndex: index+1 forFullImage: YES];
    UIImage *imageToDisplay = [UIImage imageNamed:currentImageName];
    
    return [MWPhoto photoWithImage:imageToDisplay];
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    NSString *currentImageName = [self fromattedImageNameForIndex: index+1 forFullImage: NO];
    UIImage *imageToDisplay = [UIImage imageNamed:currentImageName];
    
    return [MWPhoto photoWithImage:imageToDisplay];
}
//- (MWCaptionView *)photoBrowser:(MWPhotoBrowser *)photoBrowser captionViewForPhotoAtIndex:(NSUInteger)index;
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser actionButtonPressedForPhotoAtIndex:(NSUInteger)index {
    // TODO
}

@end
