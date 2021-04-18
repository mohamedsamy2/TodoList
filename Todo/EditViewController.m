//
//  EditViewController.m
//  Todo
//
//  Created by Mohamed Samy on 29/03/2021.
//

#import "EditViewController.h"

@interface EditViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *desc;
@property (weak, nonatomic) IBOutlet UIPickerView *priorityPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *statusPicker;
@property (weak, nonatomic) IBOutlet UIButton *save;
@property NSArray* priorityPickerList;
@property NSArray* statusPickerList;
- (IBAction)save:(id)sender;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([_task.status isEqualToString:@"In Progress"]) {
        _statusPickerList = @[@"In Progress",@"Done"];
    }
    else if ([_task.status isEqualToString:@"Done"])
    {
        _statusPickerList = @[@"Done"];
    }
    else
    {
        _statusPickerList = @[@"Todo",@"In Progress",@"Done"];
    }
    _priorityPickerList = @[@"High",@"Medium",@"Low"];
    self.priorityPicker.dataSource = self;
    self.priorityPicker.delegate = self;
    self.statusPicker.dataSource = self;
    self.statusPicker.delegate = self;
    _name.text = _task.name;
    _desc.text = _task.desc;
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView.tag == 0) {
        return _priorityPickerList.count;
    }
    else{
        return _statusPickerList.count;
    }
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(pickerView.tag == 0){
        return _priorityPickerList[row];
    }
    else{
        return _statusPickerList[row];
    }
    
}

- (IBAction)save:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Are you sure you want to edit this task?" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        printf("Confirmed");
        NSInteger SelectedRow;
        SelectedRow = [self.priorityPicker selectedRowInComponent:0];
        NSString* priorityString = [self.priorityPickerList objectAtIndex:SelectedRow];
    
        SelectedRow = [self.statusPicker selectedRowInComponent:0];
        NSString* statusString = [self.statusPickerList objectAtIndex:SelectedRow];
        
        Task *temp = [[Task alloc] initWithValues:self.name.text :self.desc.text : priorityString:statusString];
        
        [self.delegate updateTask:self.task:temp];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        printf("Cancelled");
    }];
    [alert addAction:noAction];
    [alert addAction:yesAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
