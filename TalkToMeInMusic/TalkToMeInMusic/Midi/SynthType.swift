////
////  SynthType.swift
////  TalkToMeInMusic
////
////  Created by David Noy on 03/01/2022.
////
//
//import Foundation
//import AudioKit
//import SoundpipeAudioKit
//import AudioKitEX
//
//class SynthType {
//
//    let oscEnvelope:AmplitudeEnvelope
//    let fmSynthEnvelope:AmplitudeEnvelope
//    let pluckedStringEnvelope:AmplitudeEnvelope
//    let dynamicOscillatorEnvelope:AmplitudeEnvelope
//    let pwmOscillatorEnvelope:AmplitudeEnvelope
//    let vocalTractEnvelope:AmplitudeEnvelope
//
//    let oscillator = Oscillator()
//    let fmSynth = FMOscillator()
//    let pluckedString = PluckedString(frequency: 200, amplitude: 0.6, lowestFrequency: 50)
//    let vocalTract = VocalTract()
//    let pwmOscillator = PWMOscillator()
//    let dynamicOscillator = DynamicOscillator()
//    let mixer = Mixer()
//    let fader:Fader
//    var choosenSynth:ChooseSynth = .dynamicOscillator
//    var noteOnOff = false
//    var frequency:AUValue = 0
//
//
//    init() {
//        dynamicOscillator.setWaveform(Table(.positiveSine))
//        fader = Fader(mixer)
//
//        oscEnvelope = AmplitudeEnvelope(oscillator)
//
//        fmSynthEnvelope = AmplitudeEnvelope(fmSynth)
//
//        pluckedStringEnvelope = AmplitudeEnvelope(pluckedString)
//
//        dynamicOscillatorEnvelope = AmplitudeEnvelope(dynamicOscillator)
//
//        pwmOscillatorEnvelope = AmplitudeEnvelope(pwmOscillator)
//
//        vocalTractEnvelope = AmplitudeEnvelope(vocalTract)
//        noteOff()
//    }
//
//
//    // choose synth - using mixer to be able to change node
//    func setSynth(_ type: Int){
//
//        stopSynth()
//        mixer.removeAllInputs()
//        choosenSynth = choosenSynthFromNum(num: type)
//
//        switch choosenSynth {
//        case .oscillator:
//            oscillator.start()
//            mixer.addInput(oscEnvelope)
//        case .fmSynth:
//            fmSynth.start()
//            mixer.addInput(fmSynthEnvelope)
//        case .pluckedString:
//            pluckedString.start()
//            mixer.addInput(pluckedStringEnvelope)
//        case .vocalTract:
//            vocalTract.start()
//            mixer.addInput(vocalTractEnvelope)
//        case .pwmOscillator:
//            pwmOscillator.start()
//            mixer.addInput(pwmOscillatorEnvelope)
//        case .dynamicOscillator:
//            dynamicOscillator.start()
//            mixer.addInput(dynamicOscillatorEnvelope)
//        }
//
//    }
//
//    private func choosenSynthFromNum(num: Int) -> ChooseSynth{
//
//        switch num {
//        case 0:
//            return .oscillator
//        case 1:
//            return .fmSynth
//        case 2:
//            return .pluckedString
//        case 3:
//            return .dynamicOscillator
//        case 4:
//            return .pwmOscillator
//        case 5:
//            return .vocalTract
//        default:
//            return .oscillator
//        }
//
//
//    }
//
//    func startSynth(){
//
//        stopSynth()
//
//        switch choosenSynth {
//        case .oscillator:
//            oscillator.start()
//        case .fmSynth:
//            fmSynth.start()
//        case .pluckedString:
//            pluckedString.start()
//        case .vocalTract:
//            vocalTract.start()
//        case .pwmOscillator:
//            pwmOscillator.start()
//        case .dynamicOscillator:
//            dynamicOscillator.start()
//        }
//    }
//
//    func stopSynth(){
//        oscillator.stop()
//        fmSynth.stop()
//        pluckedString.stop()
//        vocalTract.stop()
//        pwmOscillator.stop()
//        dynamicOscillator.stop()
//    }
//
//    func setNoteFrequency(_ frequency: AUValue){
//        oscillator.frequency = frequency
//        fmSynth.baseFrequency = frequency
//        dynamicOscillator.frequency = frequency
//        pluckedString.frequency = frequency
//        pwmOscillator.frequency = frequency
//        vocalTract.frequency = frequency
//        self.frequency = frequency
//    }
//
//    // MARK: Envelope
//
//    func noteOn(){
//
//        noteOnOff = true
//
//        switch choosenSynth {
//        case .oscillator:
//            oscEnvelope.openGate()
//        case .fmSynth:
//            fmSynthEnvelope.openGate()
//        case .pluckedString:
//            pluckedStringEnvelope.openGate()
//        case .dynamicOscillator:
//            dynamicOscillatorEnvelope.openGate()
//        case .pwmOscillator:
//            pwmOscillatorEnvelope.openGate()
//        case .vocalTract:
//            vocalTractEnvelope.openGate()
//        }
//    }
//
//    func noteOff(){
//
//        noteOnOff = false
//
//        oscEnvelope.closeGate()
//        fmSynthEnvelope.closeGate()
//        pluckedStringEnvelope.closeGate()
//        dynamicOscillatorEnvelope.closeGate()
//        pwmOscillatorEnvelope.closeGate()
//        vocalTractEnvelope.closeGate()
//
//
//    }
//
//    func setAttackDuration(_ attackDuration: AUValue){
//
//        switch choosenSynth {
//        case .oscillator:
//            oscEnvelope.attackDuration = attackDuration
//        case .fmSynth:
//            fmSynthEnvelope.attackDuration = attackDuration
//        case .pluckedString:
//            pluckedStringEnvelope.attackDuration = attackDuration
//        case .dynamicOscillator:
//            dynamicOscillatorEnvelope.attackDuration = attackDuration
//        case .pwmOscillator:
//            pwmOscillatorEnvelope.attackDuration = attackDuration
//        case .vocalTract:
//            vocalTractEnvelope.attackDuration = attackDuration
//        }
//
//
//    }
//
//    func setDecayDuration(_ decayDuration:AUValue){
//
//        switch choosenSynth {
//        case .oscillator:
//            oscEnvelope.decayDuration = decayDuration
//        case .fmSynth:
//            fmSynthEnvelope.decayDuration = decayDuration
//        case .pluckedString:
//            pluckedStringEnvelope.decayDuration = decayDuration
//        case .dynamicOscillator:
//            dynamicOscillatorEnvelope.decayDuration = decayDuration
//        case .pwmOscillator:
//            pwmOscillatorEnvelope.decayDuration = decayDuration
//        case .vocalTract:
//            vocalTractEnvelope.decayDuration = decayDuration
//        }
//    }
//
//    func setSustainLevel(_ sustainLevel:AUValue){
//
//        switch choosenSynth {
//        case .oscillator:
//            oscEnvelope.sustainLevel = sustainLevel
//        case .fmSynth:
//            fmSynthEnvelope.sustainLevel = sustainLevel
//        case .pluckedString:
//            pluckedStringEnvelope.sustainLevel = sustainLevel
//        case .dynamicOscillator:
//            dynamicOscillatorEnvelope.sustainLevel = sustainLevel
//        case .pwmOscillator:
//            pwmOscillatorEnvelope.sustainLevel = sustainLevel
//        case .vocalTract:
//            vocalTractEnvelope.sustainLevel = sustainLevel
//        }
//    }
//
//    func setReleaseDuration(_ releaseDuration:AUValue){
//        oscEnvelope.releaseDuration = releaseDuration
//        switch choosenSynth {
//        case .oscillator:
//            oscEnvelope.releaseDuration = releaseDuration
//        case .fmSynth:
//            fmSynthEnvelope.releaseDuration = releaseDuration
//        case .pluckedString:
//            pluckedStringEnvelope.releaseDuration = releaseDuration
//        case .dynamicOscillator:
//            dynamicOscillatorEnvelope.releaseDuration = releaseDuration
//        case .pwmOscillator:
//            pwmOscillatorEnvelope.releaseDuration = releaseDuration
//        case .vocalTract:
//            vocalTractEnvelope.releaseDuration = releaseDuration
//        }
//    }
//
//    // MARK: FmSynth
//
//    func setCarrierMultiplier(_ carrierMultiplier:AUValue){
//        fmSynth.carrierMultiplier = carrierMultiplier
//    }
//
//    func setModulatingMultiplier(_ modulatingMultiplier:AUValue){
//        fmSynth.modulatingMultiplier = modulatingMultiplier
//    }
//
//    func setModulationIndex(_ modulationIndex:AUValue){
//        fmSynth.modulationIndex = modulationIndex
//    }
//
//    // MARK: DynamicOscillator
//
//    func setDetuningOffset(_ detuningOffset:AUValue){
//        dynamicOscillator.detuningOffset = detuningOffset
//    }
//
//    func setWaveform(_ waveform:Table){
//        dynamicOscillator.setWaveform(waveform)
//    }
//
//    // both
//    func setDetuningMultiplier(_ detuningMultiplier:AUValue){
//
//        if choosenSynth == ChooseSynth.dynamicOscillator {
//            dynamicOscillator.detuningMultiplier = detuningMultiplier
//        } else {
//            pwmOscillator.detuningMultiplier = detuningMultiplier
//        }
//    }
//
//    // MARK: PwmOscillator
//
//    func setPulseWidth(_ pulseWidth:AUValue){
//        pwmOscillator.pulseWidth = pulseWidth
//    }
//
//    // MARK: VocalTract
//
//    func setTonguePosition(_ tonguePosition:AUValue){
//        vocalTract.tonguePosition = tonguePosition
//    }
//
//    func setTongueDiameter(_ tongueDiameter:AUValue){
//        vocalTract.tongueDiameter = tongueDiameter
//    }
//
//    func setTenseness(_ tenseness:AUValue){
//        vocalTract.tenseness = tenseness
//    }
//
//    func setNasality(_ nasality:AUValue){
//        vocalTract.nasality = nasality
//    }
//
//
//    // MARK: PluckedString
//
//    func triggerPluckedString(){
//        pluckedString.trigger(frequency: pluckedString.frequency)
//    }
//
//}
//
//enum ChooseSynth {
//    case oscillator
//    case fmSynth
//    case pluckedString
//    case dynamicOscillator
//    case pwmOscillator
//    case vocalTract
//}
//
//
