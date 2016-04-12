//
//  NomineeViewController.m
//  Oskar2011
//
//  Created by shustreek on 18.12.15.
//  Copyright (c) 2015 shustreek. All rights reserved.
//

#import "NomineeViewController.h"
#import "OSNominees.h"
#import "OSNomination.h"
#import "NominationListViewController.h"

@interface NomineeViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UITextField *nominationTextField;

@end

@implementation NomineeViewController
@synthesize picker;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.titleTextField.text = self.nominee.title;
     self.companyTextField.text = self.nominee.company;
     self.detailTextField.text = self.nominee.detail;
    
    if (self.nominations){
        self.nominationTextField.inputView = self.picker;
    } else  {
        self.nominationTextField.hidden = YES;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }

- (IBAction)closeButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)saveButtonAction:(id)sender {
    
    
   OSNominees *nominee = self.nominee;
    
    if (!self.nominee) { // если редактируем старый объект то  поле  self.nominee !=nil, в случае если мы создаем новый - это поле пустое
        nominee = [OSNominees new];
    }
    
    nominee.title = self.titleTextField.text;
    nominee.company = self.companyTextField.text;
    nominee.detail = self.detailTextField.text;
 
   if ([self.delegate respondsToSelector:@selector(addNomineeControllerDidCreateNominee:)] && !self.currentNominee) {//проверка что тот объект который указан делегатом реализует этот нужный метод
        [self.delegate addNomineeControllerDidCreateNominee:nominee];
    } else if([self.delegate respondsToSelector:@selector(addNomineeControllerDidUpdateNominee)]){
       [self.delegate addNomineeControllerDidUpdateNominee];
   }
   
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.nominations.count;
    
}


- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
   OSNomination *titleNomination = [self.nominations objectAtIndex:row];
    return titleNomination.title;
}

     
@end








