//
//  PostDBToPostMapper.swift
//  Core
//
//  Created by Antoine Garcia on 3/17/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import Domain

struct PostDBToPostMapper: Mapper {
    func map(from: PostDB) -> Post {
        return Post(userId: from.userId,
                      id: from.id,
                      title: from.title,
                      body: from.body)
    }
}
