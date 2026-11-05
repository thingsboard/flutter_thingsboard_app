//
//  Encrpyt.h
//  EspressifProvision
//
//  Created by Vikas Chandra on 15/05/19.
//  Copyright © 2019 Espressif. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>

NS_ASSUME_NONNULL_BEGIN

@interface AESDecryptor : NSObject

-(id)initWithKey:(NSData *)key andIV:(NSData *)iv;

- (NSData *)cryptData:(NSData *)dataIn
            operation:(CCOperation)operation  // kCC Encrypt, Decrypt
                 mode:(CCMode)mode            // kCCMode ECB, CBC, CFB, CTR, OFB, RC4, CFB8
            algorithm:(CCAlgorithm)algorithm  // CCAlgorithm AES DES, 3DES, CAST, RC4, RC2, Blowfish
              padding:(CCPadding)padding      // cc NoPadding, PKCS7Padding
            keyLength:(size_t)keyLength       // kCCKeySizeAES 128, 192, 256
                   iv:(NSData *)iv            // CBC, CFB, CFB8, OFB, CTR
                  key:(NSData *)key
                error:(NSError **)error;
@end

NS_ASSUME_NONNULL_END
