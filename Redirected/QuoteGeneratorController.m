//
//  QuoteGeneratorController.m
//  Redirected
//
//  Created by Nerijus on 12/10/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "QuoteGeneratorController.h"
#import "QuoteController.h"
#import "Quote.h"
#import "Actors.h"

@interface QuoteGeneratorController ()
@property Quote *randomQuote;
@end

@implementation QuoteGeneratorController

- (IBAction)randomQuoteButtonPressed
{
    self.randomQuote = [Actors randomQuote];
    [self showQuoteSeque];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        self.randomQuote = [Actors randomQuote];
        [self showQuoteSeque];
    }
}

- (void) showQuoteSeque
{
    [self performSegueWithIdentifier:@"ShowingQuote" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [segue.destinationViewController setQuote:self.randomQuote];
}

@end
