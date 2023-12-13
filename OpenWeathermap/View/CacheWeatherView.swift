//
//  CacheWeatherView.swift
//  OpenWeathermap
//
//  Created by Владислав Склюев on 12.12.2023.
//

import SwiftUI

struct CacheWeatherView: View {
    @StateObject var viewModel = CacheWeatherViewModel()
    var body: some View {
        if viewModel.cacheWeather == nil {
            Text("Нет последней загруженной погоды")
        } else {
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack {
                        Text(ExtDate().convert3(unixTimestamp: viewModel.lastRequestTime))
                        Text(viewModel.cacheWeather!.timezone).font(.title2)
                        HStack {
                            Text("\(ExtString().convert(temp: viewModel.cacheWeather!.current.temp))°").font(.system(size: 80, weight: .thin))
                            Image(viewModel.cacheWeather!.current.weather[0].icon)
                        }

                        Text(viewModel.cacheWeather!.current.weather[0].description)
                        //Text("Макс.: \(String(format: "%.f", viewModel.currentWeatherData.main.tempMax))°, мин.: \(String(format: "%.f", viewModel.currentWeatherData.main.tempMin))°")
                    }
                    
                    VStack(alignment: .leading) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                VStack(spacing: 8) {
                                    Text("Сейчас")
                                    Image(viewModel.cacheWeather!.hourly[0].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: viewModel.cacheWeather!.hourly[0].temp))°")
                                }
                                VStack(spacing: 8) {
                                    Text(ExtDate().convert(unixTimestamp: viewModel.cacheWeather!.hourly[1].dt, dateFormat: "HH"))
                                    Image(viewModel.cacheWeather!.hourly[1].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: viewModel.cacheWeather!.hourly[1].temp))°")
                                }
                                VStack(spacing: 8) {
                                    Text(ExtDate().convert(unixTimestamp: viewModel.cacheWeather!.hourly[2].dt, dateFormat: "HH"))
                                    Image(viewModel.cacheWeather!.hourly[2].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: viewModel.cacheWeather!.hourly[2].temp))°")
                                }
                                VStack(spacing: 8) {
                                    Text(ExtDate().convert(unixTimestamp: viewModel.cacheWeather!.hourly[3].dt, dateFormat: "HH"))
                                    Image(viewModel.cacheWeather!.hourly[3].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: viewModel.cacheWeather!.hourly[3].temp))°")
                                }
                                VStack(spacing: 8) {
                                    Text(ExtDate().convert(unixTimestamp: viewModel.cacheWeather!.hourly[4].dt, dateFormat: "HH"))
                                    Image(viewModel.cacheWeather!.hourly[4].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: viewModel.cacheWeather!.hourly[4].temp))°")
                                }
                                VStack(spacing: 8) {
                                    Text(ExtDate().convert(unixTimestamp: viewModel.cacheWeather!.hourly[5].dt, dateFormat: "HH"))
                                    Image(viewModel.cacheWeather!.hourly[5].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: viewModel.cacheWeather!.hourly[5].temp))°")
                                }
                                VStack(spacing: 8) {
                                    Text(ExtDate().convert(unixTimestamp: viewModel.cacheWeather!.hourly[6].dt, dateFormat: "HH"))
                                    Image(viewModel.cacheWeather!.hourly[6].weather[0].icon).resizable().frame(width: 40, height: 40)
                                    Text("\(ExtString().convert(temp: viewModel.cacheWeather!.hourly[6].temp))°")
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
                                Image(viewModel.cacheWeather!.daily[0].weather[0].icon).resizable().frame(width: 40, height: 40)
                                Text("\(ExtString().convert(temp: viewModel.cacheWeather!.daily[0].temp.min))°")
                                Spacer()
                                Text("\(ExtString().convert(temp: viewModel.cacheWeather!.daily[0].temp.max))°")
                            }
                            Divider().background(.white)
                            HStack {
                                Text(String(ExtDate().convert(unixTimestamp: viewModel.cacheWeather!.daily[1].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                Image(viewModel.cacheWeather!.daily[1].weather[0].icon).resizable().frame(width: 40, height: 40)
                                Text("\(ExtString().convert(temp: viewModel.cacheWeather!.daily[1].temp.min))°")
                                Spacer()
                                Text("\(ExtString().convert(temp: viewModel.cacheWeather!.daily[1].temp.max))°")
                            }
                            Divider().background(.white)
                            HStack {
                                Text(String(ExtDate().convert(unixTimestamp: viewModel.cacheWeather!.daily[2].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                Image(viewModel.cacheWeather!.daily[2].weather[0].icon).resizable().frame(width: 40, height: 40)
                                Text("\(ExtString().convert(temp: viewModel.cacheWeather!.daily[2].temp.min))°")
                                Spacer()
                                Text("\(ExtString().convert(temp: viewModel.cacheWeather!.daily[2].temp.max))°")
                            }
                            Divider().background(.white)
                            HStack {
                                Text(String(ExtDate().convert(unixTimestamp: viewModel.cacheWeather!.daily[3].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                Image(viewModel.cacheWeather!.daily[3].weather[0].icon).resizable().frame(width: 40, height: 40)
                                Text("\(ExtString().convert(temp: viewModel.cacheWeather!.daily[3].temp.min))°")
                                Spacer()
                                Text("\(ExtString().convert(temp: viewModel.cacheWeather!.daily[3].temp.max))°")
                            }
                            Divider().background(.white)
                            HStack {
                                Text(String(ExtDate().convert(unixTimestamp: viewModel.cacheWeather!.daily[4].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                Image(viewModel.cacheWeather!.daily[4].weather[0].icon).resizable().frame(width: 40, height: 40)
                                Text("\(ExtString().convert(temp: viewModel.cacheWeather!.daily[4].temp.min))°")
                                Spacer()
                                Text("\(ExtString().convert(temp: viewModel.cacheWeather!.daily[4].temp.max))°")
                            }
                            Divider().background(.white)
                            HStack {
                                Text(String(ExtDate().convert(unixTimestamp: viewModel.cacheWeather!.daily[5].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                Image(viewModel.cacheWeather!.daily[5].weather[0].icon).resizable().frame(width: 40, height: 40)
                                Text("\(ExtString().convert(temp: viewModel.cacheWeather!.daily[5].temp.min))°")
                                Spacer()
                                Text("\(ExtString().convert(temp: viewModel.cacheWeather!.daily[5].temp.max))°")
                            }
                            Divider().background(.white)
                            HStack {
                                Text(String(ExtDate().convert(unixTimestamp: viewModel.cacheWeather!.daily[6].dt, dateFormat: "dd"))).padding(.trailing, 48)
                                Image(viewModel.cacheWeather!.daily[6].weather[0].icon).resizable().frame(width: 40, height: 40)
                                Text("\(ExtString().convert(temp: viewModel.cacheWeather!.daily[6].temp.min))°")
                                Spacer()
                                Text("\(ExtString().convert(temp: viewModel.cacheWeather!.daily[6].temp.max))°")
                            }
                        }.padding(.horizontal).padding(.bottom)
                    }.background(.ultraThinMaterial).cornerRadius(12)
                }.padding().padding(.vertical, 40)
                
            }.background(Image("stars").resizable().aspectRatio(contentMode: .fill)).ignoresSafeArea()
        }
    }
}

#Preview {
    CacheWeatherView()
}
