import Foundation
import Security
extension Data {
    public func sha256Hash() -> Data {
        let transform = SecDigestTransformCreate(kSecDigestSHA2, 256, nil)
        SecTransformSetAttribute(transform, kSecTransformInputAttributeName, self as CFTypeRef, nil)
        return SecTransformExecute(transform, nil) as! Data
    }
}
