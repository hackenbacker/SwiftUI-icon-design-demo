//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//
// Copyright (c) 2023 Hackenbacker.
//
// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php
//
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(
                action: {
                    let _ = print("押したな")
                },
                label: {
                    Rectangle()
                        .foregroundColor(Color(uiColor: .clear))
                        .frame(width: 44, height: 44)
                        .border(Color.green)
                        .overlay {
                            let textColor = Color(uiColor: .label)
                            ZStack {
                                Character1()
                                    .foregroundColor(textColor)
                                    .mask {
                                        Mask1()
                                    }
                                Character2()
                                    .foregroundColor(textColor)
                            }
                        }
                })
        }
    }
    
    private struct Character1: View {
        var body: some View {
            Text("文")
                .font(.system(size: 24,
                              weight: .bold,
                              design: .rounded))
                .position(x: 11, y: 22)
                .offset(x: 5, y: -5)
        }
    }
    
    private struct Mask1: View {
        var body: some View {
            let pos: [CGPoint] = [
                CGPoint(x: -1, y: -1),
                CGPoint(x:  0, y: -1),
                CGPoint(x:  1, y: -1),
                CGPoint(x: -1, y:  0),
                CGPoint(x:  1, y:  0),
                CGPoint(x: -1, y:  1),
                CGPoint(x:  0, y:  1),
                CGPoint(x:  1, y:  1)
            ]
            Rectangle()
                .frame(width: 44, height: 44)
                .overlay {
                    ZStack {
                        ForEach(0..<pos.count, id: \.self) { i in
                            Character2()
                                .offset(x: pos[i].x, y: pos[i].y)
                        }
                    }
                    .blendMode(.destinationOut)
                }
        }
    }

    private struct Character2: View {
        var body: some View {
            Text("A")
                .font(.system(size: 32,
                              design: .rounded))
                .position(x: (44 - 11) + 3, y: 22)
                .offset(x: -5, y: 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
