//
//  WeatherView.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 12.12.2023.
//

import SwiftUI

struct FoundWeatherView: View {
    @EnvironmentObject var vm: SearchViewModel
    @Environment (\.dismiss) var dismiss
    var body: some View {
        if vm.currentWeather == nil {
            ProgressView()
        } else {
            VStack {
                HStack {
                    Button("Отменить") {
                        dismiss()
                    }.foregroundStyle(.white)
                    Spacer()
                    Text("Добавить")
                }.padding()
                ScrollView(showsIndicators: false) {
                    VStack {
                        VStack {
                            Text(vm.currentGeo[0].localNames.ru).font(.title2)
                            HStack {
                                Text("\(ExtString().convert(temp: vm.currentWeather!.current.temp))°\(Locale.current.identifier == "ru_RU" ? "C" : "F")").font(.system(size: 80, weight: .thin))
                                Image(vm.currentWeather!.current.weather[0].icon)
                            }
                            Text(vm.currentWeather!.current.weather[0].description)
                            //Text("Макс.: \(String(format: "%.f", viewModel.currentWeatherData.main.tempMax))°, мин.: \(String(format: "%.f", viewModel.currentWeatherData.main.tempMin))°")
                        }
                        
                        VStack(alignment: .leading) {
                            //                            HStack {
                            //                                Text("Ожидается дымка около 19:00").padding(.top).padding(.leading).foregroundStyle(.white)
                            //                            }
                            //                            Divider().background(.white)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    VStack(spacing: 8) {
                                        Text("Сейчас")
                                        Image(vm.currentWeather!.hourly[0].weather[0].icon).resizable().frame(width: 40, height: 40)
                                        Text("\(ExtString().convert(temp: vm.currentWeather!.hourly[0].temp))°")
                                    }
                                    VStack(spacing: 8) {
                                        Text(ExtDate().convert(unixTimestamp: vm.currentWeather!.hourly[1].dt, dateFormat: "HH"))
                                        Image(vm.currentWeather!.hourly[1].weather[0].icon).resizable().frame(width: 40, height: 40)
                                        Text("\(ExtString().convert(temp: vm.currentWeather!.hourly[1].temp))°")
                                    }
                                    VStack(spacing: 8) {
                                        Text(ExtDate().convert(unixTimestamp: vm.currentWeather!.hourly[2].dt, dateFormat: "HH"))
                                        Image(vm.currentWeather!.hourly[2].weather[0].icon).resizable().frame(width: 40, height: 40)
                                        Text("\(ExtString().convert(temp: vm.currentWeather!.hourly[2].temp))°")
                                    }
                                    VStack(spacing: 8) {
                                        Text(ExtDate().convert(unixTimestamp: vm.currentWeather!.hourly[3].dt, dateFormat: "HH"))
                                        Image(vm.currentWeather!.hourly[3].weather[0].icon).resizable().frame(width: 40, height: 40)
                                        Text("\(ExtString().convert(temp: vm.currentWeather!.hourly[3].temp))°")
                                    }
                                    VStack(spacing: 8) {
                                        Text(ExtDate().convert(unixTimestamp: vm.currentWeather!.hourly[4].dt, dateFormat: "HH"))
                                        Image(vm.currentWeather!.hourly[4].weather[0].icon).resizable().frame(width: 40, height: 40)
                                        Text("\(ExtString().convert(temp: vm.currentWeather!.hourly[4].temp))°")
                                    }
                                    VStack(spacing: 8) {
                                        Text(ExtDate().convert(unixTimestamp: vm.currentWeather!.hourly[5].dt, dateFormat: "HH"))
                                        Image(vm.currentWeather!.hourly[5].weather[0].icon).resizable().frame(width: 40, height: 40)
                                        Text("\(ExtString().convert(temp: vm.currentWeather!.hourly[5].temp))°")
                                    }
                                    VStack(spacing: 8) {
                                        Text(ExtDate().convert(unixTimestamp: vm.currentWeather!.hourly[6].dt, dateFormat: "HH"))
                                        Image(vm.currentWeather!.hourly[6].weather[0].icon).resizable().frame(width: 40, height: 40)
                                        Text("\(ExtString().convert(temp: vm.currentWeather!.hourly[6].temp))°")
                                    }
                                }.padding().foregroundStyle(.white)
                            }
                        }.background(.ultraThinMaterial).cornerRadius(12)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("ПРОГНОЗ НА 7 ДНЕЙ").padding(.top).padding(.leading).foregroundStyle(.white)
                            }
                            VStack {
                                Divider().background(.white)
                                HStack {
                                    Text("Сегодня")
                                    Image(vm.currentWeather!.daily[0].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: vm.currentWeather!.daily[0].temp.min))°")
                                    Spacer()
                                    Text("\(ExtString().convert(temp: vm.currentWeather!.daily[0].temp.max))°")
                                }.padding(.vertical, 4)
                                Divider().background(.white)
                                HStack {
                                    Text(String(ExtDate().convert(unixTimestamp: vm.currentWeather!.daily[1].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                    Image(vm.currentWeather!.daily[1].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: vm.currentWeather!.daily[1].temp.min))°")
                                    Spacer()
                                    Text("\(ExtString().convert(temp: vm.currentWeather!.daily[1].temp.max))°")
                                }.padding(.vertical, 4)
                                Divider().background(.white)
                                HStack {
                                    Text(String(ExtDate().convert(unixTimestamp: vm.currentWeather!.daily[2].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                    Image(vm.currentWeather!.daily[2].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: vm.currentWeather!.daily[2].temp.min))°")
                                    Spacer()
                                    Text("\(ExtString().convert(temp: vm.currentWeather!.daily[2].temp.max))°")
                                }.padding(.vertical, 4)
                                Divider().background(.white)
                                HStack {
                                    Text(String(ExtDate().convert(unixTimestamp: vm.currentWeather!.daily[3].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                    Image(vm.currentWeather!.daily[3].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: vm.currentWeather!.daily[3].temp.min))°")
                                    Spacer()
                                    Text("\(ExtString().convert(temp: vm.currentWeather!.daily[3].temp.max))°")
                                }.padding(.vertical, 4)
                                Divider().background(.white)
                                HStack {
                                    Text(String(ExtDate().convert(unixTimestamp: vm.currentWeather!.daily[4].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                    Image(vm.currentWeather!.daily[4].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: vm.currentWeather!.daily[4].temp.min))°")
                                    Spacer()
                                    Text("\(ExtString().convert(temp: vm.currentWeather!.daily[4].temp.max))°")
                                }.padding(.vertical, 4)
                                Divider().background(.white)
                                HStack {
                                    Text(String(ExtDate().convert(unixTimestamp: vm.currentWeather!.daily[5].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                    Image(vm.currentWeather!.daily[5].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: vm.currentWeather!.daily[5].temp.min))°")
                                    Spacer()
                                    Text("\(ExtString().convert(temp: vm.currentWeather!.daily[5].temp.max))°")
                                }.padding(.vertical, 4)
                                Divider().background(.white)
                                HStack {
                                    Text(String(ExtDate().convert(unixTimestamp: vm.currentWeather!.daily[6].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                    Image(vm.currentWeather!.daily[6].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: vm.currentWeather!.daily[6].temp.min))°")
                                    Spacer()
                                    Text("\(ExtString().convert(temp: vm.currentWeather!.daily[6].temp.max))°")
                                }.padding(.vertical, 4)
                            }.padding(.horizontal).padding(.bottom)
                        }.background(.ultraThinMaterial).cornerRadius(12)
                    }.padding().padding(.vertical, 40)
                    
                }
                
            }.background(Image("stars").resizable().aspectRatio(contentMode: .fill)).ignoresSafeArea()
        }
    }
}

#Preview {
    FoundWeatherView()
}
