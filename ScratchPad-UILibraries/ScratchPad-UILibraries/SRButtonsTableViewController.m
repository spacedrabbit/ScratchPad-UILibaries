//
//  SRButtonsTableViewController.m
//  ScratchPad-UILibraries
//
//  Created by Louis Tur on 5/16/15.
//  Copyright (c) 2015 Louis Tur. All rights reserved.
//

#import "SRButtonsTableViewController.h"

static NSString * const VBFPopFlatButton = @"VBFPopFlatButton";

static NSString * const SRVBPopFlatButtonCellIndentifier = @"popCell";

typedef NS_ENUM(NSInteger, SRButtonsSectionIndex){
    SRVBFPopFlatButtonSection = 0,
};

@interface SRButtonsTableViewController ()

@property (strong, nonatomic) NSArray *libraries;
@property (strong, nonatomic) NSDictionary *librariesMap;

@end

@implementation SRButtonsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.libraries = @[VBFPopFlatButton];
    self.librariesMap = @{ VBFPopFlatButton : @[@"example 1"] };
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SRVBPopFlatButtonCellIndentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.libraries.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = 1;
    
    switch (section) {
        case SRVBFPopFlatButtonSection:
            numberOfRows = ((NSArray *)self.librariesMap[VBFPopFlatButton]).count;
            break;
            
        default:
            break;
    }
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    if (!cell) {
        switch (indexPath.section) {
            case SRVBFPopFlatButtonSection:
                cell = [tableView dequeueReusableCellWithIdentifier:SRVBPopFlatButtonCellIndentifier];
                break;
                
            default:
                break;
        }
    }
    return cell;
}


@end
