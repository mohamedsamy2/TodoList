//
//  ViewController.h
//  Todo
//
//  Created by Mohamed Samy on 29/03/2021.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)indexChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;


@end

