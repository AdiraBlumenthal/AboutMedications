//
//  InteractionsView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/8/23.
//

import SwiftUI

struct InteractionsView: View {
    var body: some View {
        Form{
            Section(){
                Text("Factors")
                    .bold()
                Text("Alcohol, Tobacco, Cannabis")
            } footer: {
                Text("Health can look for interactions between you medications and life factors.")
            }
//            List{
//                Text("Metformin")
//                    .font(.title2)
//                HStack{
//                    Text("Critical")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .foregroundColor(Color.black)
//                        .bold()
//                    Text("⚠⚠⚠")
//                        .frame(maxWidth: .infinity, alignment: .trailing)
//                        .foregroundColor(Color.black)
//                        .bold()
//                }.listRowBackground(CustomColor.Red)
//                HStack{
//                    Image("thumb")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 20)
//                    Text("None Known")
//                        .foregroundColor(CustomColor.text)
//                }.listRowBackground(CustomColor.pastelRed)
//                HStack{
//                        Text("Serious")
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .foregroundColor(Color.black)
//                            .bold()
//                        Text("⚠⚠")
//                            .frame(maxWidth: .infinity, alignment: .trailing)
//                            .foregroundColor(Color.black)
//                            .bold()
//                }.listRowBackground(Color.orange)
//
//                NavigationLink{
//                    SeriousMetforminInteractionView()
//                } label: {
//                    VStack(alignment: .leading, spacing: 8){
//                        Text("Metformin")
//                            .foregroundColor(CustomColor.text)
//                            .font(.headline)
//                        HStack{
//                            Image("pill")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 20)
//                            Text("Metformin")
//                                .foregroundColor(CustomColor.text)
//                        }
//                        HStack{
//                            Image("wine")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 20)
//                            Text("Alcohol")
//                                .foregroundColor(CustomColor.text)
//                        }
//                    }
//                }.listRowBackground(CustomColor.pastelOrange)
//                HStack{
//                    Text("Moderate")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .foregroundColor(Color.black)
//                        .bold()
//                    Text("⚠")
//                        .frame(maxWidth: .infinity, alignment: .trailing)
//                        .foregroundColor(Color.black)
//                        .bold()
//                }.listRowBackground(Color.yellow)
//                HStack{
//                    Image("thumb")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 20)
//                    Text("None Known")
//                        .foregroundColor(CustomColor.text)
//                }.listRowBackground(CustomColor.pastelYellow)
//            }
//
//
            
//            Section(){
//                VStack{
//                    HStack{
//                        Text("Critical")
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .foregroundColor(Color.black)
//                            .bold()
//                        Text("⚠⚠⚠")
//                            .frame(maxWidth: .infinity, alignment: .trailing)
//                            .foregroundColor(Color.black)
//                            .bold()
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(.red)
//                    Text("None Known")
//                        .foregroundColor(CustomColor.text)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                }
//
//            }header: {
//                Text("Metformin")
//                    .font(.title2)
//                    .foregroundColor(CustomColor.text)
//            }
//            .listRowBackground(Color.red)

                
            Section(){
                List{
                    HStack{
                        Text("Critical")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color.black)
                            .bold()
                        Text("⚠⚠⚠")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(Color.black)
                            .bold()
                        }.listRowBackground(Color.red)
                    NavigationLink{
                        CriticalStatinInteractionView()
                    } label: {
                        VStack(alignment: .leading, spacing: 8){
                            Text("Atorvastatin")
                                .foregroundColor(CustomColor.text)
                                .font(.headline)
                            HStack{
                                Image("pill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                Text("Atorvastatin")
                                    .foregroundColor(CustomColor.text)
                            }
                            HStack{
                                Image("grapefruit")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                Text("Grapefruit")
                                    .foregroundColor(CustomColor.text)
                            }
                        }
                    }.listRowBackground(CustomColor.pastelRed)
                }
                
            }

//            Section(){
//                VStack(alignment: .leading, spacing: 8){
//                    Text("Metformin")
//                        .font(.headline)
//                        .foregroundColor(CustomColor.text)
//                    Text("None Known")
//                        .foregroundColor(CustomColor.text)
//                }
//                NavigationLink{
//                    CriticalStatinInteractionView()
//                } label: {
//                    VStack(alignment: .leading, spacing: 8){
//                        Text("Atorvastatin")
//                            .foregroundColor(CustomColor.text)
//                            .font(.headline)
//                        HStack{
//                            Image("pill")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 20)
//                            Text("Atorvastatin")
//                                .foregroundColor(CustomColor.text)
//                        }
//                        HStack{
//                            Image("grapefruit")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 20)
//                            Text("Grapefruit")
//                                .foregroundColor(CustomColor.text)
//                        }
//                    }
//                }
//            }.listRowBackground(CustomColor.pastelRed)

            Section(){
                List{
                    HStack{
                        Text("Serious")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color.black)
                            .bold()
                        Text("⚠⚠")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(Color.black)
                            .bold()
                    }.listRowBackground(Color.orange)
                    NavigationLink{
                        SeriousMetforminInteractionView()
                    } label: {
                        VStack(alignment: .leading, spacing: 8){
                            Text("Metformin")
                                .foregroundColor(CustomColor.text)
                                .font(.headline)
                            HStack{
                                Image("pill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                Text("Metformin")
                                    .foregroundColor(CustomColor.text)
                            }
                            HStack{
                                Image("wine")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                Text("Alcohol")
                                    .foregroundColor(CustomColor.text)
                            }
                        }
                    }.listRowBackground(CustomColor.pastelOrange)
                }
            }
            
//            Section(){
//                HStack{
//                    Text("Serious")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .foregroundColor(Color.black)
//                        .bold()
//                    Text("⚠⚠")
//                        .frame(maxWidth: .infinity, alignment: .trailing)
//                        .foregroundColor(Color.black)
//                        .bold()
//                }
//            }.listRowBackground(Color.orange)
//
//            Section(){
//                NavigationLink{
//                    SeriousMetforminInteractionView()
//                } label: {
//                    VStack(alignment: .leading, spacing: 8){
//                        Text("Metformin")
//                            .foregroundColor(CustomColor.text)
//                            .font(.headline)
//                        HStack{
//                            Image("pill")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 20)
//                            Text("Metformin")
//                                .foregroundColor(CustomColor.text)
//                        }
//                        HStack{
//                            Image("wine")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 20)
//                            Text("Alcohol")
//                                .foregroundColor(CustomColor.text)
//                        }
//                    }
//                }
//                VStack(alignment: .leading, spacing: 8){
//                    Text("Atorvastatin")
//                        .foregroundColor(CustomColor.text)
//                        .font(.headline)
//                    Text("None Known")
//                        .foregroundColor(CustomColor.text)
//                }

//            }.listRowBackground(CustomColor.pastelOrange)
            Section{
                List{
                    HStack{
                        Text("Moderate")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color.black)
                            .bold()
                        Text("⚠")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(Color.black)
                            .bold()
                    }.listRowBackground(Color.gray)
                    Text("None Known")
                        .foregroundColor(CustomColor.text)
                        .listRowBackground(CustomColor.Grey)
                }
            }
            
//            Section(){
//                HStack{
//                    Text("Moderate")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .foregroundColor(Color.black)
//                        .bold()
//                    Text("⚠")
//                        .frame(maxWidth: .infinity, alignment: .trailing)
//                        .foregroundColor(Color.black)
//                        .bold()
//                }
//            }
//            .listRowBackground(Color.yellow)
//
//            Section(){
//                Text("None Known")
//                    .foregroundColor(CustomColor.text)
//                VStack(alignment: .leading, spacing: 8){
//                    Text("Metformin")
//                        .foregroundColor(CustomColor.text)
//                        .font(.headline)
//                    Text("None Known")
//                        .foregroundColor(CustomColor.text)
//                }
//                VStack(alignment: .leading, spacing: 8){
//                    Text("Atorvastatin")
//                        .foregroundColor(CustomColor.text)
//                        .font(.headline)
//                    Text("None Known")
//                        .foregroundColor(CustomColor.text)
//                }
//            }.listRowBackground(CustomColor.pastelYellow)
            
        }
        .navigationBarTitle("Interactions")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                NavigationLink{
                    InteractionsInfoView()
                } label: {
                    Image(systemName: "info.circle")
                        .padding()
                }
            }
        }
    }
}




struct CustomColor{
    static let pastelRed = Color("pastelRed")
    static let pastelOrange = Color("pastelOrange")
    static let pastelYellow = Color("pastelYellow")
    static let background = Color("background")
    static let text = Color("text")
    static let Red = Color("Red")
    static let Yellow = Color("Yellow")
    static let Orange = Color("Orange")
    static let Grey = Color("Grey")
}

struct InteractionsView_Previews: PreviewProvider {
    static var previews: some View {
        InteractionsView()
    }
}
