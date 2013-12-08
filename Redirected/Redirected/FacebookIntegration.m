//
//  FacebookIntegration.m
//  Redirected
//
//  Created by Nerijus on 12/7/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "FacebookIntegration.h"

@interface  FacebookIntegration ()

@end

@implementation FacebookIntegration

- (void) post: (NSString *) quote from: (NSString *) author {
         NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
             quote, @"name",
             author, @"caption",
             @"Quote from movie Redirected", @"description",
             @"http://www.imdb.com/title/tt2275946/", @"link",
             @"https://raw.github.com/fbsamples/ios-3.x-howtos/master/Images/iossdk_logo.png", @"picture",//TODO
                 nil];
                [FBWebDialogs presentFeedDialogModallyWithSession:[FBSession activeSession]
                              parameters:params
                              handler:
                 ^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
                     if(error) {
                         NSLog(@"Error: %@", error.description);
                     } else {
                         NSLog(@"Success!");
                     }
                 }];
}

/*NSURL* url = [NSURL URLWithString:@"http://www.imdb.com/title/tt2275946/"];
FBShareDialogParams * params = [[FBShareDialogParams alloc] init];
params.link = url;
params.name = @"Quote from movie Redirected";
params.description = @"some parameter";*/


    /*if ([FBDialogs canPresentOSIntegratedShareDialogWithSession: self.fbSession]) {
        [FBDialogs presentOSIntegratedShareDialogModallyFrom: view
                                                     session: self.fbSession
                                                 initialText:@"Quote from movie Redirected"
                                                      images:nil
                                                        urls:nil
                                                     handler:^(FBOSIntegratedShareDialogResult result, NSError *error) {
                                                         // TODO
                                                     }];
    }*/
    
    /*if ([FBDialogs canPresentShareDialogWithParams:params]) {
        [FBDialogs presentShareDialogWithParams:params
                   clientState:nil
                    handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
                            if (error) {
                                NSLog(@"Error: %@", error.description);
                              } else {
                                NSLog(@"Success!");
                               }
                             }];
    }*/

/*- (BOOL)initSession {
    self.fbSession = [FBSession activeSession];
    if (!self.fbSession) {
        NSArray *permissions = [NSArray arrayWithObjects:@"publish_actions", nil];
        return [FBSession openActiveSessionWithPublishPermissions:permissions
                          defaultAudience:FBSessionDefaultAudienceFriends
                          allowLoginUI:YES
                          completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
                                          if(error) {
                                              NSLog(@"Error: %@", error.description);
                                          } else {
                                              self.fbSession = session;
                                              NSLog(@"Success!");
                                          }
                                      }];
    } else {
        return YES;
    }
}*/

@end
