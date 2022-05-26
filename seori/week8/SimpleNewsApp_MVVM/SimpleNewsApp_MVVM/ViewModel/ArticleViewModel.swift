//
//  ArticleViewModel.swift
//  SimpleNewsApp_MVVM
//
//  Created by 서은수 on 2022/05/13.
//

import Foundation

// ViewModel : 뷰와 관련된 모델. - 즉, 데이터의 상태를 가지고 있다.
class ArticleViewModel: ObservableObject {
    
    var model = ArticleModel()
    
    // R : 기사 갯수 가져오기
    func getTotalArticlesNumber() -> Int {
        model.getTotalArticlesNumber()
    }
    // R : 좋아요 누른 기사 갯수 가져오기.
    func getTotalFavoriteArticlesNumber() -> Int {
        model.favoriteArticles.count
    }
    
    // R : 인덱스의 기사 내용 가져오기.
    func getArticle(index: Int) -> Article {
        model.getArticle(index: index)
    }
    // R : 해당 인덱스의 좋아요 누른 기사 내용 가져오기.
    func getFavoriteArticle(index: Int) -> Article {
        model.favoriteArticles[index]
    }
    
    // U : 좋아요 누른 기사 추가.
    func addFavoriteArticle(article: Article) {
        // 추가.
        model.addFavoriteArticle(article: article)
    }
    
    // U : 나라 변경.
    func updateCountry(country: String) {
        model.country = country
    }
    
    // D : 기사 좋아요 취소.
    func deleteFavoriteArticle(index: Int) {
        // 삭제.
        model.deleteFavoriteArticle(index: index)
    }
}
