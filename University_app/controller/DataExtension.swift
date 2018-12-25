import Foundation
extension Data {
    init?<S: StringProtocol>(hexString: S) {
        guard hexString.count % 2 == 0 else { return nil }  // Must be even number of letters
        var bytes: [UInt8] = []
        var index = hexString.startIndex
        while index != hexString.endIndex {
            let secondIndex = hexString.index(after: index)
            let hexValue = hexString[index...secondIndex]
            guard let byte = UInt8(hexValue, radix: 16) else { return nil } // Unexpected character
            bytes.append(byte)
            index = hexString.index(after: secondIndex)
        }
        self.init(bytes)
    }
}
