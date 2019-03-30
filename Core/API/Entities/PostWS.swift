//
//  EntitiesWS.swift
//  Core
//
//  Created by Antoine Garcia on 3/16/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation

public struct PostWS: Decodable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}
