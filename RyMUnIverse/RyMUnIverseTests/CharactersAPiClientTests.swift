//
//  CharactersAPiClientTests.swift
//  RyMUnIverseTests
//
//  Created by Pablo Márquez Marín on 14/5/24.
//

import XCTest
@testable import RyMUnIverse
import Combine


final class CharactersAPiClientTests: XCTestCase {

    private var sut: CharactersApiClientImpl!
    private let networkMock = NetworkMock()
    private var cancellables: Set<AnyCancellable> = .init()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CharactersApiClientImpl()
    }

    override func tearDownWithError() throws {
        sut = nil
       try super.tearDownWithError()
    }

    func testGivenCharactersWhenSuccessThenMatch() throws {
        var output: AllCharacters?
        let expectation: XCTestExpectation = expectation(description: "Response received")
        let character = Character(id: 1,
                                  name: "",
                                  status: "",
                                  image: "",
                                  species: "",
                                  gender: "",
                                  type: "",
                                  episode: [""],
                                  url: "")

        networkMock.response = Just(character).setFailureType(to: BaseError.self).eraseToAnyPublisher()

        sut.get()
            .sink(receiveCompletion: { completion in },
                  receiveValue: {
                allCharacters in
                output = allCharacters
                expectation.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expectation])
        let resultOutput = try XCTUnwrap(output)
        let expected: AllCharacters = AllCharacters(characters: [character],
                                                    info: nil)
        XCTAssertEqual(resultOutput, expected)
    }
}
