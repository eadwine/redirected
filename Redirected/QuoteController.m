//
//  QuoteController.m
//  Redirected
//
//  Created by Nerijus on 12/10/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "QuoteController.h"
#import "SocialIntegration.h"
#import <Social/Social.h>

@interface QuoteController ()
@property(strong, nonatomic) SocialIntegration *socialIntegration;
@end

@implementation QuoteController

@synthesize socialIntegration = _socialIntegration;

- (IBAction)shareOnFacebook {
    [self presentViewController:[self.socialIntegration prepareFacebookViewWithText:@"Test quote"] animated:YES completion:nil];
}

- (SocialIntegration *) socialIntegration {
    if (!_socialIntegration) {
        _socialIntegration = [[SocialIntegration alloc] init];
    }
    return _socialIntegration;
}

@end
