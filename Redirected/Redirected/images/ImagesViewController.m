//
//  ImagesViewController.m
//  Redirected
//
//  Created by Nerijus on 12/16/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "ImagesViewController.h"
#import "MWPhotoBrowser.h"
#import "GalleryDelegate.h"
#import "SocialIntegration.h"

@interface ImagesViewController () <MWPhotoBrowserDelegate>
// TODO property of wallpaper or gallery mode enum?
@property (strong, nonatomic) SocialIntegration *socialIntegration;
@end

@implementation ImagesViewController

@synthesize socialIntegration = _socialIntegration;

- (IBAction)showGallery {
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    
    // Set options
    browser.displayActionButton = YES; // Show action button to allow sharing, copying, etc (defaults to YES)
    browser.displayNavArrows = NO; // Whether to display left and right nav arrows on toolbar (defaults to NO)
    browser.displaySelectionButtons = NO; // Whether selection buttons are shown on each image (defaults to NO)
    browser.zoomPhotosToFill = YES; // Images that almost fill the screen will be initially zoomed to fill (defaults to YES)
    browser.alwaysShowControls = NO; // Allows to control whether the bars and controls are always visible or whether they fade away to show the photo full (defaults to NO)
    browser.enableGrid = YES; // Whether to allow the viewing of all the photo thumbnails on a grid (defaults to YES)
    browser.startOnGrid = YES; // Whether to start on the grid of thumbnails instead of the first photo (defaults to NO)
    //browser.wantsFullScreenLayout = YES; // iOS 5 & 6 only: Decide if you want the photo browser full screen, i.e. whether the status bar is affected (defaults to YES)
    
    // Optionally set the current visible photo before displaying
    [browser setCurrentPhotoIndex:1];
    
    // Present
    [self.navigationController pushViewController:browser animated:YES];
}

- (IBAction)showWallpapers {
    // TODO
}

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
    NSString *currentImageName = [self fromattedImageNameForIndex: index+1 forFullImage: YES];
    UIImage *image = [UIImage imageNamed:currentImageName];
    
    [self presentViewController:[self.socialIntegration prepareFacebookViewWithText:@"Photo from movie Redirected"
                                                                              image:image
                                                                               link:[NSURL URLWithString:@"http://redirectedmovie.com"]]
                       animated:YES
                     completion:nil];
}

- (SocialIntegration *) socialIntegration {
    if (!_socialIntegration) {
        _socialIntegration = [[SocialIntegration alloc] init];
    }
    
    return _socialIntegration;
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
