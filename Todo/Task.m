//
//  Task.m
//  Todo
//
//  Created by Mohamed Samy on 29/03/2021.
//

#import <Foundation/Foundation.h>
#import "Task.h"
@implementation Task

-(id)initWithValues:(NSString*)name : (NSString*)desc : (NSString*) pri : (NSString*) stat{
    self = [super init];
    _name = name;
    _desc = desc;
    _pri = pri;
    _status = stat;
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss a"];
    // or  if you prefer the time with AM/PM
    _dateOfCreation = [dateFormatter stringFromDate:[NSDate date]];
    return self;
}

@end
