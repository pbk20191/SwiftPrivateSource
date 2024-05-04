//
//  File.swift
//  
//
//  Created by 박병관 on 1/1/24.
//

import Foundation
#if os(macOS)
import CoreTransferable
import AppKit

extension NSImage {
    @available(macOS 14.0, *)
    static var representation:TupleTransferRepresentation<NSImage, (_ConditionalTransferRepresentation<DataRepresentation<NSImage>>, DataRepresentation<NSImage>, _ConditionalTransferRepresentation<DataRepresentation<NSImage>>, DataRepresentation<NSImage>)> {
        transferRepresentation as! TupleTransferRepresentation<NSImage, (_ConditionalTransferRepresentation<DataRepresentation<NSImage>>, DataRepresentation<NSImage>, _ConditionalTransferRepresentation<DataRepresentation<NSImage>>, DataRepresentation<NSImage>)>
    }
}

extension NSColor {
    
    @available(macOS 14.0, *)
    static var representation:DataRepresentation<NSColor> {
        transferRepresentation as! DataRepresentation<NSColor>
    }
}

#endif
