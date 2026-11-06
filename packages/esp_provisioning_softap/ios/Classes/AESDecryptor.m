//
//  Encrpyt.m
//  EspressifProvision
//
//  Created by Vikas Chandra on 15/05/19.
//  Copyright © 2019 Espressif. All rights reserved.
//

#import "AESDecryptor.h"
@interface AESDecryptor() {
    CCCryptorRef cryptor;
}
@end

@implementation AESDecryptor

-(id)initWithKey:(NSData *)key andIV:(NSData *)iv {
    cryptor = NULL;
    CCCryptorStatus ccStatus = 0;
    
    ccStatus = CCCryptorCreateWithMode(kCCEncrypt, kCCModeCTR, kCCAlgorithmAES,
                                       ccNoPadding,
                                       iv.bytes, key.bytes,
                                       kCCKeySizeAES256,
                                       NULL, 0, 0, // tweak XTS mode, numRounds
                                       kCCModeOptionCTR_BE, // CCModeOptions
                                       &cryptor);
    return self;
}
- (NSData *)cryptData:(NSData *)dataIn
            operation:(CCOperation)operation  // kCC Encrypt, Decrypt
                 mode:(CCMode)mode            // kCCMode ECB, CBC, CFB, CTR, OFB, RC4, CFB8
            algorithm:(CCAlgorithm)algorithm  // CCAlgorithm AES DES, 3DES, CAST, RC4, RC2, Blowfish
              padding:(CCPadding)padding      // cc NoPadding, PKCS7Padding
            keyLength:(size_t)keyLength       // kCCKeySizeAES 128, 192, 256
                   iv:(NSData *)iv            // CBC, CFB, CFB8, OFB, CTR
                  key:(NSData *)key
                error:(NSError **)error
{
    if (key.length != keyLength) {
        NSLog(@"CCCryptorArgument key.length: %lu != keyLength: %zu", (unsigned long)key.length, keyLength);
        if (error) {
            *error = [NSError errorWithDomain:@"kArgumentError key length" code:key.length userInfo:nil];
        }
        return nil;
    }
    
    size_t dataOutMoved = 0;
    size_t dataOutMovedTotal = 0;
    CCCryptorStatus ccStatus = 0;
    
    size_t dataOutLength = CCCryptorGetOutputLength(cryptor, dataIn.length, true);
    NSMutableData *dataOut = [NSMutableData dataWithLength:dataOutLength];
    char *dataOutPointer = (char *)dataOut.mutableBytes;
    
    ccStatus = CCCryptorUpdate(cryptor,
                               dataIn.bytes, dataIn.length,
                               dataOutPointer, dataOutLength,
                               &dataOutMoved);
    dataOutMovedTotal += dataOutMoved;
    
    if (ccStatus != kCCSuccess) {
        NSLog(@"CCCryptorUpdate status: %d", ccStatus);
        if (error) {
            *error = [NSError errorWithDomain:@"kUpdateError" code:ccStatus userInfo:nil];
        }
        CCCryptorRelease(cryptor);
        return nil;
    }
    
    ccStatus = CCCryptorFinal(cryptor,
                              dataOutPointer + dataOutMoved, dataOutLength - dataOutMoved,
                              &dataOutMoved);
    if (ccStatus != kCCSuccess) {
        NSLog(@"CCCryptorFinal status: %d", ccStatus);
        if (error) {
            *error = [NSError errorWithDomain:@"kFinalError" code:ccStatus userInfo:nil];
        }
        CCCryptorRelease(cryptor);
        return nil;
    }
    
    dataOutMovedTotal += dataOutMoved;
    dataOut.length = dataOutMovedTotal;
    
    return dataOut;
}
@end
