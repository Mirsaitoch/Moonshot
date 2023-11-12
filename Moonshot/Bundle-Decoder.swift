//
//  Bundle-Decoder.swift
//  Moonshot
//
//  Created by Мирсаит Сабирзянов on 12.11.2023.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError()
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError()
        }
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loader = try? decoder.decode(T.self, from: data) else{
            fatalError()
        }
        
        return loader
    }
    
}
