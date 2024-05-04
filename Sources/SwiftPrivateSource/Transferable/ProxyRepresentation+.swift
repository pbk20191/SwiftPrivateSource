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
extension ProxyRepresentation {
    typealias Importer = (@Sendable (ProxyRepresentation) async throws -> Item)
    typealias Exporter = (@Sendable (Item) throws -> ProxyRepresentation)
    typealias Legacy_Exporter = (@Sendable (Item) async throws -> ProxyRepresentation)
    var exporting_legacy: Legacy_Exporter? {
        Mirror(reflecting: self).descendant(#function) as! Legacy_Exporter?
    }
    var exporting:Exporter? {
        Mirror(reflecting: self).descendant(#function) as! Exporter?
    }
    var importing:Importer? {
        Mirror(reflecting: self).descendant(#function) as! Importer?
    }
    
}
