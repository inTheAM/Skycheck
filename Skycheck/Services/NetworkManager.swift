//
//  NetworkManager.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import Foundation
protocol NetworkManagerProtocol	{
	static func makeRequest<T:Decodable>(_ type:	T.Type, urlString:	String, completion:	@escaping (Result<T, FetchingError>) -> Void)
}

struct NetWorkManager:	NetworkManagerProtocol	{
	static func makeRequest<T:Decodable>(_ type:	T.Type, urlString:	String, completion:	@escaping (Result<T, FetchingError>) -> Void)	{
		DispatchQueue.global(qos: .userInteractive).async	{
			guard let url	=	URL(string: urlString)	else	{
				completion(.failure(.invalidURL))
				return
			}
			
			URLSession.shared.dataTask(with: url)	{ data, response, error in
				guard let data	=	data else {
					completion(.failure(.noDataFromServer))
					return
				}
				guard let decoded	=	try? JSONDecoder().decode(T.self, from: data)	else	{
					completion(.failure(.failedToDecodeData))
					return
				}
				completion(.success(decoded))
				
			}.resume()
		}
	}
}
