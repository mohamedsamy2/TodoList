//
//  EditViewController.h
//  Todo
//
//  Created by Mohamed Samy on 29/03/2021.
//

#import "ViewController.h"
#import "Task.h"
#import "TasksDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditViewController : ViewController
@property Task *task;
@property id <TasksDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
