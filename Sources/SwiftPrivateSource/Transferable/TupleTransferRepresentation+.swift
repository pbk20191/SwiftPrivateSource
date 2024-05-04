//
//  File.swift
//  
//
//  Created by 박병관 on 1/1/24.
//

import Foundation
import CoreTransferable
import UniformTypeIdentifiers

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension TupleTransferRepresentation {
    
    var value: Value {
        Mirror(reflecting: self).descendant(#function) as! Value
    }
}
