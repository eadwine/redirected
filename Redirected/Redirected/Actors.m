//
//  Actors.m
//  Redirected
//
//  Created by Nerijus on 12/8/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "Actors.h"
#import "ActorInfo.h"

@interface Actors ()

@end

static NSDictionary *actors;

@implementation Actors

+ (NSDictionary *) all {
    if (!actors) {
        actors = [[NSMutableDictionary alloc] init];
        [actors setValue: [[ActorInfo alloc] initWithName:@"Vinnie Jones"
                                                 roleName:@"Golden Pole"
                                                   quotes:nil
                                            remotePicture:@"http://ia.media-imdb.com/images/M/MV5BMTczNTg2NDk0NV5BMl5BanBnXkFtZTcwMTA0MzA5OQ@@._V1_SY317_CR14,0,214,317_.jpg"
                ] forKey:@"Vinnie_Jones"];

        [actors setValue: [[ActorInfo alloc] initWithName:@"Scot Williams"
                                                 roleName:@"Michael"
                                                   quotes: nil
                                            remotePicture:@"http://ia.media-imdb.com/images/M/MV5BNDI5ODE2MTQ1MF5BMl5BanBnXkFtZTgwODYzOTYxMDE@._V1_SX214_CR0,0,214,317_.jpg"
                ] forKey:@"Scot Williams"];
        
        [actors setValue: [[ActorInfo alloc] initWithName:@"Gil Darnell"
                                                 roleName:@"Johnny"
                                                   quotes: nil
                                            remotePicture:@"http://ia.media-imdb.com/images/M/MV5BMTY5MTAwNjk2NF5BMl5BanBnXkFtZTcwOTg3MTU3OA@@._V1_SY317_CR27,0,214,317_.jpg"
                ] forKey:@"Gil Darnell"];
        
        [actors setValue: [[ActorInfo alloc] initWithName:@"Oliver Jackson"
                                                 roleName:@"Tim"
                                                   quotes: nil
                                            remotePicture:@"http://ia.media-imdb.com/images/M/MV5BMTU3NTM3MjkyMV5BMl5BanBnXkFtZTcwMzIwMjI1Nw@@._V1_SY317_CR4,0,214,317_.jpg"
                ] forKey:@"Oliver Jackson"];
        
        [actors setValue: [[ActorInfo alloc] initWithName:@"Monika Vaiciulyte"
                                                 roleName:@"Simona"
                                                   quotes: nil
                                            remotePicture:@"http://ia.media-imdb.com/images/M/MV5BMTM2OTE2MTU5OF5BMl5BanBnXkFtZTcwNjc1ODQ0OQ@@._V1_SY317_CR130,0,214,317_.jpg"
                ] forKey:@"Monika Vaiciulyte"];
        
        [actors setValue: [[ActorInfo alloc] initWithName:@"Daniel Nehme"
                                                 roleName:@"Turk"
                                                   quotes: nil
                                            remotePicture:@"http://ia.media-imdb.com/images/M/MV5BNTIzMzY4MzEyMF5BMl5BanBnXkFtZTcwNDA1Njc4OQ@@._V1_SX214_CR0,0,214,317_.jpg"
                ] forKey:@"Daniel Nehme"];
        
        [actors setValue: [[ActorInfo alloc] initWithName:@"Andrew McHale"
                                                 roleName:@"Karl"
                                                   quotes: nil
                                            remotePicture:@"http://ia.media-imdb.com/images/M/MV5BMTk1ODAyMTAyN15BMl5BanBnXkFtZTcwMTQ0NzY4OA@@._V1_SY317_CR51,0,214,317_.jpg"
                ] forKey:@"Andrew McHale"];
        
        // TODO
    }
    
    return actors;
}

@end