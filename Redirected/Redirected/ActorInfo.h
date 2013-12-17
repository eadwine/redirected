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
@property NSDate *birthDate;
@property NSString *roleName;
@property NSArray *quotes;
@property NSInteger movieCount;
@property NSString *bestRoles;
@property NSString *shortDescription;
@property NSString *remotePictureUrl;
@property NSString *localPicture;

- (id) initWithName: (NSString *) name
           roleName: (NSString *) roleName;

@end
