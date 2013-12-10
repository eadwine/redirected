//
//  QuoteGeneratorController.m
//  Redirected
//
//  Created by Nerijus on 12/10/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "QuoteGeneratorController.h"

@interface QuoteGeneratorController ()

@end

@implementation QuoteGeneratorController


- (IBAction)randomQuoteButtonPressed
{
    // TODO generate random quote
    [self showQuote:@"random"];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        // TODO generate random quote
        [self showQuote:@"test"];
    }
}

- (void) showQuote:(NSString *) quote
{
    // TODO set quote delegate before proceding
    [self performSegueWithIdentifier:@"ShowingQuote" sender:self];
}

@end
