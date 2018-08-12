//
//  Contents.swift
//  MobileNOC
//
//  Created by Munadel Qubbaj on 8/11/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import HandyJSON

class ContentsModel: HandyJSON {

    var last: Bool?
    var totalPages: Int?
    var totalElements: Int?
    var first: Bool?
    var sort: String?
    var numberOfElements: Int?
    var size: Int?
    var number: Int?
    var content: [Content]?

    required init() {
        /// empty because it's required by HandyJSON.
    }
}

class Content: HandyJSON {

    var id: Int?
    var name: String?
    var ipAddress: String?
    var ipSubnetMask: String?
    var locationId: Int?
    var serialNumber: String?
    var version: String?
    var location: Int?
    var serialNum: String?
    var model: Model?
    var status: Status?
    var type: Type?
    var communicationProtocols: [CommunicationProtocol]?
    var targetMachines: [TargetMachines]?

    required init() {
        /// empty because it's required by HandyJSON.
    }
}

class Model: HandyJSON {

    var id: Int?
    var name: String?
    var creationDate: String?
    var expiryDate: String?

    required init() {
        /// empty because it's required by HandyJSON.
    }
}

class Status: HandyJSON {

    var id: Int?
    var statusValue: String?
    var legacyValue: String?

    required init() {
        /// empty because it's required by HandyJSON.
    }
}

class Type: HandyJSON {

    var id: Int?
    var name: String?

    required init() {
        /// empty because it's required by HandyJSON.
    }
}

class CommunicationProtocol: HandyJSON {

    var id: Int?
    var name: String?
    var defaultPort: String?

    required init() {
        /// empty because it's required by HandyJSON.
    }
}

class TargetMachines: HandyJSON {

    var id: Int?
    var sourceMachineId: String?
    var circuitStatusId: Int?
    var targetMachine: [TargetMachine]?

    required init() {
        /// empty because it's required by HandyJSON.
    }
}

class TargetMachine: HandyJSON {

    var id: Int?
    var name: String?
    var ipAddress: String?
    var ipSubnetMask: String?
    var locationId: Int?
    var targetMachine: [TargetMachine]?
    var status: Status?
    var type: Type?
    var serialNumber: String?
    var version: String?
    var location: Int?
    var serialNum: String?

    required init() {
        /// empty because it's required by HandyJSON.
    }
}
