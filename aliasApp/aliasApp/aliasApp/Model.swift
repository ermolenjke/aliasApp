//
//  Model.swift
//  aliasApp
//
//  Created by Даниил Ермоленко on 26.02.2022.
//

import Foundation

struct Model {
    
    var wordQueue = 0
    var score = 0
    let category = ["Легкий", "Средний", "Сложный", "Рулетка"]
    var easyMode = ["метель", "антенна", "дама", "башня", "рация", "зебра", "кредит", "дуб", "документ", "приправа", "боулинг", "алфавит", "свист", "рев", "мат", "правда", "тюлень", "кирпич", "ум", "удача", "стол", "стул", "кровать", "окно", "мышь"]
    var mediumMode = ["мнение", "жених", "изголовье", "обострение", "грим", "док", "оцепление", "лотерея", "идол", "национальность", "вложение", "симулянт", "поздравление", "каре", "доля", "головоломка", "чародей", "ведьмак", "стихия", "квартирант", "метроном"]
    var hardMode = ["нарцисс", "калач", "батрак", "баллистика", "генералиссимус", "неопровержимость", "манатки", "щеколда", "озорство", "заповедь", "десантирование", "егерь", "эскадрилья", "орден", "постановление", "токарь", "закваска", "прииск", "невозмутимость"]
    var randomMode = ["метель", "антенна", "дама", "башня", "рация", "зебра", "кредит", "дуб", "документ", "приправа", "боулинг", "алфавит", "свист", "рев", "мат", "правда", "тюлень", "кирпич", "ум", "удача", "стол", "стул", "кровать", "окно", "мышь", "мнение", "жених", "изголовье", "обострение", "грим", "док", "оцепление", "лотерея", "идол", "национальность", "вложение", "симулянт", "поздравление", "каре", "доля", "головоломка", "чародей", "ведьмак", "стихия", "квартирант", "метроном", "нарцисс", "калач", "батрак", "баллистика", "генералиссимус", "неопровержимость", "манатки", "щеколда", "озорство", "заповедь", "десантирование", "егерь", "эскадрилья", "орден", "постановление", "токарь", "закваска", "прииск", "невозмутимость"]
    


    mutating func nextWord() {
        if wordQueue + 1 < easyMode.count {
            wordQueue += 1
        } else {
            wordQueue = 0
        }
    }
    
    func getWords() -> String {
        return easyMode[wordQueue]
    }
    
    mutating func getScore() -> Int {
           return score
       }
}
