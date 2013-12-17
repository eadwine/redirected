//
//  Actors.h
//  Redirected
//
//  Created by Nerijus on 12/8/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActorInfo.h"
#import "Quote.h"

@interface Actors : NSObject

+ (NSDictionary *) all;
+ (ActorInfo *) actorByName:(NSString *)name;

+ (ActorInfo *) randomActorContainingQuotes: (BOOL)withQuotes;
+ (Quote *) randomQuote;

@end
