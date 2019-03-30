//
//  PostDataStore.swift
//  Domain
//
//  Created by Antoine Garcia on 3/16/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import RxSwift

public protocol PostDataStore {
    func getPosts() -> Observable<[Post]>
}

public protocol CachePostDataStore: PostDataStore {
    func save(post: Post)
}
