//  AboutVideoView2.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/6/23.
//

import SwiftUI
import AVKit
import Combine
import UIKit

struct AboutVideoView2: View {
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    @AppStorage("addTranscript") var transcript = false
    @State private var currentTime: TimeInterval = 0
    @State private var currentText = ""
    private let timeObserver: PlayerTimeObserver
    private let avplayer: AVPlayer
    private let parser: Subtitles?
    
    init(){
        avplayer = AVPlayer(url:  Bundle.main.url(forResource: "AtorvastatinCacliumTabletsComposited", withExtension: "mp4")!)
        parser = try? Subtitles(file: URL(fileURLWithPath: Bundle.main.path(forResource: "AtorvastatinCalciumTablets", ofType: "srt")!), encoding: .utf8)
        timeObserver = PlayerTimeObserver(player: avplayer)
    }
    var body: some View {
        NavigationView{
        if ASL && ASLwithCaptions{
            VideoPlayer(player: avplayer) {
                VStack {
                    Spacer()
                    Spacer()
                    Text(currentText)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                        .onReceive(timeObserver.publisher) { time in
                            currentText = parser?.searchSubtitles(at: time) ?? ""
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }.ignoresSafeArea()
        } else if ASL && transcript{
            VStack{
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "AtorvastatinCacliumTabletsComposited", withExtension: "mp4")!))
                Text("Atorvastatin (a TORE va sta tin) treats high cholesterol and reduces the risk of heart attack and stroke. It works by decreasing bad cholesterol and fats (such as LDL, triglycerides) and increasing good cholesterol (HDL) in your blood. It belongs to a group of medicatiosn called statins. Changes to diet and exercise are often combined with this medication. ")
                    .padding(20)
            }
        } else if ASL{
            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "AtorvastatinCacliumTabletsComposited", withExtension: "mp4")!))
        } else{
            Text("Atorvastatin (a TORE va sta tin) treats high cholesterol and reduces the risk of heart attack and stroke. It works by decreasing bad cholesterol and fats (such as LDL, triglycerides) and increasing good cholesterol (HDL) in your blood. It belongs to a group of medicatiosn called statins. Changes to diet and exercise are often combined with this medication. ")
                .multilineTextAlignment(.leading)
                .font(.title2)
                .lineSpacing(10)
                .padding(20)
        }
    }
        .navigationTitle("About Atorvastatin")
        .toolbarBackground(CustomColor.background, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(CustomColor.background, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
}
}

struct AboutVideoView2_Previews: PreviewProvider {
    static var previews: some View {
        AboutVideoView2()
    }
}
