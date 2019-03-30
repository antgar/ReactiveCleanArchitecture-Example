//
//  DataFactory.swift
//  Core
//
//  Created by Antoine Garcia on 3/17/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import Domain

public struct DataFactory {
    public static func providePostUseCase() -> Domain.PostUseCase {
        let client = RemoteAPI()
        let database = try! RealmDatabase()
        let dbMapper = AnyMapper(PostDBToPostMapper())
        let domainMapper = AnyMapper(PostToPostDBMapper())
        let wsMapper = AnyMapper(PostWSToPostMapper())
        let localDataStore = LocalPostDataStore(database: database,
                                                dbMapper: dbMapper,
                                                domainMapper: domainMapper)
        let remoteDataStore = RemotePostDataStore(api: client,
                                                  postMapper: wsMapper)
        return PostUseCase(remoteDataStore: remoteDataStore,
                           localDataStore: localDataStore)
    }
}
