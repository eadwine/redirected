#import "QuotesController.h"
#import "FacebookIntegration.h"


@interface QuotesController ()

@end

@implementation QuotesController

- (IBAction)shareToFB:(id)sender {
    [[[FacebookIntegration alloc] init] post:@"Something funny" from: @"Author"];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
