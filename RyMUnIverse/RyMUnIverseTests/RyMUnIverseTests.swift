//
//  RyMUnIverseTests.swift
//  RyMUnIverseTests
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import XCTest
@testable import RyMUnIverse
import Combine

final class RyMUnIverseTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: - Test Models -
    func testCharacterModel() throws {
        let model = Character(id: 01,
                              name: "Rick",
                              status: "Dead",
                              image: "some image",
                              species: "Human",
                              gender: "male",
                              type: "unknown",
                              episode: [],
                              url: "some url")
        
        XCTAssertEqual(model.colorStatus, .red)
    }
    
    let apiClient = BaseApiClient()
    
    func testGetEpisodeByURL_Success() {
        let expectation = self.expectation(description: "Response received")
        var receivedModel: Episode? = nil
        var receivedError: Error? = nil
        
        let cancellable = apiClient.getModelByAPI(relativePath: "https://rickandmortyapi.com/api/episode/28",
                                                  type: Episode.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        receivedError = error
                        XCTAssertNil(error)
                        expectation.fulfill()
                }
            }, receiveValue: { episode in
                receivedModel = episode
                XCTAssertNotNil(episode)
                expectation.fulfill()
            })
        
        waitForExpectations(timeout: 5, 
                            handler: nil)
        cancellable.cancel()
        
        XCTAssertNotNil(receivedModel)
        XCTAssertNil(receivedError)
    }
    
    func testGetModelByAPI_Success() {
        let expectation = self.expectation(description: "Response received")
        var receivedModel: Character? = nil
        var receivedError: Error? = nil
        
        let cancellable = apiClient.getModelByAPI(relativePath: "https://rickandmortyapi.com/api/character/2",
                                                  type: Character.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        receivedError = error
                        XCTAssertNil(error)
                        expectation.fulfill()
                }
            }, receiveValue: { model in
                receivedModel = model
                XCTAssertNotNil(model)
                expectation.fulfill()
            })
        
        waitForExpectations(timeout: 5,
                            handler: nil)
        cancellable.cancel()
        
        XCTAssertNotNil(receivedModel)
        XCTAssertNil(receivedError)
    }
}
