//
//  PostUseCase.swift
//  Core
//
//  Created by Antoine Garcia on 3/16/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import Domain
import RxSwift

public struct PostUseCase: Domain.PostUseCase {
    private let remoteDataStore: RemotePostDataStore
    private let localDataStore: CachePostDataStore
    
    public init(remoteDataStore: RemotePostDataStore,
                localDataStore: CachePostDataStore) {
        self.remoteDataStore = remoteDataStore
        self.localDataStore = localDataStore
    }
    
    public func getPosts() -> Observable<[Post]> {
        let remotePosts = remoteDataStore.getPosts()
            .do(onNext: {posts in
                posts.forEach(self.localDataStore.save)
            })
        let localPosts = localDataStore.getPosts()
        return Observable.merge(localPosts, remotePosts)
    }
}
