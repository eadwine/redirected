//
//  QuoteController.m
//  Redirected
//
//  Created by Nerijus on 12/10/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "QuoteController.h"

@interface QuoteController ()

@property(strong, nonatomic) SocialIntegration *socialIntegration;

@property (weak, nonatomic) IBOutlet UILabel *quoteLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

- (NSString *) formattedQuote;

@end

@implementation QuoteController

@synthesize socialIntegration = _socialIntegration;

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.quoteLabel.text = [NSString stringWithFormat:@"\"%@\"", self.quote.text];
    self.authorLabel.text = self.quote.author;
}

- (IBAction)shareOnFacebook
{
    [self presentViewController:[self.socialIntegration prepareFacebookViewWithText:[self formattedQuote]
                                                                              image:nil
                                                                               link:[NSURL URLWithString:@"http://redirectedmovie.com"]] animated:YES completion:nil];
}

- (NSString *) formattedQuote
{
    return [NSString stringWithFormat:@"\"%@\" - %@, movie Redirected", self.quote.text, self.quote.author];
}

- (SocialIntegration *) socialIntegration
{
    if (!_socialIntegration) {
        _socialIntegration = [[SocialIntegration alloc] init];
    }
    return _socialIntegration;
}

@end
