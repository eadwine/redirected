//
//  ActorInfo.h
//  Redirected
//
//  Created by Nerijus on 12/8/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActorInfo : NSObject

@property NSString *actorName;
@property NSString *roleName;
@property NSArray *quotes;
@property NSString *remotePictureUrl;

- (id) initWithName: (NSString *) name
           roleName: (NSString *) roleName;

- (id) initWithName: (NSString *) name
           roleName: (NSString *) roleName
             quotes: (NSArray *) quotes;

- (id) initWithName: (NSString *) name
           roleName: (NSString *) roleName
             quotes: (NSArray *) quotes
      remotePicture: (NSString *) remotePictureUrl;

@end
