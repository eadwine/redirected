//
//  FacebookIntegration.m
//  Redirected
//
//  Created by Nerijus on 12/7/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import "FacebookIntegration.h"
#import <FacebookSDK/FacebookSDK.h>

@interface  FacebookIntegration ()

@property(strong, nonatomic) FBSession * fbSession;

@end

@implementation FacebookIntegration

@synthesize fbSession = _fbSession;

- (void) postFromView: (UIViewController *) view {
    NSURL* url = [NSURL URLWithString:@"http://www.imdb.com/title/tt2275946/"];
    FBShareDialogParams * params = [[FBShareDialogParams alloc] init];
    params.link = url;
    params.name = @"Quote from movie Redirected";
    params.description = @"some parameter";
    
    if ([FBDialogs canPresentShareDialogWithParams:params]) {
        [FBDialogs presentShareDialogWithParams:params
                   clientState:nil
                   handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
                           if(error) {
                             NSLog(@"Error: %@", error.description);
                           } else {
                             NSLog(@"Success!");
                           }
                         }];

    } else {
        if ([self initSession]) {
            if ([FBDialogs canPresentOSIntegratedShareDialogWithSession: self.fbSession]) {
                [FBDialogs presentOSIntegratedShareDialogModallyFrom: view
                           session: self.fbSession
                           initialText:@"Quote from movie Redirected"
                           images:nil
                           urls:nil
                           handler:^(FBOSIntegratedShareDialogResult result, NSError *error) {
                               // TODO
                           }];
            }
        } else {
            // TODO notify that posting failed
        };
    };
}

- (BOOL)initSession {
    if (!self.fbSession) {
        NSArray *permissions = [NSArray arrayWithObjects:@"publish_actions", nil];
        return [FBSession openActiveSessionWithPublishPermissions:permissions
                          defaultAudience:FBSessionDefaultAudienceFriends
                          allowLoginUI:YES
                          completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
                                          /* handle success + failure in block */
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
}

@end
