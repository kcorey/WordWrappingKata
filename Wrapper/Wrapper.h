//
//  Wrapper.h
//  Wrapper
//
//  Created by Ken Corey on 22/06/2016.
//  Copyright © 2016 Ken Corey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wrapper : NSObject

+ (NSString *)wrap:(NSString *)inputString wrapLength:(NSInteger)wrapLength;

@end
