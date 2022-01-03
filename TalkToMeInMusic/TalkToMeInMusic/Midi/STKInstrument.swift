//
//  STKInstrument.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 03/01/2022.
//

import Foundation
import AudioKit
import STKAudioKit

class STKInstrument {
    
    var node: STKBase
    
    init(instrument: Instrument) {
        self.node = instrument.getInstrument()
    }
    
    func setInstrument(instrument: Instrument) {
        self.node = instrument.getInstrument()
    }
}

enum Instrument {
    
    case clarinet
    case flute
    case mandolin
    case rhodesPiano
    
    func getInstrument() -> STKBase {
        switch self {
        case .clarinet:
            return Clarinet()
        case .flute:
            return Flute()
        case .mandolin:
            return MandolinString()
        case .rhodesPiano:
            return RhodesPianoKey()
        }
    }
}
