//
//  ViewController.m
//  TestTableView
//
//  Created by Kabir Mahal on 10/3/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    NSArray *myArray;
    NSString *tempString;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	myArray = @[@"first", @"second", @"third"];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [myArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;
    
    cell = [[UITableViewCell alloc] init];
    
    cell.textLabel.text = [myArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    tempString = [myArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"JohnsSegue" sender:self];
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    SecondViewController *secondVC = segue.destinationViewController;
    
    //[secondVC view]; greg is a clever hack lulz
    
    secondVC.theFinale = tempString;
    
}



@end
