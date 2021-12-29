//
//  SendMusicMessageModel.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 28/12/2021.
//

import Foundation
import UIKit

protocol SendMusicMessageModelPotocol{
    var rowValuw: String {get}
    func cellColor() -> UIColor
}

enum Notes: String, CaseIterable, SendMusicMessageModelPotocol {
    
    case c = "C"
    case db = "Db"
    case d = "D"
    case eb = "Eb"
    case e = "E"
    case f = "F"
    case gb = "Gb"
    case g = "G"
    case ab = "Ab"
    case a = "A"
    case bb = "Bb"
    case b = "B"
    
    var rowValuw: String{
        return self.rawValue
    }
    
    func cellColor() -> UIColor{
        switch self {
        case .c, .d, .e, .f, .g, .a, .b:
            return .cyan
        case .db, .eb, .gb, .ab, .bb:
            return .blue
        }  
    }
}

enum NoteAttribute: String, CaseIterable, SendMusicMessageModelPotocol {
    
    case muted = "Muted\nNote"
    
    case short = "Short"
    case medium = "Medium"
    case long = "Long"
    
    case bemol = "b"
    case octaveUp = "Octave Up"
    case octaveDown = "Octave Down"
    
    var rowValuw: String{
        return self.rawValue
    }
    
    func cellColor() -> UIColor {
        return .orange
    }
}
