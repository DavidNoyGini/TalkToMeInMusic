//
//  MidiNote.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 03/01/2022.
//

import Foundation
import AudioKit

struct MidiNote {
    
    let noteNumber: MIDINoteNumber
    let octave: MIDINoteNumber
    let velocity: MIDIVelocity
    let channel: MIDIChannel = 1
    
    init(noteNumber: MIDINoteNumber,octave: MIDINoteNumber = 0, velocity: MIDIVelocity = 60) {
        self.noteNumber = noteNumber + (octave * 12)
        self.octave = octave
        self.velocity = velocity
    }
    
}
