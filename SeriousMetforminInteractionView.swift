//
//  SeriousMetforminInteractionView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/8/23.
//

import SwiftUI
import AVKit
import Combine
import UIKit

struct SeriousMetforminInteractionView: View {
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    @AppStorage("addTranscript") var transcript = false
    @State private var currentTime: TimeInterval = 0
    @State private var currentText = ""
    private let timeObserver: PlayerTimeObserver
    private let avplayer: AVPlayer
    private let parser: Subtitles?
    
    init(){
        avplayer = AVPlayer(url:  Bundle.main.url(forResource: "MetforminInteractionsComposited", withExtension: "mp4")!)
        parser = try? Subtitles(file: URL(fileURLWithPath: Bundle.main.path(forResource: "Metformininteractions", ofType: "srt")!), encoding: .utf8)
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
                    VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "MetforminInteractionsComposited", withExtension: "mp4")!))
                    Text("Do not drink alcohol while taking this medication. Drinking alcohol while taking this medication increases the risk for dangerously high lactic acid levels. Call emergency services right away if you experience muslc epain or cramps, stomach pain, trouble breathing, or general discomfort and fatigue.")
                        .padding(20)
                }
            } else if ASL{
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "MetforminInteractionsComposited", withExtension: "mp4")!))
            } else{
                Text("Do not drink alcohol while taking this medication. Drinking alcohol while taking this medication increases the risk for dangerously high lactic acid levels. Call emergency services right away if you experience muslc epain or cramps, stomach pain, trouble breathing, or general discomfort and fatigue.")
                    .padding(20)
                    .font(.title2)
                    .lineSpacing(10)
            }
            
        }
        .navigationTitle("Interactions")
        .toolbarBackground(CustomColor.background, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(CustomColor.background, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}

struct SeriousMetforminInteractionView_Previews: PreviewProvider {
    static var previews: some View {
        SeriousMetforminInteractionView()
    }
}
