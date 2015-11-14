//
//  AKAURingModulatorWindow.swift
//  AudioKit
//
//  Autogenerated by scripts by Aurelius Prochazka. Do not edit directly.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#if os(OSX)
    import Foundation
    import Cocoa

    public class AKAURingModulatorWindow: NSWindow {

        let windowWidth = 400
        let padding = 30
        let sliderHeight = 20
        let numberOfComponents = 4

        public let ringModFreq1Slider: NSSlider
        public let ringModFreq2Slider: NSSlider
        public let ringModBalanceSlider: NSSlider
        public let finalMixSlider: NSSlider

        let ringModFreq1TextField: NSTextField
        let ringModFreq2TextField: NSTextField
        let ringModBalanceTextField: NSTextField
        let finalMixTextField: NSTextField

        var ringModulator: AKAURingModulator

        public init(_ control: AKAURingModulator) {
            ringModulator = control
            let sliderWidth = windowWidth - 2 * padding

            ringModFreq1Slider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            ringModFreq2Slider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            ringModBalanceSlider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            finalMixSlider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))

            ringModFreq1TextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            ringModFreq2TextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            ringModBalanceTextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            finalMixTextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))

            let titleHeightApproximation = 50
            let windowHeight = padding * 2 + titleHeightApproximation + numberOfComponents * 3 * sliderHeight

            super.init(contentRect: NSRect(x: padding, y: padding, width: windowWidth, height: windowHeight),
                styleMask: NSTitledWindowMask,
                backing: .Buffered,
                `defer`: false)
            self.hasShadow = true
            self.styleMask = NSBorderlessWindowMask | NSResizableWindowMask
            self.movableByWindowBackground = true
            self.level = 7
            self.title = "AKAURingModulator"

            let viewRect = NSRect(x: 0, y: 0, width: windowWidth, height: windowHeight)
            let view = NSView(frame: viewRect)

            let topTitle = NSTextField()
            topTitle.stringValue = "AKAURingModulator"
            topTitle.editable = false
            topTitle.drawsBackground = false
            topTitle.bezeled = false
            topTitle.alignment = NSCenterTextAlignment
            topTitle.font = NSFont(name: "Lucida Grande", size: 24)
            topTitle.sizeToFit()
            topTitle.frame.origin.x = CGFloat(windowWidth / 2) - topTitle.frame.width / 2
            topTitle.frame.origin.y = CGFloat(windowHeight - padding) - topTitle.frame.height
            view.addSubview(topTitle)

            ringModFreq1TextField.stringValue = "Ring Mod Freq1: \(ringModulator.frequency1) Hertz"
            ringModFreq1TextField.editable = false
            ringModFreq1TextField.drawsBackground = false
            ringModFreq1TextField.bezeled = false
            ringModFreq1TextField.frame.origin.y = topTitle.frame.origin.y -  2 *  CGFloat(sliderHeight)
            view.addSubview(ringModFreq1TextField)

            ringModFreq1Slider.target = self
            ringModFreq1Slider.action = "updateRingmodfreq1"
            ringModFreq1Slider.minValue = 0.5
            ringModFreq1Slider.maxValue = 8000
            ringModFreq1Slider.floatValue = Float(ringModulator.frequency1)
            ringModFreq1Slider.frame.origin.y = topTitle.frame.origin.y - 3 * CGFloat(sliderHeight)
            view.addSubview(ringModFreq1Slider)
            ringModFreq2TextField.stringValue = "Ring Mod Freq2: \(ringModulator.frequency2) Hertz"
            ringModFreq2TextField.editable = false
            ringModFreq2TextField.drawsBackground = false
            ringModFreq2TextField.bezeled = false
            ringModFreq2TextField.frame.origin.y = topTitle.frame.origin.y -  5 *  CGFloat(sliderHeight)
            view.addSubview(ringModFreq2TextField)

            ringModFreq2Slider.target = self
            ringModFreq2Slider.action = "updateRingmodfreq2"
            ringModFreq2Slider.minValue = 0.5
            ringModFreq2Slider.maxValue = 8000
            ringModFreq2Slider.floatValue = Float(ringModulator.frequency2)
            ringModFreq2Slider.frame.origin.y = topTitle.frame.origin.y - 6 * CGFloat(sliderHeight)
            view.addSubview(ringModFreq2Slider)
            ringModBalanceTextField.stringValue = "Ring Mod Balance: \(ringModulator.balance) Percent"
            ringModBalanceTextField.editable = false
            ringModBalanceTextField.drawsBackground = false
            ringModBalanceTextField.bezeled = false
            ringModBalanceTextField.frame.origin.y = topTitle.frame.origin.y -  8 *  CGFloat(sliderHeight)
            view.addSubview(ringModBalanceTextField)

            ringModBalanceSlider.target = self
            ringModBalanceSlider.action = "updateRingmodbalance"
            ringModBalanceSlider.minValue = 0
            ringModBalanceSlider.maxValue = 100
            ringModBalanceSlider.floatValue = Float(ringModulator.balance)
            ringModBalanceSlider.frame.origin.y = topTitle.frame.origin.y - 9 * CGFloat(sliderHeight)
            view.addSubview(ringModBalanceSlider)
            finalMixTextField.stringValue = "Mix: \(ringModulator.mix) Percent"
            finalMixTextField.editable = false
            finalMixTextField.drawsBackground = false
            finalMixTextField.bezeled = false
            finalMixTextField.frame.origin.y = topTitle.frame.origin.y -  11 *  CGFloat(sliderHeight)
            view.addSubview(finalMixTextField)

            finalMixSlider.target = self
            finalMixSlider.action = "updateMix"
            finalMixSlider.minValue = 0
            finalMixSlider.maxValue = 100
            finalMixSlider.floatValue = Float(ringModulator.mix)
            finalMixSlider.frame.origin.y = topTitle.frame.origin.y - 12 * CGFloat(sliderHeight)
            view.addSubview(finalMixSlider)

            self.contentView!.addSubview(view)
            self.makeKeyAndOrderFront(nil)
        }

        internal func updateRingmodfreq1() {
            ringModulator.frequency1 = ringModFreq1Slider.floatValue
            ringModFreq1TextField.stringValue = "Frequency 1 \(String(format: "%0.4f", ringModulator.frequency1)) Hertz"
        }
        internal func updateRingmodfreq2() {
            ringModulator.frequency2 = ringModFreq2Slider.floatValue
            ringModFreq2TextField.stringValue = "Ring Mod Freq2 \(String(format: "%0.4f", ringModulator.frequency2)) Hertz"
        }
        internal func updateRingmodbalance() {
            ringModulator.balance = ringModBalanceSlider.floatValue
            ringModBalanceTextField.stringValue = "Ring Mod Balance \(String(format: "%0.4f", ringModulator.balance)) Percent"
        }
        internal func updateFinalmix() {
            ringModulator.mix = finalMixSlider.floatValue
            finalMixTextField.stringValue = "Final Mix \(String(format: "%0.4f", ringModulator.mix)) Percent"
        }

        required public init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

#endif
