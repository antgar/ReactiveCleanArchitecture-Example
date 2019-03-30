//
//  PostToDBMapper.swift
//  Core
//
//  Created by Antoine Garcia on 3/17/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import Domain

struct PostToPostDBMapper: Mapper {
    func map(from: Domain.Post) -> PostDB {
        return PostDB(userId: from.userId,
                      id: from.id,
                      title: from.title,
                      body: from.body)
    }
}
