//
//  ArticleModel.swift
//  SimpleNewsApp_MVVM
//
//  Created by 서은수 on 2022/05/13.
//

import Foundation

class ArticleModel: RepositoryProtocol {
    
    // MARK: - Properties
    
    var repository = Repository()
    
    var articles = [Article]()
    var favoriteArticles = [Article]()
    var country: String = "us"
    
    // MARK: - Initialization
    
    init() {
        repository.delegate = self
        
        // API로부터 articles 가져오기.
        repository.fetchArticles(country: country)
        
        print("DEBUG test: ",articles.count)
        print("DEBUG test: ",getTotalArticlesNumber())
    }
    
    // MARK: - Functions
    
    // protocol 구현.
    func articlesRetrieved(articles: [Article]) {
        self.articles = articles
        print("DEBUG test: ", articles.count)
    }
    
    // R : 기사 갯수 가져오기.
    func getTotalArticlesNumber() -> Int {
        return articles.count
    }
    // R : 좋아요 누른 기사 갯수 가져오기.
    func getTotalFavoriteArticlesNumber() -> Int {
        return favoriteArticles.count
    }
    
    // R : 해당 인덱스의 기사 내용 가져오기.
    func getArticle(index: Int) -> Article {
        print("DEBUG : ", articles)
        return articles[index]
    }
    // R : 해당 인덱스의 좋아요 누른 기사 내용 가져오기.
    func getFavoriteArticle(index: Int) -> Article {
        return favoriteArticles[index]
    }
    
    // U : 좋아요 누른 기사 추가.
    func addFavoriteArticle(article: Article) {
        // 추가.
        favoriteArticles.append(article)
    }
    
    // U : 나라 변경.
    func updateCountry(country: String) {
        self.country = country
    }
    
    // D : 기사 좋아요 취소.
    func deleteFavoriteArticle(index: Int) {
        // 삭제.
        favoriteArticles.remove(at: index)
    }
}
