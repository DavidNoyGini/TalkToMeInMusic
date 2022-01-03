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
    let velocity: MIDIVelocity
    let channel: MIDIChannel
    
}
