//
//  BaseRepoMock.swift
//  EventsAppTests
//
//  Created by huda elhady on 20/08/2021.
//

import Foundation
@testable import EventsApp

class BaseRepoMock {
    var shouldSuccess: Bool = false
    var failReponse: NetworkError!
}
