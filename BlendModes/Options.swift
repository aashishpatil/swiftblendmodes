//
//  Options.swift
//  BlendModes
//
//  Created by Aashish Patil on 10/23/25.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


import SwiftUI
import Observation

@Observable
class BlendOptions {
    
    @ObservationIgnored
    let blendModes: [BlendMode] = [.normal, .color, .colorBurn, .colorDodge, .darken, .destinationOut, .destinationOver, .difference, .exclusion, .hardLight, .hue, .lighten, .luminosity, .multiply, .plusDarker, .plusLighter, .saturation, .screen, .softLight, .sourceAtop]
    
    @ObservationIgnored
    let overlayColors: [Color] = [.white, .black, .red, .green, .blue]
    
    var overlayColor: Color = .white
    var overlayOpacity: Double = 0.5
}
