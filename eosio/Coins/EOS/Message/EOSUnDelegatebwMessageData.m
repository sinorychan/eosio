//
//  EOSUnDelegatebwMessageData.m
//  BepalSdk
//
//  Created by XiaoQing Pan on 2018/5/28.
//  Copyright © 2018 XiaoQing Pan. All rights reserved.
//

#import "EOSUnDelegatebwMessageData.h"

@implementation EOSUnDelegatebwMessageData

- (NSData*)toByte {
    NSMutableData *stream = [NSMutableData new];
    [stream appendData:_From.AccountData];
    [stream appendData:_Receiver.AccountData];
    [_StakeNetQuantity toByte:stream];
    [_StakeCpuQuantity toByte:stream];
    return stream;
}

- (void)parse:(NSData *)data {
    NSUInteger index = 0;
    _From = [[EOSAccountName alloc] initWithHex:[data subdataWithRange:NSMakeRange(index, 8)]];
    index = index + 8;
    _Receiver = [[EOSAccountName alloc] initWithHex:[data subdataWithRange:NSMakeRange(index, 8)]];
    index = index + 8;
    _StakeNetQuantity = [EOSAsset toAsset:data :&index];
    _StakeCpuQuantity = [EOSAsset toAsset:data :&index];
}

@end