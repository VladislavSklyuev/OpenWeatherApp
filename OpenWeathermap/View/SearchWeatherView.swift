//
//  SearchWeatherView.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 07.12.2023.
//

import SwiftUI

struct SearchWeatherView: View {
    @StateObject var viewModel = SearchViewModel()
    @State private var showWeather = false
    @FocusState private var isFocused: Bool
    @State var city = ""
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Поиск города", text: $city)
                        .frame(height: 22)
                        .padding(8).padding(.leading, 24)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(8)
                        .focused($isFocused)
                        .overlay(alignment: .leading) {
                            Image(systemName: "magnifyingglass").padding(.leading, 8).foregroundStyle(.gray)
                        }
                        .onSubmit {
                            guard city != "" else { return }
                            Task {
                                viewModel.fetchGeo(the: city)
                            }
                            isFocused = false
                           
                        }
                }
                //Spacer()
                if viewModel.currentGeo.isEmpty {
                    
                } else {
                    Button {
                        viewModel.fetchWeather()
                        showWeather.toggle()
                        city = ""
                    } label: {
                        HStack {
                            Text(viewModel.currentGeo[0].localNames.ru).foregroundStyle(.white)
                            Spacer()
                        }
                    }.padding()
                    
                    //Spacer()
                }
                Spacer()
            }.padding(.horizontal, 16)
            Spacer()
            //Text(viewModel.currentGeo.name).searchable(text: $city, prompt: "Поиск города или аэропорта")
                .navigationTitle("Поиск")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                        } label: {
                            Image(systemName: "ellipsis.circle")
                                .foregroundColor(.white)
                        }
                    }
                }
        }.preferredColorScheme(.dark)
            .sheet(isPresented: $showWeather) {
                FoundWeatherView().environmentObject(viewModel)
            }
            .alert("Город не найден", isPresented: $viewModel.showAlertSearchFalse) {
                Button("Ок") {
                    
                }
            } message: {
                Text("Повторите попытку")
            }
            .alert("Неккорректный запрос", isPresented: $viewModel.showAlertFalseRequest) {
                Button("Ок") {
                    
                }
            } message: {
                Text("Повторите попытку")
            }
            .alert("Неккорректный ответ", isPresented: $viewModel.showAlertFalseResponse) {
                Button("Ок") {
                    
                }
            } message: {
                Text("Повторите попытку")
            }
            .alert("Неккорректный URL", isPresented: $viewModel.showAlertFalseURL) {
                Button("Ок") {
                    
                }
            } message: {
                Text("Повторите попытку")
            }
    }
}

#Preview {
    SearchWeatherView()
}
