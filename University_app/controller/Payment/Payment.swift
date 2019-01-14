// To parse the JSON, add this file to your project and do:
//
//   let paymentRange = try? newJSONDecoder().decode(PaymentRange.self, from: jsonData)

import Foundation

struct PaymentRange: Codable {
    let datesAndPrices: [DatesAndPrice]?
    let remainedPrice, paidPrice, totalPrice: Int?
}

struct DatesAndPrice: Codable {
    let date: String?
    let price: Int?
}
