//
//  LocalPostDataStor.swift
//  Core
//
//  Created by Antoine Garcia on 3/17/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import RxSwift
import Domain

struct LocalPostDataStore: CachePostDataStore {
    private let database: Database
    private let dbMapper: AnyMapper<PostDB, Post>
    private let domainMapper: AnyMapper<Post, PostDB>
    
    init(database: Database,
         dbMapper: AnyMapper<PostDB, Post>,
         domainMapper: AnyMapper<Post, PostDB>) {
        self.database = database
        self.dbMapper = dbMapper
        self.domainMapper = domainMapper
    }
    
    func getPosts() -> Observable<[Post]> {
        return database.fetch(PostDB.self, predicate: nil)
        .flatMap(dbMapper.mapObservable)
    }
    
    func save(post: Post) {
        let postDB = domainMapper.map(from: post)
        try? database.save(object: postDB)
    }
}
