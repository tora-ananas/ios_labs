//
//  APIManager.swift
//  MarvelLab
//
//  Created by Effective on 26.03.2023.
//

import UIKit

class APIManager{
    
    private func dateTimeNumber() -> Int{
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        print("hour: ", hour)
        print("min: ", minutes)
        return (hour+1) * (minutes+1)
    }
    
    let urlString = "https://rickandmortyapi.com/api/character/"
    
    func getCharacter(indexPath: Int, completion: @escaping(RickMortyData) -> ()) {
        let number = dateTimeNumber()
        let hash = (number * (indexPath+1)) % 826
        print("hash", hash)
        let url = URL(string: urlString + "\(hash)")!
        print(url)
        var request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let dataUnwrapper = data else { return }
            if let rickMortyData = try? JSONDecoder().decode(RickMortyApi.self, from: dataUnwrapper) {
                completion( RickMortyData(name: rickMortyData.name, status: rickMortyData.status, species: rickMortyData.species, originLocation: rickMortyData.origin.name, lastLocation: rickMortyData.location.name, image: rickMortyData.image) )
                print("OK")
            } else {
                print("fail")
            }
        }
        task.resume()
    }
    
    func loadImageFromUrl(url: String, completion: @escaping(UIImage?) -> ()) {
        let task = URLSession.shared.dataTask(with: URLRequest(url: URL(string: url)!)) { data, response, error in
            if let data = UIImage(data: data!) {
                print("load image!")
            } else {
                print("error with loading image")
            }
        }
        task.resume()
    }
}
