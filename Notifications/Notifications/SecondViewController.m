//
//  SecondViewController.m
//  Notifications
//
//  Created by Kavita Gaitonde on 1/11/17.
//  Copyright © 2017 Kavita Gaitonde. All rights reserved.
//

#import "SecondViewController.h"
#import "UserNotifications/UserNotifications.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // Trigger a local notification
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    content.title = @"Reminder Notifications";
    content.body = @"From Second view controller";
    content.sound = [UNNotificationSound defaultSound];
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:20 repeats:NO];
    NSString *identifier = @"KVGLocalNotification";
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier
                                                                          content:content trigger:trigger];
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Something went wrong while adding local notification: %@",error);
        } else {
            NSLog(@"Successfully set up  local notification!");
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
