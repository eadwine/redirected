#import "ActorListController.h"
#import "SocialIntegration.h"
#import "Actors.h"
#import "ActorInfo.h"
#import "ActorDetailViewController.h"


@interface ActorListController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *actorTable;
@property (strong, nonatomic) ActorInfo *selectedActor;
@end

@implementation ActorListController

- (void)viewDidLoad
{
    self.actorTable.delegate = self;
    self.actorTable.dataSource = self;
    [self.actorTable reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of objects for the specified section.
    return [Actors all].count;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section at the section index.
    return @"Actors";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"actorCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];

    ActorInfo *actor = [[[Actors all] allValues] objectAtIndex: indexPath.row];
    
    cell.textLabel.text = actor.actorName;
    cell.detailTextLabel.text = actor.roleName;
    
    NSURL *url = [NSURL URLWithString: actor.remotePictureUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    cell.imageView.image = [[UIImage alloc] initWithData:data];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedActor = [[[Actors all] allValues] objectAtIndex: indexPath.row];
    
    [self performSegueWithIdentifier:@"ActorInfo" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [segue.destinationViewController setActorInfo:self.selectedActor];
}


@end
