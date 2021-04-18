//
//  AddTaskViewController.h
//  Todo
//
//  Created by Mohamed Samy on 29/03/2021.
//

#import "ViewController.h"
#import "TasksDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddTaskViewController : ViewController
@property id <TasksDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
