//
//  Int+Extensions.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/8.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension Int {
  
  /// Array of bytes with optional padding (little-endian)
  func bytes(_ totalBytes: Int = MemoryLayout<Int>.size) -> [UInt8] {
    return withUnsafeBytes(of: self.bigEndian) { Array($0) }
  }
  
  /// Spell Int Value in Simplified Chinese
  var simplifiedChinese: String? {
      let value = NSNumber(integerLiteral: self)
      let userLocale = Locale(identifier: "zh_Hans_CN")
      let formatter = NumberFormatter()
      formatter.numberStyle = .spellOut
      formatter.locale = userLocale
      return formatter.string(from: value)?.replacingOccurrences(of: "〇", with: "零")
  }
  
  /// Spell Int Value in Traditional Chinese
  var traditionalChinese: String? {
      let value = NSNumber(integerLiteral: self)
      let userLocale = Locale(identifier: "zh_Hant")
      let formatter = NumberFormatter()
      formatter.numberStyle = .spellOut
      formatter.locale = userLocale
      return formatter.string(from: value)?.replacingOccurrences(of: "〇", with: "零")
  }
  
  var half: Int? {
    guard self < -1 || self > 1 else { return nil}
    return self / 2
  }
  
}

public extension BinaryInteger {
  var isEven: Bool {
    return self%2 == 0
  }
}
