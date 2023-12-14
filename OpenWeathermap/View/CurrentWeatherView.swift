//
//  ContentView.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 07.12.2023.
//

import SwiftUI
import UIKit

struct CurrentWeatherView: View {
    @StateObject var viewModel = CurrentWeatherViewModel()
    var body: some View {
        if viewModel.currentWeather == nil {
            ProgressView("Определяем ваше местоположение для получения прогноза").multilineTextAlignment(.center)
        } else {
                ScrollView(showsIndicators: false) {
                    VStack {
                        VStack {
                            Text("Текущее место").font(.custom("SFUIText-Regular", size: 35))
                            Text(viewModel.currentWeather!.timezone).font(.custom("SFUIText-Medium", size: 20)).bold()
                                Text("\(ExtString().convert(temp: viewModel.currentWeather!.current.temp))°\(Locale.current.identifier == "ru_RU" ? "C" : "F")").font(.custom("SFUIText-Light", size: 90))
                                //Image(viewModel.currentWeather!.current.weather[0].icon).resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80)
                            
                            Text(viewModel.currentWeather!.current.weather[0].description).font(.custom("SFProText-Medium", size: 20))
                            Text("Макс.: \(String(format: "%.f", viewModel.currentWeather!.daily[0].temp.max))°, мин.: \(String(format: "%.f", viewModel.currentWeather!.daily[0].temp.min))°").font(.custom("SFProText-Medium", size: 20))
                            Spacer()

                        }.frame(height: 270)
                        
                        VStack(alignment: .leading) {
//                            HStack {
//                                Text("Ожидается дымка около 19:00").padding(.top).padding(.leading).foregroundStyle(.white)
//                            }
//                            Divider().background(.white)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    VStack(spacing: 8) {
                                        Text("Сейчас")
                                        Image(viewModel.currentWeather!.hourly[0].weather[0].icon).resizable().frame(width: 40, height: 40)
                                        Text("\(ExtString().convert(temp: viewModel.currentWeather!.hourly[0].temp))°")
                                    }
                                    VStack(spacing: 8) {
                                        Text(ExtDate().convert(unixTimestamp: viewModel.currentWeather!.hourly[1].dt, dateFormat: "HH"))
                                        Image(viewModel.currentWeather!.hourly[1].weather[0].icon).resizable().frame(width: 40, height: 40)
                                        Text("\(ExtString().convert(temp: viewModel.currentWeather!.hourly[1].temp))°")
                                    }
                                    VStack(spacing: 8) {
                                        Text(ExtDate().convert(unixTimestamp: viewModel.currentWeather!.hourly[2].dt, dateFormat: "HH"))
                                        Image(viewModel.currentWeather!.hourly[2].weather[0].icon).resizable().frame(width: 40, height: 40)
                                        Text("\(ExtString().convert(temp: viewModel.currentWeather!.hourly[2].temp))°")
                                    }
                                    VStack(spacing: 8) {
                                        Text(ExtDate().convert(unixTimestamp: viewModel.currentWeather!.hourly[3].dt, dateFormat: "HH"))
                                        Image(viewModel.currentWeather!.hourly[3].weather[0].icon).resizable().frame(width: 40, height: 40)
                                        Text("\(ExtString().convert(temp: viewModel.currentWeather!.hourly[3].temp))°")
                                    }
                                    VStack(spacing: 8) {
                                        Text(ExtDate().convert(unixTimestamp: viewModel.currentWeather!.hourly[4].dt, dateFormat: "HH"))
                                        Image(viewModel.currentWeather!.hourly[4].weather[0].icon).resizable().frame(width: 40, height: 40)
                                        Text("\(ExtString().convert(temp: viewModel.currentWeather!.hourly[4].temp))°")
                                    }
                                    VStack(spacing: 8) {
                                        Text(ExtDate().convert(unixTimestamp: viewModel.currentWeather!.hourly[5].dt, dateFormat: "HH"))
                                        Image(viewModel.currentWeather!.hourly[5].weather[0].icon).resizable().frame(width: 40, height: 40)
                                        Text("\(ExtString().convert(temp: viewModel.currentWeather!.hourly[5].temp))°")
                                    }
                                    VStack(spacing: 8) {
                                        Text(ExtDate().convert(unixTimestamp: viewModel.currentWeather!.hourly[6].dt, dateFormat: "HH"))
                                        Image(viewModel.currentWeather!.hourly[6].weather[0].icon).resizable().frame(width: 40, height: 40)
                                        Text("\(ExtString().convert(temp: viewModel.currentWeather!.hourly[6].temp))°")
                                    }
                                }.padding().foregroundStyle(.white)
                            }
                        }.background(.ultraThinMaterial).cornerRadius(12)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                
                                Text("ПРОГНОЗ НА 7 ДНЕЙ").padding(.top).padding(.leading, 38).foregroundStyle(.white).overlay(alignment: .leading) {
                                    Image(systemName: "calendar").resizable().frame(width: 15, height: 15, alignment: .center).padding().padding(.top)
                                }
                            }
                            VStack {
                                Divider().background(.white)
                                HStack {
                                    Text("Сегодня")
                                    Image(viewModel.currentWeather!.daily[0].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: viewModel.currentWeather!.daily[0].temp.min))°")
                                    Spacer()
                                    Text("\(ExtString().convert(temp: viewModel.currentWeather!.daily[0].temp.max))°")
                                }
                                Divider().background(.white)
                                HStack {
                                    Text(String(ExtDate().convert(unixTimestamp: viewModel.currentWeather!.daily[1].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                    Image(viewModel.currentWeather!.daily[1].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: viewModel.currentWeather!.daily[1].temp.min))°")
                                    Spacer()
                                    Text("\(ExtString().convert(temp: viewModel.currentWeather!.daily[1].temp.max))°")
                                }
                                Divider().background(.white)
                                HStack {
                                    Text(String(ExtDate().convert(unixTimestamp: viewModel.currentWeather!.daily[2].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                    Image(viewModel.currentWeather!.daily[2].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: viewModel.currentWeather!.daily[2].temp.min))°")
                                    Spacer()
                                    Text("\(ExtString().convert(temp: viewModel.currentWeather!.daily[2].temp.max))°")
                                }
                                Divider().background(.white)
                                HStack {
                                    Text(String(ExtDate().convert(unixTimestamp: viewModel.currentWeather!.daily[3].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                    Image(viewModel.currentWeather!.daily[3].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: viewModel.currentWeather!.daily[3].temp.min))°")
                                    Spacer()
                                    Text("\(ExtString().convert(temp: viewModel.currentWeather!.daily[3].temp.max))°")
                                }
                                Divider().background(.white)
                                HStack {
                                    Text(String(ExtDate().convert(unixTimestamp: viewModel.currentWeather!.daily[4].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                    Image(viewModel.currentWeather!.daily[4].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: viewModel.currentWeather!.daily[4].temp.min))°")
                                    Spacer()
                                    Text("\(ExtString().convert(temp: viewModel.currentWeather!.daily[4].temp.max))°")
                                }
                                Divider().background(.white)
                                HStack {
                                    Text(String(ExtDate().convert(unixTimestamp: viewModel.currentWeather!.daily[5].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                    Image(viewModel.currentWeather!.daily[5].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: viewModel.currentWeather!.daily[5].temp.min))°")
                                    Spacer()
                                    Text("\(ExtString().convert(temp: viewModel.currentWeather!.daily[5].temp.max))°")
                                }
                                Divider().background(.white)
                                HStack {
                                    Text(String(ExtDate().convert(unixTimestamp: viewModel.currentWeather!.daily[6].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                    Image(viewModel.currentWeather!.daily[6].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: viewModel.currentWeather!.daily[6].temp.min))°")
                                    Spacer()
                                    Text("\(ExtString().convert(temp: viewModel.currentWeather!.daily[6].temp.max))°")
                                }
                            }.padding(.horizontal).padding(.bottom)
                        }.background(.ultraThinMaterial).cornerRadius(12).padding(.top, 8)
                    }.padding().padding(.vertical, 20)

                }//.background(Image("stars").resizable().aspectRatio(contentMode: .fill)).ignoresSafeArea()
                .background(.gray)
        }
    }
}

#Preview {
    CurrentWeatherView()
}
