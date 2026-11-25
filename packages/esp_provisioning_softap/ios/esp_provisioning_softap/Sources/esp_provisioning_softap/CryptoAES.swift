// Copyright 2018 Espressif Systems (Shanghai) PTE LTD
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//  MbedAES.swift
//  EspressifProvision
//

import CommonCrypto
import Foundation

/// AES-256 in CTR mode (big-endian counter) for the security1 session. One
/// cryptor lives for the whole session, so the counter carries on from one
/// `encrypt` call to the next, as the device expects.
final class CryptoAES {
    private var cryptor: CCCryptorRef?

    init(key: Data, iv: Data) {
        guard key.count == kCCKeySizeAES256 else { return }
        let status = key.withUnsafeBytes { keyBytes in
            iv.withUnsafeBytes { ivBytes in
                CCCryptorCreateWithMode(
                    CCOperation(kCCEncrypt), CCMode(kCCModeCTR), CCAlgorithm(kCCAlgorithmAES),
                    CCPadding(ccNoPadding), ivBytes.baseAddress, keyBytes.baseAddress, key.count,
                    nil, 0, 0, CCModeOptions(kCCModeOptionCTR_BE), &cryptor)
            }
        }
        if status != kCCSuccess { cryptor = nil }
    }

    deinit {
        if let cryptor { CCCryptorRelease(cryptor) }
    }

    func encrypt(data: Data) -> Data? {
        guard let cryptor else { return nil }
        var out = Data(count: CCCryptorGetOutputLength(cryptor, data.count, true))
        var moved = 0
        let status = out.withUnsafeMutableBytes { outBytes in
            data.withUnsafeBytes { inBytes in
                CCCryptorUpdate(cryptor, inBytes.baseAddress, data.count, outBytes.baseAddress, outBytes.count, &moved)
            }
        }
        guard status == kCCSuccess else { return nil }
        out.count = moved
        return out
    }
}
