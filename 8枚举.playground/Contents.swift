//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

///关联值（Associated Values）


enum Barcode{
    case upc(Int,Int,Int,Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("AASD")

switch productBarcode {
case .upc(let numberSystem,let manufacturer,let product,let check):
    print("upc:\(numberSystem),\(manufacturer),\(product),\(check)")
case let .qrCode(qr):
    print("qrCode:\(qr)")
}