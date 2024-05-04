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
extension CodableRepresentation {
    typealias Importer = (@Sendable (Data) throws -> Item)
    typealias Exporter = (@Sendable (Item) throws -> Data)
    
    var contentType:UTType {
        Mirror(reflecting: self).descendant(#function) as! UTType
    }
    
    var encoder:Encoder {
        Mirror(reflecting: self).descendant(#function) as! Encoder
    }
    
    var decoder:Decoder {
        Mirror(reflecting: self).descendant(#function) as! Decoder
    }
    var importing: Importer {
        Mirror(reflecting: self).descendant(#function) as! Importer
    }
    var exporting:Exporter {
        Mirror(reflecting: self).descendant(#function) as! Exporter
    }
    
}
