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
struct NSItemTransferable<NSItem:NSObject & NSItemProviderReading & NSItemProviderWriting>: Transferable {
    
    var item:NSItem
    
    static var contentTypeIdentifiers:[String] {
        let interset = Set(NSItem.readableTypeIdentifiersForItemProvider).intersection(NSItem.writableTypeIdentifiersForItemProvider)
        
        return NSItem.readableTypeIdentifiersForItemProvider.filter{
            interset.contains($0)
        }
        
    }
    
    static var contentTypes:[UTType] {
        let dummy = NSItemProvider()
        dummy.registerObject(ofClass: NSItem.self, visibility: .all) { handler in
            return Progress()
        }
        return dummy.registeredContentTypes
    }
    
    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(contentType: contentTypes[0]) { transferable in
            try await transferable.item.write(withTypeIdentifier: contentTypes[0].identifier)
        } importing: {
            let item = try NSItem.object(withItemProviderData: $0, typeIdentifier: contentTypes[0].identifier)
            return .init(item: item)
        }
    }
    
}



extension NSItemProviderWriting {
    
    
    func write(withTypeIdentifier identifier:String) async throws -> Data {
        try await withUnsafeThrowingContinuation{ continuation in
            loadData(withTypeIdentifier: identifier) { data, error in
                if let error {
                    continuation.resume(throwing: error)
                } else if let data {
                    continuation.resume(returning: data)
                } else {
                    continuation.resume(throwing: CocoaError(.fileReadCorruptFile))
                }
            }
        }
    }
}
