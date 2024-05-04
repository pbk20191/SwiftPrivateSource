//
//  File.swift
//  
//
//  Created by 박병관 on 1/1/24.
//

import Foundation
import CoreTransferable
import SwiftUI

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension String {
    static var representation:DataRepresentation<String> {
       transferRepresentation as! DataRepresentation<String>
    }
}


@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension Image {
    static var representation:TupleTransferRepresentation<
        Self, (DataRepresentation<Self>, DataRepresentation<Self>)> {
            transferRepresentation as! TupleTransferRepresentation<
                Self, (DataRepresentation<Self>, DataRepresentation<Self>)>
        }
    
}
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)

extension URL {
    static var representation: TupleTransferRepresentation<Self, (DataRepresentation<Self>, _ConditionalTransferRepresentation<DataRepresentation<Self>>)> {
        transferRepresentation as! TupleTransferRepresentation<Self, (DataRepresentation<Self>, _ConditionalTransferRepresentation<DataRepresentation<Self>>)>
    }
}
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension Color {
    //Color.transferRepresentation as? DataRepresentation<Color>
    static var dataRepresentation:DataRepresentation<Self> {
        transferRepresentation as! DataRepresentation<Self>
    }
}
@available(iOS 16.1, macOS 13.0, tvOS 16.0, watchOS 9.1, macCatalyst 16.1, *)
extension AttributedString {
    static var dataRepresentation: TupleTransferRepresentation<Self, (_ConditionalTransferRepresentation<DataRepresentation<Self>>, DataRepresentation<Self>, DataRepresentation<Self>, ProxyRepresentation<Self, String>)> {
        return transferRepresentation as! TupleTransferRepresentation<AttributedString, (_ConditionalTransferRepresentation<DataRepresentation<AttributedString>>, DataRepresentation<AttributedString>, DataRepresentation<AttributedString>, ProxyRepresentation<AttributedString, String>)>
        
    }
}
