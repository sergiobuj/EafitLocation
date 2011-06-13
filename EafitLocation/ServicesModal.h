//
//  ServicesModal.h
//  
//
//  Created by Sergio Botero on 06/12/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ServicesModal : UIViewController
{
	NSString * place;
	NSArray * services;


}
@property (nonatomic, copy) NSString * place;

- (id) initWithPlace:(NSString *) thisPlace;

@end

