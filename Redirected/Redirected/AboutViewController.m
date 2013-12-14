#import "AboutViewController.h"

@interface AboutViewController ()

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation AboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 //   UIScrollView *tempScrollView=(UIScrollView *)self.view;
 //   tempScrollView.contentSize=CGSizeMake(5280,5960);
    
 //   UILabel *label = [[UILabel alloc] init];
 //   [label setText:@"VERY LONG TEXT WDWD WDW DW DW DW DW D  DWDWDWDWD WD WDW D"];
 //   [tempScrollView addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
