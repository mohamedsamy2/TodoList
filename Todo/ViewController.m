//
//  ViewController.m
//  Todo
//
//  Created by Mohamed Samy on 29/03/2021.
//

#import "ViewController.h"
#import "Task.h"
#import "DetailsScreenViewController.h"
#import "TasksDelegate.h"
#import "AddTaskViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, TasksDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property NSMutableArray *tasks;
@property NSMutableArray *highPriority;
@property NSMutableArray *mediumPriority;
@property NSMutableArray *lowPriority;
@property NSArray *displayedTasks;
@property NSPredicate* predicate;
@property NSArray *nameData;
@property NSArray *descData;
@property NSArray *statusData;
@property NSArray *priorityData;
@property NSString *property;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _highPriority = [NSMutableArray new];
    _lowPriority = [NSMutableArray new];
    _mediumPriority = [NSMutableArray new];
    _tasks = [NSMutableArray arrayWithObjects:[[Task alloc] initWithValues:@"Task 1" : @"task 1 description" :@"High" :@"In Progress"],[[Task alloc] initWithValues:@"Task 2" : @"task 2 description" :@"Medium" :@"Done"],[[Task alloc] initWithValues:@"Task 3" : @"task 3 description" :@"Low" :@"Todo"],[[Task alloc] initWithValues:@"Task 4" : @"task 3 description" :@"Low" :@"Todo"], nil];
    _displayedTasks = _tasks;
   
    [self.tableView reloadData];

//    _property = @"High";
//    _predicate = [NSPredicate predicateWithFormat:@"pri = %@", _property];
//    _highPriority = [_tasks filteredArrayUsingPredicate:_predicate];
//
//    _property = @"Medium";
//    _predicate = [NSPredicate predicateWithFormat:@"pri = %@", _property];
//    _mediumPriority = [_tasks filteredArrayUsingPredicate:_predicate];
//
//    _property = @"Low";
//    _predicate = [NSPredicate predicateWithFormat:@"pri = %@", _property];
//    _lowPriority = [_tasks filteredArrayUsingPredicate:_predicate];
//
//
//
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"tasks" ofType:@"plist"];
//    NSDictionary *db = [[NSDictionary alloc] initWithContentsOfFile:path];
//    _descData = [db objectForKey:@"desc"];
//    _statusData = [db objectForKey:@"status"];
//    _priorityData = [db objectForKey:@"priority"];
//    _nameData = [db objectForKey:@"name"];
//    NSLog(@"%@ %@ %@ %@",_descData[0], _statusData[0],_priorityData[0], _nameData[0]);
//

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_segment.selectedSegmentIndex == 4) {
        return 3;
    }
    else
        return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UIImage *img;
    
    if (_segment.selectedSegmentIndex!=4) {
        cell.textLabel.text = [_displayedTasks[indexPath.row] name];
        
    if ([[_displayedTasks[indexPath.row] pri] isEqual:@"High"]) {
       img = [UIImage imageNamed:@"high.png"];
    cell.imageView.image = img;
    }
    if ([[_displayedTasks[indexPath.row] pri] isEqual:@"Medium"]) {
        img = [UIImage imageNamed:@"medium.png"];
    cell.imageView.image = img;
    }
    if ([[_displayedTasks[indexPath.row] pri] isEqual:@"Low"]) {
       img = [UIImage imageNamed:@"low.png"];
    cell.imageView.image = img;
    }
    
    }
    else{
        if (indexPath.section == 0) {
            cell.textLabel.text = [_highPriority[indexPath.row] name];
            img = [UIImage imageNamed:@"high.png"];
            cell.imageView.image = img;
        }
        if (indexPath.section == 1) {
            cell.textLabel.text = [_mediumPriority[indexPath.row] name];
            img = [UIImage imageNamed:@"medium.png"];
            cell.imageView.image = img;
        }
        if (indexPath.section == 2) {
            cell.textLabel.text = [_lowPriority[indexPath.row] name];
            img = [UIImage imageNamed:@"low.png"];
            cell.imageView.image = img;
        }
        
    }
    
    
//    else{
//        switch (indexPath.section) {
//            case 0:
//               img = [UIImage imageNamed:@"high.png"];
//               cell.imageView.image = img;
//               cell.textLabel.text = [_highPriority[indexPath.row] name];
//                break;
//            case 1:
//                img = [UIImage imageNamed:@"medium.png"];
//                cell.imageView.image = img;
//                cell.textLabel.text = [_mediumPriority[indexPath.row] name];
//            case 2:
//                img = [UIImage imageNamed:@"low.png"];
//                cell.imageView.image = img;
//                cell.textLabel.text = [_lowPriority[indexPath.row] name];
//            default:
//                break;
//        }
//    }
    
    
    
    
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_segment.selectedSegmentIndex!=4) {
        return _displayedTasks.count;
    }
    else
        if (section==0) {
            return _highPriority.count;
        } else if (section == 1 )
        {
            return _mediumPriority.count;
        }
    else
        if(section ==2)
        {
            return _lowPriority.count;
        }
    
    return 0;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqual: @"details"]) {
    DetailsScreenViewController *screenTwo = segue.destinationViewController;
    screenTwo.task = _displayedTasks[self.tableView.indexPathForSelectedRow.row];
        screenTwo.delegate = self;
    }
    else{
        AddTaskViewController *screenTwo = segue.destinationViewController;
        screenTwo.delegate = self;
    }

        
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tasks removeObject:_displayedTasks[indexPath.row]];
        [self.tableView reloadData];
    }
}





- (IBAction)indexChanged:(id)sender {
    switch (_segment.selectedSegmentIndex) {
        case  0:
            
            _displayedTasks = _tasks;
            [self.tableView reloadData];
            break;
            
        case  1:
            
            _property = @"Todo";
            _predicate = [NSPredicate predicateWithFormat:@"status = %@", _property];
            _displayedTasks = [_tasks filteredArrayUsingPredicate:_predicate];
            [self.tableView reloadData];

            break;
            
        case  2:
            _property = @"In Progress";
            _predicate = [NSPredicate predicateWithFormat:@"status = %@", _property];
            _displayedTasks = [_tasks filteredArrayUsingPredicate:_predicate];
            [self.tableView reloadData];
            break;
            
        case  3:
            _property = @"Done";
            _predicate = [NSPredicate predicateWithFormat:@"status = %@", _property];
            _displayedTasks = [_tasks filteredArrayUsingPredicate:_predicate];
            [self.tableView reloadData];
            break;
            
        case  4:
            [_highPriority removeAllObjects];
            [_mediumPriority removeAllObjects];
            [_lowPriority removeAllObjects];

            for (int i = 0; i<_tasks.count; i++) {
                if ([[_tasks[i] pri] isEqualToString:@"High"]) {
                    [_highPriority addObject:_tasks[i]];
                }
                if ([[_tasks[i] pri] isEqualToString:@"Medium"]) {
                    [_mediumPriority addObject:_tasks[i]];
                }
                if ([[_tasks[i] pri] isEqualToString:@"Low"]) {
                    [_lowPriority addObject:_tasks[i]];
                }
                
            }
            
            [self.tableView reloadData];
            break;

    }
}
- (void)addTask:(Task *)task {
    [_tasks addObject:task];
    [self.tableView reloadData];
}


- (void)updateTask:(Task *)oldTask : (Task *)newTask {
    [_tasks removeObject:oldTask];
    [_tasks addObject:newTask];
    
    [self.tableView reloadData];
}

@end
