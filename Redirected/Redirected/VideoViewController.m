//
//  VideoViewController.m
//  Redirected
//
//  Created by Nerijus on 12/11/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *youTubeView;
@end

@implementation VideoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    if (self.youTubeView != nil) {
        NSString *videoUrl = @"http://youtube.googleapis.com/v/InKMG9Cckqw";
        NSString *htmlString = [NSString stringWithFormat:@"<html>"
                                "<head><meta name=\"viewport\" content=\"initial-scale=1.0, user-scalable=no, width=%f\"/></head>"
                                "<body style=\"background:#F00;margin-top:0px;margin-left:0px\">"
                                "<div><object width=\"%f\" height=\"%f\">"
                                "<param name=\"movie\" value=\"%@&f=gdata_videos\"></param>"
                                "<param name=\"wmode\" value=\"transparent\"></param>"
                                "<embed src=\"%@&f=gdata_videos\" type=\"application/x-shockwave-flash\" wmode=\"transparent\" width=\"%f\" height=\"%f\"></embed>"
                                "</object></div></body></html>",
                                self.youTubeView.frame.size.width,
                                self.youTubeView.frame.size.width,
                                self.youTubeView.frame.size.height,
                                videoUrl,
                                videoUrl,
                                self.youTubeView.frame.size.width,
                                self.youTubeView.frame.size.height];
        
        [self.youTubeView loadHTMLString:htmlString baseURL:[NSURL URLWithString:@"http://redirectedmovie.com"]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
