//
//  Quote.m
//  Redirected
//
//  Created by Nerijus on 12/12/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "Quote.h"

@implementation Quote

-(id) initWithText:(NSString *)text fromAuthor:(NSString *)author
{
    self = [self init];
    if (self) {
        self.text = text;
        self.author = author;
    }
    
    return self;
}

@end
