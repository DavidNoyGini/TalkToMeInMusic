//
//  SendMusicMessageModel.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 28/12/2021.
//

import UIKit
import AudioKit

protocol SendMusicMessageModelPotocol {
    var title: String {get}
    func cellColor() -> UIColor
}

enum SectionType: String, CaseIterable {
    case note = "Note"
    case noteAttribute = "Note Attribute"
}

struct Section: Hashable {
    let sectionType: SectionType
    let title: String
    let items: [AnyHashable]
    
    init(sectionType: SectionType, items: [AnyHashable]) {
        self.sectionType = sectionType
        self.title = sectionType.rawValue
        self.items = items
    }
}

enum Note: String, CaseIterable, SendMusicMessageModelPotocol {
    
    case c = "C"
    case db = "C#/Db"
    case d = "D"
    case eb = "D#/Eb"
    case e = "E"
    case f = "F"
    case gb = "F#/Gb"
    case g = "G"
    case ab = "G#/Ab"
    case a = "A"
    case bb = "A#/Bb"
    case b = "B"
    
    var title: String{
        return self.rawValue
    }
    
    func cellColor() -> UIColor{
        switch self {
        case .c, .d, .e, .f, .g, .a, .b:
            return .cyan
        case .db, .eb, .gb, .ab, .bb:
            return .systemPink
        }  
    }
}

enum NoteAttribute: String, CaseIterable, SendMusicMessageModelPotocol {
    
    case muted = "Muted\nNote"
    
    case short = "Short"
    case medium = "Med"
    case long = "Long"
    
//    case bemol = "b"
    case octaveUp = "Octave Up"
    case octaveDown = "Octave Down"
    
    var title: String{
        return self.rawValue
    }
    
    func cellColor() -> UIColor {
        return .orange
    }
}
