//
//  ViewController.m
//  Localizations
//
//  Created by 何发松 on 16/3/18.
//  Copyright © 2016年 HeRay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",NSLocalizedString(@"AppName", ""));
    [self sortObjs];
    [self insertionSort];
}

- (void)sortObjs{
    NSMutableArray *objs = [NSMutableArray arrayWithObjects:@"1",@"34",@"3",@"100",@"2", nil];
    NSLog(@"sorting objs : %@",objs);
    for (int i = 0 ; i < objs.count; i++) {
        for (int j = 1; j < objs.count - i; j++) {
            NSString *obj1 = objs[j-1];
            NSString *obj2 = objs[j];
            if (obj1.integerValue > obj2.integerValue) {
                [objs exchangeObjectAtIndex:j-1 withObjectAtIndex:j];
            }
        }
    }
    NSLog(@"sorted objs : %@",objs);
}

- (void)insertionSort{
    NSMutableArray *objs = [NSMutableArray arrayWithObjects:@"1",@"3",@"34",@"100",@"206", nil];
    NSLog(@"sorting objs : %@",objs);
    NSArray *sortingObjs = @[@"0",@"4",@"78",@"900"];
    NSInteger startIdx = 0;
    for (NSString *obj in sortingObjs) {
        NSInteger idx = [self indexOfObj:obj inObjs:objs startIdx:startIdx];
        startIdx = idx;
        [objs insertObject:obj atIndex:idx];
    }
    NSLog(@"sorted objs : %@",objs);
}

- (NSInteger)indexOfObj:(NSString *)obj inObjs:(NSArray *)objs startIdx:(NSInteger)idx {
    for (NSInteger i = idx; i < objs.count; i++) {
        NSString *obj1 = objs[i];
        if (obj.integerValue < obj1.integerValue) {
            return i;
        }
    }
    return objs.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
