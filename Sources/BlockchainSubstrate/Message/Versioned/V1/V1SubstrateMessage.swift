//
//  V1SubstrateMessage.swift
//  
//
//  Created by Julia Samol on 10.01.22.
//

import Foundation
import BeaconCore

public struct V1SubstrateMessage: BlockchainV1Message {
    public var id: String { "" }
    public var type: String { "" }
    public var version: String { "" }
    
    public init(from beaconMessage: BeaconMessage<Substrate>, senderID: String) throws {
        throw Beacon.Error.messageVersionNotSupported(version: "1", blockchainIdentifier: Substrate.identifier)
    }
    
    public func toBeaconMessage(with origin: Beacon.Origin, completion: @escaping (Result<BeaconMessage<Substrate>, Error>) -> ()) {
        completion(.failure(Beacon.Error.messageVersionNotSupported(version: "1", blockchainIdentifier: Substrate.identifier)))
    }
}