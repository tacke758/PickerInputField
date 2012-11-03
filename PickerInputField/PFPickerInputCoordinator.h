//
//  PFPickerInputCoordinator.h
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

#import <Foundation/Foundation.h>

@interface PFPickerInputCoordinator : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UITextField *managedTextField;
@property (nonatomic, strong) NSArray *dataset;
@property (nonatomic, strong) NSArray *datasetTitle;
@property (nonatomic, readonly) NSArray *value;

- (id)initWithTextField:(UITextField *)textField dataset:(NSArray *)dataset datasetTitle:(NSArray *)datasetTitle;
- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated;

@end
