//
//  ViewController.h
//  SoundNFC
//
//  Created by Manh Dung Do on 10/3/13.
//  Copyright (c) 2013 Manh Dung Do. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoundNFClib/SoundNFClib.h"

@interface ViewController : UIViewController {
	SoundNFClib *soundLib;
}

@property (weak, nonatomic) IBOutlet UITextField *textToSend;
@property (weak, nonatomic) IBOutlet UITextField *textReceived;
@property (weak, nonatomic) IBOutlet UIButton *btnSend;
@property (weak, nonatomic) IBOutlet UIButton *btnReceive;

@property (nonatomic) SoundNFClib *soundLib;
@end
