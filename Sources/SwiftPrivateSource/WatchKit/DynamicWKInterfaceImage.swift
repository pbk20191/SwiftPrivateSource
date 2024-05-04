//
//  File.swift
//  
//
//  Created by 박병관 on 5/5/24.
//

#if canImport(WatchKit)
import WatchKit

@available(watchOS 6.0, *)
final class DynamicWKInterfaceImage: WKInterfaceImage {
    
    static let install:() = {
        class_addProtocol(DynamicWKInterfaceImage.self, WKInterfaceObjectDynamicCreatable())
    }()
    
    @objc var interfaceDescriptionForDynamicCreation:[String:String] {
        return [
            "type":"image",
            "property":interfaceProperty
        ]
    }
    
    static func new() -> WKInterfaceImage {
        Self.install

        let allocation = Self.perform("alloc").takeUnretainedValue() as! NSObject
        let object = allocation.perform("_initForDynamicCreationWithInterfaceProperty:", with: "WKInterfaceImage_" + UUID().uuidString).takeUnretainedValue() as! WKInterfaceImage
        Unmanaged.passUnretained(object).release()
        return object
    }
    
}


#endif
