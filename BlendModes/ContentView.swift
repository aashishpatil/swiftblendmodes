//
//  ContentView.swift
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

extension BlendMode: Identifiable {
    
    public var id: String {
        return "\(self)"
    }
}

struct ContentView: View {
    
    @Environment(BlendOptions.self) var blendOptions
    
    private let adaptiveColumn = [
            GridItem(.adaptive(minimum: 240))
        ]
    
    var body: some View {
        NavigationSplitView {
            VStack {
                HStack {
                    ForEach(blendOptions.overlayColors, id: \.self) { color in
                        Button {
                            blendOptions.overlayColor = color
                        } label: {
                            Circle()
                                .fill(color)
                                .shadow(radius: 8.0)
                                .frame(width: 32, height: 32)
                                
                        }
                    }
                    ColorPicker(selection: Bindable(blendOptions).overlayColor) {
                        Text("Pick Color")
                    }
                }
                Slider(value: Bindable(blendOptions).overlayOpacity) {
                    Text("Overlay Opacity")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("1")
                }

                Image("GeminiGenImagePerson")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320)
                    
                
            }
        } detail: {
            ScrollView {
                LazyVGrid(columns: adaptiveColumn) {
                    ForEach(blendOptions.blendModes) { mode in
                        VStack {
                            Image("GeminiGenImagePerson")
                                .resizable()
                                .scaledToFit()
                                .overlay {
                                    Rectangle()
                                        .fill(RadialGradient(colors: [blendOptions.overlayColor.opacity(0.1), blendOptions.overlayColor.opacity(0.6), blendOptions.overlayColor], center: .init(x: 0.5, y: 0.5), startRadius: 5.0, endRadius: 200.0))
                                        .opacity(blendOptions.overlayOpacity)
                                        .blendMode(mode)
                                }
                            Text("\(mode)")
                                .bold()
                            /*
                             .overlay {
                             Rectangle()
                             .fill(LinearGradient(colors: [Color.white, Color.red, Color.green, Color.blue, Color.yellow, Color.black], startPoint: .init(x: 0.0, y: 0.0), endPoint: .init(x: 1.0, y: 1.0)))
                             .opacity(0.5)
                             .blendMode(mode)
                             }
                             */
                        } //item vstack
                        
                        
                        } //foreach
                } //lazyvgrid
                .padding(8)
            } //scrollview
        }

        
            
        
    }
}

#Preview {
    ContentView()
}
