//
//  DetailsScreenViewController.m
//  Todo
//
//  Created by Mohamed Samy on 29/03/2021.
//

#import "DetailsScreenViewController.h"
#import "EditViewController.h"
#import "Task.h"
@interface DetailsScreenViewController ()
@property (weak, nonatomic) IBOutlet UILabel *date;
@end

@implementation DetailsScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _taskName.text = _task.name;
    _taskDesc.text = _task.desc;
    _taskPri.text = _task.pri;
    _taskStatus.text = _task.status;
    _date.text = _task.dateOfCreation;
    
   }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    EditViewController *screenTwo = segue.destinationViewController;
    screenTwo.task = _task;
    screenTwo.delegate = _delegate;
}

@end
