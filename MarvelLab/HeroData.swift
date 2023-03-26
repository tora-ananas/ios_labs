//
//  HeroData.swift
//  MarvelLab
//
//  Created by Effective on 14.03.2023.
//

import UIKit

//class MyHeroData {
    
    struct HeroData {
        let name: String
        let image: UIImage
        let text: String
    }

    let myHeroData: [HeroData] = [HeroData(name: "Venom", image: UIImage(named: "Venom")!, text: "No one's being controlled!"),
                                HeroData(name: "Iron Man", image: UIImage(named: "Toni")!, text: "I am Iron Man."),
                                HeroData(name: "Thor", image: UIImage(named: "Thor")!, text: "I would rather be a good man than a great king."),
                                HeroData(name: "Loki", image: UIImage(named: "Loki")!, text: "I, Loki, Prince of Asgard..."),
                                HeroData(name: "Vision", image: UIImage(named: "Vision")!, text: "I've been a voice with no body."),
                                HeroData(name: "Wanda", image: UIImage(named: "Vanda")!, text: "You break the rules and become a hero, I do it and I become the enemy. You break the rules and become a hero, I do it and I become the enemy. You break the rules and become a hero, I do it and I become the enemy. You break the rules and become a hero, I do it and I become the enemy. You break the rules and become a hero, I do it and I become the enemy. You break the rules and become a hero, I do it and I become the enemy. You break the rules and become a hero, I do it and I become the enemy. You break the rules and become a hero, I do it and I become the enemy. You break the rules and become a hero, I do it and I become the enemy. You break the rules and become a hero, I do it and I become the enemy."),
                                HeroData(name: "Deadpool", image: UIImage(named: "Deadpool")!, text: "Forget S.H.I.E.L.D., forget rules, forget that these shiny sticks are swords and hop right on."),
                                HeroData(name: "Doctor Strange", image: UIImage(named: "Doc")!, text: "Are you happy?")]
//}
