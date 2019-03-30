//
//  Comments.swift
//  Domain
//
//  Created by Antoine Garcia on 3/16/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation

public struct Comment {
    public let postId: Int
    public let id: Int
    public let name: String
    public let email: String
    public let body: String
    
    public init(postId: Int, id: Int, name: String, email: String, body: String) {
        self.postId = postId
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
}
