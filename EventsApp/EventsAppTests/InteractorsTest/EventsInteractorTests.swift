//
//  EventsInteractorTests.swift
//  EventsAppTests
//
//  Created by huda elhady on 20/08/2021.
//

import XCTest
@testable import EventsApp

class EventsInteractorTests: XCTestCase {
    var interactor: EventsInteractor!
    var eventsRepo: EventsRepoMock!
    var mockOutput: EventsInteractorOutputMock?
    
    override func setUpWithError() throws {
        
        eventsRepo = EventsRepoMock()
        interactor = EventsInteractor(eventsRepo: eventsRepo)
        mockOutput = EventsInteractorOutputMock()
        interactor.presenter = mockOutput
    }

    override func tearDownWithError() throws {
        interactor = nil
        eventsRepo = nil
    }
    
    func testGetEventsTypesFailWithRequestFailedError() {
        //Given
        eventsRepo.shouldSuccess = false
        eventsRepo.failReponse = .requestFailed
        //When
        interactor.fetchEventsTypes()
        //Then
        XCTAssertEqual(mockOutput?.failReponse.errorMessage, "Internet connection error")
    }
    
    func testGetEventsTypesFailWithBadURLError() {
        //Given
        eventsRepo.shouldSuccess = false
        eventsRepo.failReponse = .badURL
        //When
        interactor.fetchEventsTypes()
        //Then
        XCTAssertEqual(mockOutput?.failReponse.errorMessage, "Bad URL")
    }
    
    func testGetEventsTypesFailWithUnknownErrorError() {
        //Given
        eventsRepo.shouldSuccess = false
        eventsRepo.failReponse = .unknown
        //When
        interactor.fetchEventsTypes()
        //Then
        XCTAssertEqual(mockOutput?.failReponse.errorMessage, "Unknown error")
    }
    
    func testGetEventsTypesSucceeded(){
        //Given
        guard let jsonData = JsonHelper.readLocalFile(forName: "eventtypes") ,
              let eventsList = try? JSONDecoder().decode([EventType].self, from: jsonData) else {return}
        //When
        eventsRepo.shouldSuccess = true
        eventsRepo.getEventsTypesSuccess = eventsList
        interactor.fetchEventsTypes()
        //Then
        XCTAssertNil(mockOutput?.failReponse)
        XCTAssertEqual(mockOutput?.typesList[0], eventsList[0])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    

}

class EventsInteractorOutputMock: BaseRepoMock, EventsInteractorOutputProtocol {
    
    var typesList: [EventType]!
    func eventsTypesList(_ list: [EventType]) {
        typesList = list
    }
    
    func eventsFailure(error: NetworkError) {
        failReponse = error
    }
}
