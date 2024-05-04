//
//  File.swift
//  
//
//  Created by 박병관 on 1/1/24.
//

import Foundation
import UniformTypeIdentifiers
import CoreTransferable

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension _ConditionalTransferRepresentation {
    
    typealias ExportingCondition = @Sendable (Item) -> Bool
    
    var exportingCondition:ExportingCondition {
        Mirror(reflecting: self).descendant(#function) as! ExportingCondition
    }
    var base:Base {
        Mirror(reflecting: self).descendant(#function) as! Base
    }
    var importing:Any? {
        Mirror(reflecting: self).descendant(#function)
    }
}

