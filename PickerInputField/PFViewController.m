//
//  PFViewController.m
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

#import "PFViewController.h"

#import "PFPickerInputCoordinator.h"

@interface PFViewController ()
{
    PFPickerInputCoordinator *_pickerInputCoordinator;
}

@end


@implementation PFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *datasetColumn1 = [[NSArray alloc] initWithObjects:@"foo", @"bar", @"piyo", nil];
    NSArray *datasetTitleColumn1 = [[NSArray alloc] initWithObjects:@"FOO", @"BAR", @"PIYO", nil];
    
    NSArray *datasetColumn2 = [[NSArray alloc] initWithObjects:
                               [NSNumber numberWithInt:1],
                               [NSNumber numberWithInt:2],
                               [NSNumber numberWithInt:3], nil];
    NSArray *datasetTitleColumn2 = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", nil];
    
    _pickerInputCoordinator = [[PFPickerInputCoordinator alloc] initWithTextField:self.pickerInputField
                                                                dataset:[NSArray arrayWithObjects:datasetColumn1, datasetColumn2, nil]
                                                           datasetTitle:[NSArray arrayWithObjects:datasetTitleColumn1, datasetTitleColumn2, nil]];
}

#pragma mark - IBActions

- (IBAction)changePickerValue:(id)sender
{
    // [PIYO| 2 ]
    [_pickerInputCoordinator selectRow:2 inComponent:0 animated:YES];
    [_pickerInputCoordinator selectRow:1 inComponent:1 animated:YES];
}

@end
