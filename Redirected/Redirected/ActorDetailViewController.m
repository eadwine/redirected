//
//  ActorDetailViewController.m
//  Redirected
//
//  Created by Nerijus on 12/8/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "ActorDetailViewController.h"

@interface ActorDetailViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *birthDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *aboutLabel;
@property (strong, nonatomic) IBOutlet UILabel *roleLabel;
@property (strong, nonatomic) IBOutlet UILabel *movieCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *knownAsLabel;
@end

@implementation ActorDetailViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString: self.actorInfo.remotePictureUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    self.photoView.contentMode = UIViewContentModeScaleAspectFit;
    self.photoView.image = [[UIImage alloc] initWithData:data];
    //self.photoView.bounds = CGRectMake(0, 0, self.photoView.image.size.width, self.photoView.image.size.height);
    
    
    self.nameLabel.text = self.actorInfo.actorName? self.actorInfo.actorName : @"-";
    if (self.actorInfo.birthDate) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"yyyy-DD-mm"];
        self.birthDateLabel.text = [dateFormatter stringFromDate:self.actorInfo.birthDate];
    } else {
        self.birthDateLabel.text = @"-";
    }
    
    self.aboutLabel.text = self.actorInfo.shortDescription? self.actorInfo.shortDescription : @"-";
    self.roleLabel.text = self.actorInfo.roleName? self.actorInfo.roleName : @"-";
    self.movieCountLabel.text = self.actorInfo.movieCount? [NSString stringWithFormat:@"%d", self.actorInfo.movieCount] : @"-";
    self.knownAsLabel.text = self.actorInfo.bestRoles? self.actorInfo.bestRoles : @"-";
}

@end
