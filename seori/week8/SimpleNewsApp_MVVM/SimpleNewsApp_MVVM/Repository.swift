//
//  Repository.swift
//  SimpleNewsApp_MVVM
//
//  Created by 서은수 on 2022/05/13.
//

import Foundation

protocol RepositoryProtocol {
    func articlesRetrieved(articles: [Article])
}

class Repository {
    
    var delegate: RepositoryProtocol?
    
    // API를 통해 신문 기사 정보를 요청하는 함수.
    // 받은 JSON 데이터를 article 인스턴스로 파싱한 뒤, protocol과 delegate pattern을 이용해서 데이터를 Model로 전달한다.
    func fetchArticles(country: String = "us") {
        
        // 1. 요청할 url를 string으로 담아둔다.
        let urlString = "https://newsapi.org/v2/top-headlines?country=\(country)&category=business&apiKey=8653c0d64a9a450cbfb4cdad3350e779"
        // 2. 해당 스트링으로 URL 인스턴스를 생성.
        let url = URL(string: urlString)
        // 3. 해당 url이 만약에 nil 값이라면 이곳에서 중지.
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        
        // 4. URLSession 생성.
        let session = URLSession.shared
        
        // 5. URLSession을 이용해서 dataTask 생성.
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            // 6. error가 없고 data를 성공적으로 불러왔을 때에만 동작한다.
            if error == nil && data != nil {
                // 7. JSON 데이터를 swift 인스턴스 객체로 바꿔주기 위해서 decoder 객체를 생성한다!
                let decoder = JSONDecoder()
                
                // 8. decode함수는 예기치못한 에러를 발생할 수 있으므로 try-catch문을 작성한다. swift문에서는 do-catch문!
                do {
                    // 9. try 문을 앞에 붙여서 JSON 데이터를 이전에 만들어준 ArticleList 모양의 swift 인스턴스로 파싱한다.
                    let articleList = try decoder.decode(ArticleList.self, from: data!)
                    
                    // 10. 데이터를 성공적으로 받아왔다면 articles에 (파싱된 articleList의)articles 데이터를 할당시킨다.
                    self.delegate?.articlesRetrieved(articles: articleList.articles!)
                    print("DEBUG : ", articleList.articles!)
                }
                catch {
                    print("Error parsing the json")
                }
            }
        }
        // 11. datatask 준비가 완료되었다면 datatask를 실행한다.
        datatask.resume()
    }
}
