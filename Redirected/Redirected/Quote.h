//
//  Quote.h
//  Redirected
//
//  Created by Nerijus on 12/12/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quote : NSObject

@property NSString *author;
@property NSString *text;

-(id) initWithText:(NSString *)text fromAuthor:(NSString *)author;

@end
