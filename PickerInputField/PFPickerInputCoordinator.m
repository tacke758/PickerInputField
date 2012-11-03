//
//  PFPickerCoordinator.m
//  PickerInputField
//
//  Created by Tacke on 2012/11/02.
//  Copyright (c) 2012 Tacke. All rights reserved.
//

/*
 Copyright (C) 2012 Tacke
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "PFPickerInputCoordinator.h"

@interface PFPickerInputCoordinator ()
{
    NSMutableArray *_internalValue;
    NSMutableArray *_internalValueTitle;
    
    UIPickerView *_pickerView;
}

- (NSString *)constructValueText;

@end


@implementation PFPickerInputCoordinator

@synthesize managedTextField = _managedTextField;
@synthesize dataset = _dataset;
@synthesize datasetTitle = _datasetTitle;

/**
 * 初期化
 * @param textField 管理対象のテキストフィールド
 * @param dataset 各列のデータ配列の配列
 * @param datasetTitle 各列のデータ名の配列の配列
 * @return self
 */
- (id)initWithTextField:(UITextField *)textField dataset:(NSArray *)dataset datasetTitle:(NSArray *)datasetTitle
{
    self = [super init];
    if (self)
    {
        _managedTextField = textField;
        _dataset = dataset;
        _datasetTitle = datasetTitle;
        _internalValue = [[NSMutableArray alloc] init];
        _internalValueTitle = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < [dataset count]; i++)
        {
            // デフォルトは0番目の要素
            [_internalValue insertObject:[[_dataset objectAtIndex:i] objectAtIndex:0] atIndex:i];
            [_internalValueTitle insertObject:[[_datasetTitle objectAtIndex:i] objectAtIndex:0] atIndex:i];
        }
        _managedTextField.text = [self constructValueText];
        
        UIView *inputView = [[UIView alloc] init];
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        _pickerView.showsSelectionIndicator = YES;
        inputView.frame = _pickerView.frame;
        [inputView addSubview:_pickerView];
        _managedTextField.inputView = inputView;
        
        UIView *inputAccessoryView = [[UIView alloc] init];
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        // 完了ボタンを押したらキーボードを閉じるようにする
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                    target:_managedTextField
                                                                                    action:@selector(resignFirstResponder)];
        inputAccessoryView.frame = toolbar.frame;
        [toolbar setItems:@[doneButton]];
        [inputAccessoryView addSubview:toolbar];
        _managedTextField.inputAccessoryView = inputAccessoryView;
    }
    
    return self;
}

/**
 * 初期化
 * @param row 行
 * @param component 列
 */
- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated
{
    [_pickerView selectRow:row inComponent:component animated:animated];
    [_pickerView.delegate pickerView:_pickerView didSelectRow:row inComponent:component];
}

/**
 * valueプロパティ
 * @return 各列で選択している値の配列
 */
- (NSArray *)value
{
    return [NSArray arrayWithArray:_internalValue];
}


#pragma mark - UIPickerViewDatasource methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return [_dataset count];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[_dataset objectAtIndex:component] count];
}


#pragma mark - UIPickerViewDelegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[_datasetTitle objectAtIndex:component] objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    id valueData = [[_dataset objectAtIndex:component] objectAtIndex:row];
    NSString *valueDataTitle = [[_datasetTitle objectAtIndex:component] objectAtIndex:row];
    
    [_internalValue replaceObjectAtIndex:component withObject:valueData];
    [_internalValueTitle replaceObjectAtIndex:component withObject:valueDataTitle];
    
    _managedTextField.text = [self constructValueText];
}


#pragma mark - Private Methods

- (NSString *)constructValueText
{
    // 必要に応じでカンマやコロンなどにする
    return [_internalValueTitle componentsJoinedByString:@" "];
}

@end
