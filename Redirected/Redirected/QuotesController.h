#import <UIKit/UIKit.h>

@interface QuotesController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *authorTable;
@end
