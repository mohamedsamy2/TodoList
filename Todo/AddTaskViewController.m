//
//  AddTaskViewController.m
//  Todo
//
//  Created by Mohamed Samy on 29/03/2021.
//

#import "AddTaskViewController.h"
#import "Task.h"
@interface AddTaskViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UITextField *desc;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property NSArray *pickerList;
@property (weak, nonatomic) IBOutlet UIButton *save;

@property NSString* priority;
- (IBAction)add:(id)sender;

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    _pickerList = @[@"High",@"Medium",@"Low"];
    self.picker.dataSource = self;
    self.picker.delegate = self;
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
    return _pickerList.count;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _pickerList[row];
}

- (IBAction)add:(id)sender {
    printf("Hello");
    NSInteger SelectedRow;
    SelectedRow = [_picker selectedRowInComponent:0];
    NSString* selectedPickerString = [_pickerList objectAtIndex:SelectedRow];
    Task *temp = [[Task alloc] initWithValues:_name.text :_desc.text :selectedPickerString :@"Todo"];
    [_delegate addTask:temp];
    [self.navigationController popViewControllerAnimated:YES];
}



@end
