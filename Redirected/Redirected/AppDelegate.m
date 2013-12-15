#import "AppDelegate.h"
#import "RepertoireController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSError *error = nil;
    NSURL *modelURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Redirected" ofType:@"momd"]];
    // NOTE: Due to an iOS 5 bug, the managed object model returned is immutable.
    NSManagedObjectModel *managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] mutableCopy];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    
    // Initialize the Core Data stack
    [managedObjectStore createPersistentStoreCoordinator];
    
    NSPersistentStore __unused *persistentStore = [managedObjectStore addInMemoryPersistentStore:&error];
    NSAssert(persistentStore, @"Failed to add persistent store: %@", error);
    
    [managedObjectStore createManagedObjectContexts];
    
    // Set the default store shared instance
    [RKManagedObjectStore setDefaultStore:managedObjectStore];
    
    // Override point for customization after application launch. ========================================================
    
    // Configure the object manager
    [self configureObjectManagerWithManagedObjectStore:managedObjectStore];
    
    // Remove first tab after the premiere
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComps = [NSDateComponents new];
    [dateComps setYear:2014];
    [dateComps setMonth:1];
    [dateComps setDay:10];
    NSDate *launchDate = [calendar dateFromComponents:dateComps];
    if ([launchDate timeIntervalSinceNow] <= 0) {
        UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
        NSMutableArray *arrayOfControllers = [[NSMutableArray alloc] initWithArray:tabBarController.viewControllers];
        [arrayOfControllers removeObjectAtIndex:0];
        [tabBarController setViewControllers:arrayOfControllers];
    }
    
    return YES;
}

- (void)configureObjectManagerWithManagedObjectStore:(RKManagedObjectStore *)managedObjectStore
{
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://redirectedmovie.azurewebsites.net"]];
    objectManager.managedObjectStore = managedObjectStore;
    
    [RKObjectManager setSharedManager:objectManager];
    
    //Showtime mapping
    RKEntityMapping *showtimeMapping = [RKEntityMapping mappingForEntityForName:@"Showtime" inManagedObjectStore:managedObjectStore];
    [showtimeMapping addAttributeMappingsFromDictionary:@{@"StartDate":@"startDate",
                                                          @"EndDate":@"endDate",
                                                          @"TimeString":@"timeString"}];
    showtimeMapping.identificationAttributes = @[@"startDate", @"endDate", @"timeString"];
    //Thearte mapping
    RKEntityMapping *theatreMapping = [RKEntityMapping mappingForEntityForName:@"Theatre" inManagedObjectStore:managedObjectStore];
    [theatreMapping addAttributeMappingsFromDictionary:@{@"Branch":@"branch",
                                                         @"Theatre":@"theatre"}];
    [theatreMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"Showtimes" toKeyPath:@"showtimes" withMapping:showtimeMapping]];
    theatreMapping.identificationAttributes = @[@"theatre"];
    //Repertoire mapping
    RKEntityMapping *repertoireMapping = [RKEntityMapping mappingForEntityForName:@"Repertoire" inManagedObjectStore:managedObjectStore];
    [repertoireMapping addAttributeMappingsFromDictionary:@{@"City":@"city"}];
    [repertoireMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"Theatres" toKeyPath:@"theatres" withMapping:theatreMapping]];
    repertoireMapping.identificationAttributes = @[@"city"];
    
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:repertoireMapping
                                                                                            method:RKRequestMethodAny pathPattern:@"/api/showtimes" keyPath:nil
                                                                                       statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [objectManager addResponseDescriptor:responseDescriptor];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
