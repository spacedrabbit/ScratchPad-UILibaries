//
//  SRMenuTableViewController.m
//  ScratchPad-UILibraries
//
//  Created by Louis Tur on 5/16/15.
//  Copyright (c) 2015 Louis Tur. All rights reserved.
//

#import "SRMenuTableViewController.h"
#import "SRButtonsTableViewController.h"

static NSString * const SRStandardCell = @"cell";

typedef NS_ENUM(NSInteger, SRMenuOptions){
    SRMenuOptionButtons = 0,
};

@interface SRMenuTableViewController ()

@property (strong, nonatomic) NSArray *UIOptions;
@property (strong, nonatomic) UITableViewCell *standardCell;

@end

@implementation SRMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.UIOptions = @[@"Buttons"];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SRStandardCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.UIOptions.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SRStandardCell forIndexPath:indexPath];
    
    cell.textLabel.text = self.UIOptions[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case SRMenuOptionButtons:{
            SRButtonsTableViewController *buttonsViewController = [[SRButtonsTableViewController alloc] init];
            [self.navigationController pushViewController:buttonsViewController animated:YES];
            break;
        }
        default:
            break;
    }
}



@end
