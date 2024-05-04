//
//  PrivateApiTestCase.swift
//  
//
//  Created by 박병관 on 5/5/24.
//

import XCTest
import SwiftData
@testable import SwiftPrivateSource

final class PrivateApiTestCase: XCTestCase {

    override func setUp() async throws {
        try await super.setUp()
    }

    override func tearDown() async throws {
        try await super.tearDown()
    }

    
    @available(macOS 14, iOS 17.0, tvOS 17.0, macCatalyst 17.0, watchOS 10.0, visionOS 1.0, *)
    func testModel() throws {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContainer = try ModelContainer(for: TestModel.self, configurations: configuration)
        let dataStore = modelContainer.datastores[0].1
        
        dump(dataStore)
        print(type(of: dataStore))
//        let mirror = Mirror(reflecting: modelContainer).descendant("datastores")
//        print(mirror.children.map{ $0.label })
    }

}
