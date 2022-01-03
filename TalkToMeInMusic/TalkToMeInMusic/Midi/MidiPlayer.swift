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
    let instrument = MIDIInstrument(midiInputName: "Main")
    
    public static let sherd = MidiPlayer()
    
    private init() {
        
        
        engine.output = instrument
        
        do {
            try engine.start()
            print("\n***engine started\n")
        } catch {
            print(error, "\n***Field to start engine\n")
        }
    }
    
    func noteOn(midiNote: MidiNote) {
        instrument.start(noteNumber: midiNote.noteNumber,
                         velocity: midiNote.velocity,
                         channel: midiNote.channel)
    }
      
    func noteOff(midiNote: MidiNote) {
        instrument.stop(noteNumber: midiNote.noteNumber,
                        channel: midiNote.channel)
    }

    
    
}
