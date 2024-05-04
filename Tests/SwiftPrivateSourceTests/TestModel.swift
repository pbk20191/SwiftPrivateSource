//
//  File.swift
//  
//
//  Created by 박병관 on 5/5/24.
//

import Foundation
import SwiftData

@available(macOS 14, iOS 17.0, tvOS 17.0, macCatalyst 17.0, watchOS 10.0, visionOS 1.0, *)
@Model
final class TestModel {
    
    var title:String = ""
    
    init(title: String) {
        self.title = title
    }
    
}
