//
//  ComboBox.m
//  ComboBoxExample
//
//  Created by Ulaş Sancak on 7/25/13.
//  Copyright (c) 2013 Sancak. All rights reserved.
//

#import "ComboBox.h"
#import "ComboBoxCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation ComboBox

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [[NSBundle mainBundle] loadNibNamed:@"ComboBox" owner:self options:nil];
        [self addSubview:self.view];
        [self.view setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_button setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_arrow setFrame:CGRectMake(frame.size.width-frame.size.height, 0, frame.size.height, frame.size.height)];
        defaultComboBoxTableSize = CGSizeMake(self.view.frame.size.width, 100);
        _comboBoxTableView = [[UITableView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, _button.frame.origin.y+_button.frame.size.height, self.view.frame.size.width, 0)];
        _comboBoxTableView.layer.borderWidth = 1.0;
//        _comboBoxTableView.layer.borderColor = [[UIColor blackColor] CGColor];
        
        self.view.layer.cornerRadius = 6;
        self.view.layer.borderWidth = 1.0;
        self.view.layer.borderColor = [[UIColor clearColor] CGColor];
        self.view.backgroundColor = [UIColor colorWithRed:159/256.0 green:133/256.0 blue:112/256.0 alpha:1.0];
        
        self.backgroundColor = [UIColor colorWithRed:159/256.0 green:133/256.0 blue:112/256.0 alpha:1.0];
        
        _button.layer.cornerRadius = 6;
        _arrow.layer.cornerRadius = 6;
        _comboBoxTableView.layer.borderColor = [[UIColor clearColor] CGColor];
        
        _comboBoxTableView.delegate = self;
        _comboBoxTableView.dataSource = self;
        _comboBoxTableView.backgroundColor = [UIColor colorWithRed:159/256.0 green:133/256.0 blue:112/256.0 alpha:1.0];
        _comboBoxTableView.separatorColor = [UIColor colorWithRed:159/256.0 green:133/256.0 blue:112/256.0 alpha:1.0];
        
        [_comboBoxTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        [self.view addSubview:_comboBoxTableView];
    }
    return self;
}

-(void)openComboBoxWithAnimation:(UITableView *)comboBoxTableView{
    [UIView animateWithDuration:0.25
                     animations:^(void){
                         [_comboBoxTableView setFrame:CGRectMake(self.view.frame.origin.x, _button.frame.origin.y+_button.frame.size.height, self.frame.size.width, defaultComboBoxTableSize.height)];
                         CGRect frame = self.frame;
                         frame.size.height = _button.frame.size.height+_comboBoxTableView.frame.size.height;
                         self.frame = frame;
                         frame = self.view.frame;
                         frame.size.height = _button.frame.size.height+_comboBoxTableView.frame.size.height;
                         self.view.frame = frame;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

-(void)closeComboBoxWithAnimation:(UITableView *)comboBoxTableView{
    [UIView animateWithDuration:0.25
                     animations:^(void){
                         [_comboBoxTableView setFrame:CGRectMake(self.view.frame.origin.x, _button.frame.origin.y+_button.frame.size.height, self.frame.size.width, 0)];
                         CGRect frame = self.frame;
                         frame.size.height = _button.frame.size.height+_comboBoxTableView.frame.size.height;
                         self.frame = frame;
                         frame = self.view.frame;
                         frame.size.height = _button.frame.size.height+_comboBoxTableView.frame.size.height;
                         self.view.frame = frame;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

-(void)setComboBoxSize:(CGSize)size{
    defaultComboBoxTableSize = size;
}


-(void)setComboBoxData:(NSArray *)comboBoxData{
    _comboBoxDataArray = [NSArray arrayWithArray:comboBoxData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _comboBoxDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"ComboCell";
    ComboBoxCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"ComboBoxCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    CGRect frame = cell.frame;
    frame.size.width = self.frame.size.width;
    cell.frame = frame;
    
    cell.titleLabel.text = [_comboBoxDataArray objectAtIndex:indexPath.row];
    cell.contentView.backgroundColor = [UIColor colorWithRed:159/256.0 green:133/256.0 blue:112/256.0 alpha:1.0];
    
    cell.titleLabel.textColor = [UIColor colorWithRed:55/256.0 green:36/256.0 blue:24/256.0 alpha:1.0];
    cell.titleLabel.font = [UIFont fontWithName:@"STHeitiSC-Light" size:14.0];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)viewDidLayoutSubviews
{
    if ([_comboBoxTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_comboBoxTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([_comboBoxTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [_comboBoxTableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_button setTitle:[_comboBoxDataArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    [self closeComboBoxWithAnimation:_comboBoxTableView];
    [self.delegate comboBox:self didSelectRowAtIndexPath:indexPath];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)openComboBox:(UIButton *)sender {
    if (_comboBoxTableView.frame.size.height == 0) {
        [_comboBoxTableView reloadData];
        [self openComboBoxWithAnimation:_comboBoxTableView];
    }
    else {
        [self closeComboBoxWithAnimation:_comboBoxTableView];
    }
    
}

-(void)setComboBoxTitle:(NSString *)title{
    [_button setTitle:title forState:UIControlStateNormal];
}

@end
