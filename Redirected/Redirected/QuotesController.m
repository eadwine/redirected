#import "QuotesController.h"
#import "FacebookIntegration.h"


@interface QuotesController ()
@property(strong, nonatomic) NSArray *actors;
@end

@implementation QuotesController

@synthesize authorTable = _authorTable;
@synthesize actors = _actors;

- (void)viewDidLoad
{
    self.actors = [[NSArray alloc] initWithObjects:
                    @"Vinnie Jones", @"Scot Williams", @"Gil Darnell", @"Oliver Jackson",nil];
    
    self.authorTable.delegate = self;
    self.authorTable.dataSource = self;
    [self.authorTable reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of objects for the specified section.
    return self.actors.count;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section at the section index.
    return @"Actors";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }

    cell.textLabel.text = [self.actors objectAtIndex: indexPath.row];
    return cell;
}


@end
