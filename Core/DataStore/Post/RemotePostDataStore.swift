//
//  RemotePostDataStore.swift
//  Core
//
//  Created by Antoine Garcia on 3/16/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import RxSwift
import Domain

struct PostDataStoreRequest: APIRequest {
    var method = RequestType.GET
    var path = "/posts"
    var parameters = [String: String]()
}

public struct RemotePostDataStore: PostDataStore {
    private let apiClient: APIClient
    private let postMapper: AnyMapper<PostWS, Post?>
    
    init(api: APIClient, postMapper: AnyMapper<PostWS, Post?>) {
        self.apiClient = api
        self.postMapper = postMapper
    }
    
    public func getPosts() -> Observable<[Post]> {
        let request: Observable<[PostWS]> = apiClient.send(apiRequest: PostDataStoreRequest())
        return request
            .map {[postMapper] postsWS in
                return postsWS.compactMap(postMapper.map)
        }
    }
}
