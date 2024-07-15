//
//  HarryPotterHousesResponseHandler.swift
//  book
//
//  Created by Daria on 08.07.2024.
//

import Foundation
import Combine

struct HarryPotterHouse: Identifiable {
    
    let id = UUID()
    let house: House
    let founder: String
    let animal: String
    let emoji: String
    
}

struct HarryPotterHouseResponse: Codable {
    
    let house: House
    let founder: String
    let emoji: String
    let animal: String
    
}

final class HarryPotterHousesResponseHandler: ResponseHandler {
    
    typealias Value = [HarryPotterHouse]
    
    func handleResponse(_ data: Data) -> AnyPublisher<[HarryPotterHouse], any Error> {
        do {
            let houseResponse = try JSONDecoder().decode([HarryPotterHouseResponse].self, from: data)
            let house = houseResponse.compactMap { book in
                HarryPotterHouse(
                    house: book.house,
                    founder: book.founder,
                    animal: book.animal,
                    emoji: book.emoji
                )
            }
            
            return Just(house)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } catch {
            
            return Fail(error: NetworkError.serializationFault(description: error.localizedDescription))
                .eraseToAnyPublisher()
        }
    }
    
}
