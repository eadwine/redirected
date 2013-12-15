//
//  ImageViewController.m
//  Redirected
//
//  Created by Nerijus on 12/15/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "ImageViewController.h"
#import "SocialIntegration.h"

@interface ImageViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) SocialIntegration *socialIntegration;
@end

@implementation ImageViewController

@synthesize socialIntegration = _socialIntegration;

- (IBAction)share {
    [self presentViewController:[self.socialIntegration prepareFacebookViewWithText:@"Photo from movie Redirected" image:self.imageView.image link:[NSURL URLWithString:@"http://redirectedmovie.com"]] animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.imageView.image = [UIImage imageNamed:self.imageName];
    self.imageView.contentMode = UIViewContentModeCenter;
    self.scrollView.contentSize = self.imageView.image.size;
    self.scrollView.delegate = self;
    self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
    
    // zooming to full
    [self.scrollView zoomToRect:CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height) animated:NO];
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (SocialIntegration *) socialIntegration {
    if (!_socialIntegration) {
        _socialIntegration = [[SocialIntegration alloc] init];
    }
    
    return _socialIntegration;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
