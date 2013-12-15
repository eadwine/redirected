#import "RepertoireController.h"

@interface RepertoireController ()

@end

@implementation RepertoireController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.managedObjectContext = [RKObjectManager sharedManager].managedObjectStore.mainQueueManagedObjectContext;
    
    [self loadRepertoire];
    [self.refreshControl beginRefreshing];
}

- (IBAction)loadRepertoire
{
    [[RKObjectManager sharedManager] getObjectsAtPath:@"/api/showtimes" parameters:nil
        success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
            [self.refreshControl endRefreshing];
        } failure:^(RKObjectRequestOperation *operation, NSError *error) {
            [self.refreshControl endRefreshing];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"An Error Has Occurred" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}

/*- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    UILabel *header = [UILabel new];
    header.text = [[[sectionInfo objects] objectAtIndex:0] valueForKeyPath:@"theatre.repertoire.city"];
    header.font = [UIFont fontWithName:@"BebasNeue" size:10];
    return header;
}*/

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [[[sectionInfo objects] objectAtIndex:0] valueForKeyPath:@"theatre.repertoire.city"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"repertoireCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = [object valueForKeyPath:@"theatre.theatre"];
    cell.detailTextLabel.text = [[object valueForKey:@"timeString"] description];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Press Serif Cool" size:14];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Showtime"];
    
    NSSortDescriptor *citySortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"theatre.repertoire.city" ascending:YES];
    NSSortDescriptor *theatreSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeString" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[citySortDescriptor, theatreSortDescriptor]];
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"theatre.repertoire.city" cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();//TODO
	}
    
    return _fetchedResultsController;
}

#pragma mark - Fetched Results Controller

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView reloadData];
}

@end
