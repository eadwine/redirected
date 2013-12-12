#import "RepertoireController.h"

@interface RepertoireController ()
@property (weak, nonatomic) IBOutlet UITableView *repertoireTable;
@end

@implementation RepertoireController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.repertoireTable.delegate = self;
    self.repertoireTable.dataSource = self;
    [self.repertoireTable reloadData];
    
    
    //[[RKObjectManager sharedManager] getObjectsAtPath:@"/gists/public" parameters:nil success:nil failure:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    //NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    //cell.textLabel.text = [[object valueForKey:@"descriptionText"] description];
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return nil;
}

@end
