#import <Foundation/Foundation.h>
#import <Social/Social.h>

@interface SocialIntegration : NSObject

+ (BOOL) canPostToFacebook;
+ (BOOL) canPostToTwitter;

- (SLComposeViewController *) prepareFacebookViewWithText:(NSString *) shareText;

- (SLComposeViewController *) prepareFacebookViewWithText:(NSString *) shareText image:(NSURL *) imageURL;

- (SLComposeViewController *) prepareFacebookViewWithText:(NSString *) shareText image:(UIImage *) image link:(NSURL *) linkURL;

- (SLComposeViewController *) prepareFacebookViewWithText:(NSString *) shareText image:(UIImage *) image link:(NSURL *) linkURL completionHandler:(SLComposeViewControllerCompletionHandler) handler;

@end
