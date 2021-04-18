//
//  Task.h
//  Todo
//
//  Created by Mohamed Samy on 29/03/2021.
//

#ifndef Task_h
#define Task_h

@interface Task : NSObject
@property NSString *name;
@property NSString *desc;
@property NSString *pri;
@property NSString *status;
@property NSString *dateOfCreation;

-(id)initWithValues:(NSString*)name : (NSString*)description : (NSString*) pri : (NSString*) stat;

@end

#endif /* Task_h */
