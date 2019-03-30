//
//  PostWSToPostMapper.swift
//  Core
//
//  Created by Antoine Garcia on 3/17/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import Domain

struct PostWSToPostMapper: Mapper {
    func map(from: PostWS) -> Post? {
        guard let userId = from.userId,
        let id = from.id,
        let title = from.title,
        let body = from.body else {
            return nil
        }
        return Post(userId: userId,
                    id: id,
                    title: title,
                    body: body)
    }
}
