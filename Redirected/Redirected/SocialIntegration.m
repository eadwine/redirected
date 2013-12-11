#import "SocialIntegration.h"

@interface  SocialIntegration ()
@property (strong, nonatomic) SLComposeViewController *facebookViewController;
@end

// TODO make singleton?
@implementation SocialIntegration

@synthesize facebookViewController = _facebookViewController;

+ (BOOL) canPostToFacebook {
    return [SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook];
}

+ (BOOL) canPostToTwitter {
    return [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter];
}

// Calling from ViewController
//[self presentViewController:mySLComposerSheet animated:YES completion:nil];
- (SLComposeViewController *) prepareFacebookViewWithText:(NSString *) shareText
{
    return [self prepareFacebookViewWithText:shareText image:nil];
}

// Creating an Image
// [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]]]
// [UIImage imageNamed:@"local-image.jpg"]]
- (SLComposeViewController *) prepareFacebookViewWithText:(NSString *) shareText
                                                    image:(UIImage *) image
{
    
    return [self prepareFacebookViewWithText:shareText image:image link:nil];
}

// Creating an URL
// [NSURL URLWithString:@"http://yourURL.com"]]
- (SLComposeViewController *) prepareFacebookViewWithText:(NSString *) shareText
                                                    image:(UIImage *) image
                                                     link:(NSURL *) linkURL
{
    return [self prepareFacebookViewWithText:shareText image:image link:linkURL completionHandler:nil];
}

//Handler implementation
//switch (result) {
//    case SLComposeViewControllerResultCancelled:
//        NSLog(@"Post Canceled");
//        break;
//    case SLComposeViewControllerResultDone:
//        NSLog(@"Post Sucessful");
//        break;
//    default:
//        break;
//}
- (SLComposeViewController *) prepareFacebookViewWithText:(NSString *) shareText
                                                    image:(UIImage *) image
                                                     link:(NSURL *) linkURL
                                        completionHandler:(SLComposeViewControllerCompletionHandler) handler
{
    [self.facebookViewController setInitialText:shareText];
    [self.facebookViewController addImage:image];
    [self.facebookViewController addURL:linkURL];
    [self.facebookViewController setCompletionHandler:handler];
    
    return self.facebookViewController;
}

- (SLComposeViewController *) facebookViewController
{
    if (!_facebookViewController) {
        _facebookViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    }
    
    return _facebookViewController;
}

/*#import <FacebookSDK/FacebookSDK.h>
- (void) postWebBased {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"text", @"name",
                                   @"text", @"caption",
                                   @"text", @"description",
                                   @"url", @"link",
                                   @"img url", @"picture",//TODO
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
}*/

@end
