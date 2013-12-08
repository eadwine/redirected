#import "QuotesController.h"
#import "FacebookIntegration.h"


@interface QuotesController ()
@property(strong, nonatomic) NSDictionary *actors;
@end

@implementation QuotesController

@synthesize authorTable = _authorTable;
@synthesize actors = _actors;

- (void)viewDidLoad
{
    self.actors = [[NSDictionary alloc] initWithObjects: [[NSArray alloc] initWithObjects:
                                                            @"http://ia.media-imdb.com/images/M/MV5BMTczNTg2NDk0NV5BMl5BanBnXkFtZTcwMTA0MzA5OQ@@._V1_SX640_SY720_.jpg",
                                                            @"http://ia.media-imdb.com/images/M/MV5BNDI5ODE2MTQ1MF5BMl5BanBnXkFtZTgwODYzOTYxMDE@._V1_SX640_SY720_.jpg",
                                                            @"http://ia.media-imdb.com/images/M/MV5BMTY5MTAwNjk2NF5BMl5BanBnXkFtZTcwOTg3MTU3OA@@._V1_SX640_SY720_.jpg", nil]
                                                  forKeys:[[NSArray alloc] initWithObjects:
                                                           @"Vinnie Jones", @"Scot Williams", @"Gil Darnell", nil]];
    
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }

    cell.textLabel.text = [[[self.actors keyEnumerator] allObjects] objectAtIndex: indexPath.row];
    
    NSURL *url = [NSURL URLWithString: [self.actors objectForKey: cell.textLabel.text]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    cell.imageView.image = [[UIImage alloc] initWithData:data];
    return cell;
}


@end
