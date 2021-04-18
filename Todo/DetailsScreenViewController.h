//
//  DetailsScreenViewController.h
//  Todo
//
//  Created by Mohamed Samy on 29/03/2021.
//

#import "ViewController.h"
#import "Task.h"
#import "TasksDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsScreenViewController : ViewController
@property (weak, nonatomic) IBOutlet UILabel *taskName;
@property (weak, nonatomic) IBOutlet UILabel *taskDesc;
@property (weak, nonatomic) IBOutlet UILabel *taskStatus;
@property Task *task;
@property id <TasksDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *taskPri;
@end

NS_ASSUME_NONNULL_END
