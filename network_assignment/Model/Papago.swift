//
//  Papago.swift
//  network_assignment
//
//  Created by Sammy Jung on 2024/01/17.
//

struct PaPago: Codable {
    let message: PaPagoResult
}

struct PaPagoResult: Codable{
    let result: PapagoFinal
}

struct PapagoFinal: Codable {
    let srcLangType: String
    let tarLangType: String
    let translatedText: String
}
