//
//  ReturnSignSubstrateResponse.swift
//
//
//  Created by Julia Samol on 11.01.22.
//

import Foundation
import BeaconCore

public struct ReturnSignSubstrateResponse: BlockchainBeaconResponseProtocol, Equatable, Codable {
    /// The value that identifies the request to which the message is responding.
    public let id: String
    
    /// The version of the message.
    public let version: String
    
    /// The origination data of the request.
    public let requestOrigin: Beacon.Origin
    
    public let payload: String
    
    public init(from request: SignSubstrateRequest, payload: String) throws {
        guard request.mode == .return else {
            throw Error.invalidRequestMode
        }
        
        self.init(
            id: request.id,
            version: request.version,
            requestOrigin: request.origin,
            payload: payload
        )
    }
    
    public init(id: String, version: String, requestOrigin: Beacon.Origin, payload: String) {
        self.id = id
        self.version = version
        self.requestOrigin = requestOrigin
        self.payload = payload
    }
    
    // MARK: Types
    
    enum Error: Swift.Error {
        case invalidRequestMode
    }
}