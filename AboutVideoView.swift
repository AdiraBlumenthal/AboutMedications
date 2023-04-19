

//
//  SideEffectsVideoView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/6/23.
//

import SwiftUI
import AVKit
import Combine
import UIKit

struct AboutVideoView: View {
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    @AppStorage("addTranscript") var transcript = false

    @State private var currentTime: TimeInterval = 0
    @State private var currentText = ""
    private let timeObserver: PlayerTimeObserver
    private let avplayer: AVPlayer
    private let parser: Subtitles?
    
    init(){
        avplayer = AVPlayer(url:  Bundle.main.url(forResource: "Metformin Purpose", withExtension: "MOV")!)
        parser = try? Subtitles(file: URL(fileURLWithPath: Bundle.main.path(forResource: "metformin", ofType: "srt")!), encoding: .utf8)
        timeObserver = PlayerTimeObserver(player: avplayer)
    }
    var body: some View {
        NavigationView{
        if ASL && ASLwithCaptions{
            VideoPlayer(player: avplayer) {
                VStack {
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
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "Metformin Purpose", withExtension: "MOV")!))
                Text("METFORMIN (met FOR min) treats type 2 diabetes. It controls blood sugar (glucose) and helps your body use insulin effectively. This medication is often combined with changes to diet and exercise.")
                    .padding(20)
            }
        }else if ASL{
            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "Metformin Purpose", withExtension: "MOV")!))
        } else{
            Text("METFORMIN (met FOR min) treats type 2 diabetes. It controls blood sugar (glucose) and helps your body use insulin effectively. This medication is often combined with changes to diet and exercise.")
                .multilineTextAlignment(.leading)
                .font(.title2)
                .lineSpacing(10)
                .padding(20)
        }
                
    }
        .navigationTitle("About Metformin")
        .toolbarBackground(CustomColor.background, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(CustomColor.background, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
}
        
}

extension AVPlayer {
    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
}

class PlayerTimeObserver {
  let publisher = PassthroughSubject<TimeInterval, Never>()
  private var timeObservation: Any?
  
  init(player: AVPlayer) {
    // Periodically observe the player's current time, whilst playing
    timeObservation = player.addPeriodicTimeObserver(forInterval: CMTimeMake(value: 1, timescale: 60), queue: nil) { [weak self] time in
      guard let self = self else { return }
      // Publish the new player time
      self.publisher.send(time.seconds)
    }
  }
}

struct AboutVideoView_Previews: PreviewProvider {
    static var previews: some View {
        AboutVideoView()
    }
}
