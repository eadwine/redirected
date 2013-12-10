//
//  QuoteController.m
//  Redirected
//
//  Created by Nerijus on 12/10/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "QuoteController.h"
#import "FacebookIntegration.h"

@interface QuoteController ()
@property(strong, nonatomic) FacebookIntegration *facebookIntegration;
@end

@implementation QuoteController

@synthesize facebookIntegration = _facebookIntegration;

- (IBAction)shareOnFacebook {
    [self.facebookIntegration post:@"Test quote" from:@"Test author"];
}

- (FacebookIntegration *) facebookIntegration {
    if (!_facebookIntegration) {
        _facebookIntegration = [[FacebookIntegration alloc] init];
    }
    return _facebookIntegration;
}

@end
