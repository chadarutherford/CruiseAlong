//
//  RouteJSON.swift
//  Cruise AlongTests
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import Foundation

let pointData = """
{
  "latitude": 40.40010,
  "longitude": -80.60370
}
""".data(using: .utf8)!

let routeData = """
{
  "formatVersion": "0.0.12",
  "routes": [
    {
      "summary": {
        "lengthInMeters": 2322,
        "travelTimeInSeconds": 300,
        "trafficDelayInSeconds": 0,
        "departureTime": "2020-03-02T20:04:50-05:00",
        "arrivalTime": "2020-03-02T20:09:49-05:00"
      },
      "legs": [
        {
          "summary": {
            "lengthInMeters": 2322,
            "travelTimeInSeconds": 300,
            "trafficDelayInSeconds": 0,
            "departureTime": "2020-03-02T20:04:50-05:00",
            "arrivalTime": "2020-03-02T20:09:49-05:00"
          },
          "points": [
            {
              "latitude": 40.39213,
              "longitude": -80.59451
            },
            {
              "latitude": 40.39205,
              "longitude": -80.59435
            },
            {
              "latitude": 40.39196,
              "longitude": -80.59416
            },
            {
              "latitude": 40.39181,
              "longitude": -80.59386
            },
            {
              "latitude": 40.39220,
              "longitude": -80.59358
            },
            {
              "latitude": 40.39352,
              "longitude": -80.59260
            },
            {
              "latitude": 40.39371,
              "longitude": -80.59247
            },
            {
              "latitude": 40.39387,
              "longitude": -80.59240
            },
            {
              "latitude": 40.39517,
              "longitude": -80.59210
            },
            {
              "latitude": 40.39555,
              "longitude": -80.59199
            },
            {
              "latitude": 40.39566,
              "longitude": -80.59196
            },
            {
              "latitude": 40.39594,
              "longitude": -80.59189
            },
            {
              "latitude": 40.39604,
              "longitude": -80.59187
            },
            {
              "latitude": 40.39632,
              "longitude": -80.59180
            },
            {
              "latitude": 40.39641,
              "longitude": -80.59178
            },
            {
              "latitude": 40.39645,
              "longitude": -80.59177
            },
            {
              "latitude": 40.39648,
              "longitude": -80.59176
            },
            {
              "latitude": 40.39666,
              "longitude": -80.59175
            },
            {
              "latitude": 40.39701,
              "longitude": -80.59177
            },
            {
              "latitude": 40.39714,
              "longitude": -80.59178
            },
            {
              "latitude": 40.39720,
              "longitude": -80.59179
            },
            {
              "latitude": 40.39759,
              "longitude": -80.59183
            },
            {
              "latitude": 40.39771,
              "longitude": -80.59183
            },
            {
              "latitude": 40.39791,
              "longitude": -80.59180
            },
            {
              "latitude": 40.39808,
              "longitude": -80.59174
            },
            {
              "latitude": 40.39823,
              "longitude": -80.59164
            },
            {
              "latitude": 40.39846,
              "longitude": -80.59148
            },
            {
              "latitude": 40.39883,
              "longitude": -80.59119
            },
            {
              "latitude": 40.39934,
              "longitude": -80.59081
            },
            {
              "latitude": 40.39954,
              "longitude": -80.59130
            },
            {
              "latitude": 40.39957,
              "longitude": -80.59137
            },
            {
              "latitude": 40.39975,
              "longitude": -80.59177
            },
            {
              "latitude": 40.39979,
              "longitude": -80.59185
            },
            {
              "latitude": 40.39993,
              "longitude": -80.59217
            },
            {
              "latitude": 40.39997,
              "longitude": -80.59226
            },
            {
              "latitude": 40.40011,
              "longitude": -80.59259
            },
            {
              "latitude": 40.40011,
              "longitude": -80.59265
            },
            {
              "latitude": 40.40015,
              "longitude": -80.59317
            },
            {
              "latitude": 40.40017,
              "longitude": -80.59356
            },
            {
              "latitude": 40.40019,
              "longitude": -80.59413
            },
            {
              "latitude": 40.40022,
              "longitude": -80.59451
            },
            {
              "latitude": 40.40023,
              "longitude": -80.59481
            },
            {
              "latitude": 40.40043,
              "longitude": -80.59554
            },
            {
              "latitude": 40.40048,
              "longitude": -80.59570
            },
            {
              "latitude": 40.40082,
              "longitude": -80.59694
            },
            {
              "latitude": 40.40086,
              "longitude": -80.59711
            },
            {
              "latitude": 40.40088,
              "longitude": -80.59727
            },
            {
              "latitude": 40.40087,
              "longitude": -80.59743
            },
            {
              "latitude": 40.40083,
              "longitude": -80.59758
            },
            {
              "latitude": 40.40079,
              "longitude": -80.59772
            },
            {
              "latitude": 40.40073,
              "longitude": -80.59784
            },
            {
              "latitude": 40.40062,
              "longitude": -80.59801
            },
            {
              "latitude": 40.40050,
              "longitude": -80.59813
            },
            {
              "latitude": 40.40043,
              "longitude": -80.59818
            },
            {
              "latitude": 40.40041,
              "longitude": -80.59818
            },
            {
              "latitude": 40.40028,
              "longitude": -80.59825
            },
            {
              "latitude": 40.39932,
              "longitude": -80.59846
            },
            {
              "latitude": 40.39864,
              "longitude": -80.59856
            },
            {
              "latitude": 40.39842,
              "longitude": -80.59868
            },
            {
              "latitude": 40.39856,
              "longitude": -80.59911
            },
            {
              "latitude": 40.39871,
              "longitude": -80.59957
            },
            {
              "latitude": 40.39889,
              "longitude": -80.60008
            },
            {
              "latitude": 40.39905,
              "longitude": -80.60056
            },
            {
              "latitude": 40.39923,
              "longitude": -80.60107
            },
            {
              "latitude": 40.39939,
              "longitude": -80.60156
            },
            {
              "latitude": 40.39954,
              "longitude": -80.60201
            },
            {
              "latitude": 40.39971,
              "longitude": -80.60251
            },
            {
              "latitude": 40.39987,
              "longitude": -80.60299
            },
            {
              "latitude": 40.40003,
              "longitude": -80.60349
            },
            {
              "latitude": 40.39996,
              "longitude": -80.60353
            }
          ]
        }
      ],
      "sections": [
        {
          "startPointIndex": 0,
          "endPointIndex": 69,
          "sectionType": "TRAVEL_MODE",
          "travelMode": "car"
        }
      ]
    }
  ]
}
""".data(using: .utf8)!
