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
extension FileRepresentation {
    
    typealias Importer = (@Sendable (ReceivedTransferredFile) async throws -> Item)
    typealias Exporter = (@Sendable (Item) async throws -> SentTransferredFile)
    
    var contentType:UTType {
        Mirror(reflecting: self).descendant(#function) as! UTType
    }
    var shouldAttemptToOpenInPlace:Bool? {
        Mirror(reflecting: self).descendant(#function) as? Bool
    }
    var exporting:Exporter? {
        Mirror(reflecting: self).descendant(#function) as! Exporter?
    }
    var importing:Importer? {
        Mirror(reflecting: self).descendant(#function) as! Importer?
    }
    
}
