//
//  TasksDelegate.h
//  Todo
//
//  Created by Mohamed Samy on 30/03/2021.
//


#import "Task.h"

@protocol TasksDelegate <NSObject>

-(void)addTask: (Task*) task;
-(void)updateTask: (Task*) oldTask : (Task*) newTask;

@end

