//
//  File.swift
//  
//
//  Created by 박병관 on 5/5/24.
//

import Foundation


#if canImport(WatchKit)
@available(watchOS 6.0, *)
func WKInterfaceObjectDynamicCreatable() -> Protocol {
    return objc_getProtocol("WKInterfaceObjectDynamicCreatable")!
}

#endif
