//
//  MidiPlayer.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 03/01/2022.
//

import Foundation
import AudioKit

class MidiPlayer {
    
    private let engine = AudioEngine()
    var instrument = STKInstrument(instrument: .rhodesPiano)
    
//    public static let sherd = MidiPlayer()
    
     init() {
        
        engine.output = instrument.node
        do {
            try engine.start()
            print("\n***engine started\n")
        } catch {
            print(error, "\n***Field to start engine\n")
        }
    }
    
    func noteOn(midiNote: MidiNote) {
        instrument.node.trigger(note: midiNote.noteNumber,
                      velocity: midiNote.velocity)
    }
      
    func noteOff() {
        instrument.node.stop()
    }
    
    func setInstrument(instrument: Instrument) {
        self.instrument.setInstrument(instrument: .mandolin)
        engine.output = self.instrument.node
    }
    
}
