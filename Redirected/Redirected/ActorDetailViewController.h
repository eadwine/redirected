//
//  ActorDetailViewController.h
//  Redirected
//
//  Created by Nerijus on 12/8/13.
//  Copyright (c) 2013 redirectedmovie.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActorInfo.h"

@interface ActorDetailViewController : UITableViewController
@property(strong, nonatomic) ActorInfo *actorInfo;
@end
