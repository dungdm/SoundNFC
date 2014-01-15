//
//  ViewController.m
//  SoundNFC
//
//  Created by Manh Dung Do on 10/3/13.
//  Copyright (c) 2013 Manh Dung Do. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize soundLib;

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	soundLib = [[SoundNFClib alloc] init];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

// Send signal
- (IBAction)sendSignal:(id)sender {
	if ([self.btnSend.titleLabel.text isEqualToString:@"Send"]) {
		if (self.textToSend.text == nil || [self.textToSend.text length] == 0) {
			self.textToSend.text = @"test data";
		}
		[soundLib sendString:self.textToSend.text nTimes:3 target:self selector:@selector(sentCallback)];
		[self.btnSend setTitle:@"Stop" forState:UIControlStateNormal];
	} else {
		[soundLib stopSending];
		[self.btnSend setTitle:@"Send" forState:UIControlStateNormal];
	}
}

// Receive signal
- (IBAction)receiveSignal:(id)sender {
	if ([self.btnReceive.titleLabel.text isEqualToString:@"Receive"]) {
		self.textReceived.text = @"";
        [soundLib listenWithCallback:self selector:@selector(receivedCallback:)];
        [self.btnReceive setTitle:@"Stop" forState:UIControlStateNormal];
	} else {
        [soundLib stopListening];
		[self.btnReceive setTitle:@"Receive" forState:UIControlStateNormal];
	}
}

-(void) receivedCallback:(NSString*)results {
	self.textReceived.text = results;
	[self.btnReceive setTitle:@"Receive" forState:UIControlStateNormal];
}

-(void) sentCallback {
	[self.btnSend setTitle:@"Send" forState:UIControlStateNormal];
}


@end
