//
//  FirstViewController.m
//  TabBarExampleApp
//
//  Created by Ezequiel on 12/19/14.
//  Copyright (c) 2014 Ezequiel. All rights reserved.
//

#import "FirstViewController.h"

NSString* const CELL_ID = @"Cell";

typedef enum
{
    MESSAGES = 0,
    CREDITS
    
} CellIdentifier;

@interface FirstViewController ()

@property (strong, nonatomic) IBOutlet UITableView *myTable;
@property (nonatomic, strong) NSArray* data;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.data = @[@"Messages" ,@"Credits"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
    }
    cell.textLabel.text = (NSString*)self.data[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellIdentifier id = (CellIdentifier)indexPath.row;
    
    switch (id) {
        case MESSAGES:
            
            break;
        case CREDITS:
            
            break;
        default:
            break;
    }
}

@end
