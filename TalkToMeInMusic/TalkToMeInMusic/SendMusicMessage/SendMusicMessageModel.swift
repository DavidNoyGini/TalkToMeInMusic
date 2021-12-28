//
//  SendMusicMessageModel.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 28/12/2021.
//

import Foundation
import UIKit

protocol SendMusicMessageModel{}

enum Notes: String, CaseIterable, SendMusicMessageModel {
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
    
    func noteColor() -> UIColor{
        switch self {
        case .c, .d, .e, .f, .g, .a, .b:
            return .cyan
        case .db, .eb, .gb, .ab, .bb:
            return .blue
        }
        
        
    }
}

enum NoteAttribute: String, CaseIterable, SendMusicMessageModel {
    case muted = "Muted\nNote"
    
    case short = "Short"
    case medium = "Medium"
    case long = "Long"
    
    case bemol = "b"
    case octaveUp = "Octave Up"
    case octaveDown = "Octave Down"
}
