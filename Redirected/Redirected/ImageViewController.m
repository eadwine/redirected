//
//  ImageViewController.m
//  Redirected
//
//  Created by Nerijus on 12/15/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ImageViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
