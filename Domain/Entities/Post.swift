//
//  Todo.swift
//  Domain
//
//  Created by Antoine Garcia on 3/16/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation

public struct Post {
    public let userId: Int
    public let id: Int
    public let title: String
    public let body: String
    
    public init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
