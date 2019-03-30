//
//  PostViewModel.swift
//  ReactiveCleanArchitecture-Example
//
//  Created by Antoine Garcia on 3/17/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

struct PostViewModel {
    struct Input {
        
    }
    
    struct Output {
        let posts: Driver<[Post]>
    }
    
    var input: Input
    var output: Output
    
    private let disposeBag = DisposeBag()
    private let useCase : PostUseCase
    //MARK: Outputs
    private let postsSubject = ReplaySubject<[Post]>.create(bufferSize: 1)
    init(useCase: PostUseCase) {
        self.input = Input()
        self.output = Output(posts: postsSubject.asDriver(onErrorJustReturn: []))
        self.useCase = useCase
        
        self.useCase
        .getPosts()
        .bind(to: postsSubject)
        .disposed(by: disposeBag)
    }
}
