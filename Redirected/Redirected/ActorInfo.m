//
//  ActorInfo.m
//  Redirected
//
//  Created by Nerijus on 12/8/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "ActorInfo.h"

@implementation ActorInfo

- (id) initWithName:(NSString *) name
           roleName:(NSString *) roleName {
    
    self = [super init];
    if ([super init]) {
        self.actorName = name;
        self.roleName = roleName;
    }
    
    return self;
}

@end
