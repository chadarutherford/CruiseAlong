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

let instructionData = """
{
  "routeOffsetInMeters": 439,
  "travelTimeInSeconds": 58,
  "point": {
    "latitude": 40.39842,
    "longitude": -80.59868
  },
  "instructionType": "TURN",
  "street": "Marland Heights Rd",
  "countryCode": "USA",
  "stateCode": "WV",
  "junctionType": "REGULAR",
  "turnAngleInDecimalDegrees": -90,
  "possibleCombineWithNext": true,
  "drivingSide": "RIGHT",
  "maneuver": "TURN_LEFT",
  "message": "Turn left onto Marland Heights Rd",
  "combinedMessage": "Turn left onto Marland Heights Rd then bear left at Marland Heights Rd"
}
""".data(using: .utf8)!

let routeData = """
{
  "formatVersion": "0.0.12",
  "routes": [
    {
      "summary": {
        "lengthInMeters": 2307,
        "travelTimeInSeconds": 329,
        "trafficDelayInSeconds": 0,
        "departureTime": "2020-03-06T07:48:06-05:00",
        "arrivalTime": "2020-03-06T07:53:34-05:00"
      },
      "legs": [
        {
          "summary": {
            "lengthInMeters": 2307,
            "travelTimeInSeconds": 329,
            "trafficDelayInSeconds": 0,
            "departureTime": "2020-03-06T07:48:06-05:00",
            "arrivalTime": "2020-03-06T07:53:34-05:00"
          },
          "points": [
            {
              "latitude": 40.40001,
              "longitude": -80.60342
            },
            {
              "latitude": 40.39987,
              "longitude": -80.60299
            },
            {
              "latitude": 40.39971,
              "longitude": -80.60251
            },
            {
              "latitude": 40.39954,
              "longitude": -80.60201
            },
            {
              "latitude": 40.39939,
              "longitude": -80.60156
            },
            {
              "latitude": 40.39923,
              "longitude": -80.60107
            },
            {
              "latitude": 40.39905,
              "longitude": -80.60056
            },
            {
              "latitude": 40.39889,
              "longitude": -80.60008
            },
            {
              "latitude": 40.39871,
              "longitude": -80.59957
            },
            {
              "latitude": 40.39856,
              "longitude": -80.59911
            },
            {
              "latitude": 40.39842,
              "longitude": -80.59868
            },
            {
              "latitude": 40.39864,
              "longitude": -80.59856
            },
            {
              "latitude": 40.39932,
              "longitude": -80.59846
            },
            {
              "latitude": 40.40028,
              "longitude": -80.59825
            },
            {
              "latitude": 40.40041,
              "longitude": -80.59818
            },
            {
              "latitude": 40.40043,
              "longitude": -80.59818
            },
            {
              "latitude": 40.40050,
              "longitude": -80.59813
            },
            {
              "latitude": 40.40062,
              "longitude": -80.59801
            },
            {
              "latitude": 40.40073,
              "longitude": -80.59784
            },
            {
              "latitude": 40.40079,
              "longitude": -80.59772
            },
            {
              "latitude": 40.40083,
              "longitude": -80.59758
            },
            {
              "latitude": 40.40087,
              "longitude": -80.59743
            },
            {
              "latitude": 40.40088,
              "longitude": -80.59727
            },
            {
              "latitude": 40.40086,
              "longitude": -80.59711
            },
            {
              "latitude": 40.40082,
              "longitude": -80.59694
            },
            {
              "latitude": 40.40048,
              "longitude": -80.59570
            },
            {
              "latitude": 40.40043,
              "longitude": -80.59554
            },
            {
              "latitude": 40.40023,
              "longitude": -80.59481
            },
            {
              "latitude": 40.40022,
              "longitude": -80.59451
            },
            {
              "latitude": 40.40019,
              "longitude": -80.59413
            },
            {
              "latitude": 40.40017,
              "longitude": -80.59356
            },
            {
              "latitude": 40.40015,
              "longitude": -80.59317
            },
            {
              "latitude": 40.40011,
              "longitude": -80.59265
            },
            {
              "latitude": 40.40011,
              "longitude": -80.59259
            },
            {
              "latitude": 40.39997,
              "longitude": -80.59226
            },
            {
              "latitude": 40.39993,
              "longitude": -80.59217
            },
            {
              "latitude": 40.39979,
              "longitude": -80.59185
            },
            {
              "latitude": 40.39975,
              "longitude": -80.59177
            },
            {
              "latitude": 40.39957,
              "longitude": -80.59137
            },
            {
              "latitude": 40.39954,
              "longitude": -80.59130
            },
            {
              "latitude": 40.39934,
              "longitude": -80.59081
            },
            {
              "latitude": 40.39883,
              "longitude": -80.59119
            },
            {
              "latitude": 40.39846,
              "longitude": -80.59148
            },
            {
              "latitude": 40.39823,
              "longitude": -80.59164
            },
            {
              "latitude": 40.39808,
              "longitude": -80.59174
            },
            {
              "latitude": 40.39791,
              "longitude": -80.59180
            },
            {
              "latitude": 40.39771,
              "longitude": -80.59183
            },
            {
              "latitude": 40.39759,
              "longitude": -80.59183
            },
            {
              "latitude": 40.39720,
              "longitude": -80.59179
            },
            {
              "latitude": 40.39714,
              "longitude": -80.59178
            },
            {
              "latitude": 40.39701,
              "longitude": -80.59177
            },
            {
              "latitude": 40.39666,
              "longitude": -80.59175
            },
            {
              "latitude": 40.39648,
              "longitude": -80.59176
            },
            {
              "latitude": 40.39645,
              "longitude": -80.59177
            },
            {
              "latitude": 40.39641,
              "longitude": -80.59178
            },
            {
              "latitude": 40.39632,
              "longitude": -80.59180
            },
            {
              "latitude": 40.39604,
              "longitude": -80.59187
            },
            {
              "latitude": 40.39594,
              "longitude": -80.59189
            },
            {
              "latitude": 40.39566,
              "longitude": -80.59196
            },
            {
              "latitude": 40.39555,
              "longitude": -80.59199
            },
            {
              "latitude": 40.39517,
              "longitude": -80.59210
            },
            {
              "latitude": 40.39387,
              "longitude": -80.59240
            },
            {
              "latitude": 40.39371,
              "longitude": -80.59247
            },
            {
              "latitude": 40.39352,
              "longitude": -80.59260
            },
            {
              "latitude": 40.39220,
              "longitude": -80.59358
            },
            {
              "latitude": 40.39181,
              "longitude": -80.59386
            },
            {
              "latitude": 40.39196,
              "longitude": -80.59416
            },
            {
              "latitude": 40.39205,
              "longitude": -80.59435
            },
            {
              "latitude": 40.39213,
              "longitude": -80.59451
            }
          ]
        }
      ],
      "sections": [
        {
          "startPointIndex": 0,
          "endPointIndex": 68,
          "sectionType": "TRAVEL_MODE",
          "travelMode": "car"
        }
      ],
      "guidance": {
        "instructions": [
          {
            "routeOffsetInMeters": 0,
            "travelTimeInSeconds": 0,
            "point": {
              "latitude": 40.40001,
              "longitude": -80.60342
            },
            "instructionType": "LOCATION_DEPARTURE",
            "street": "Rothrock Ave",
            "countryCode": "USA",
            "stateCode": "WV",
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "DEPART",
            "message": "Leave from Rothrock Ave"
          },
          {
            "routeOffsetInMeters": 439,
            "travelTimeInSeconds": 58,
            "point": {
              "latitude": 40.39842,
              "longitude": -80.59868
            },
            "instructionType": "TURN",
            "street": "Marland Heights Rd",
            "countryCode": "USA",
            "stateCode": "WV",
            "junctionType": "REGULAR",
            "turnAngleInDecimalDegrees": -90,
            "possibleCombineWithNext": true,
            "drivingSide": "RIGHT",
            "maneuver": "TURN_LEFT",
            "message": "Turn left onto Marland Heights Rd",
            "combinedMessage": "Turn left onto Marland Heights Rd then bear left at Marland Heights Rd"
          },
          {
            "routeOffsetInMeters": 466,
            "travelTimeInSeconds": 74,
            "point": {
              "latitude": 40.39864,
              "longitude": -80.59856
            },
            "instructionType": "TURN",
            "street": "Marland Heights Rd",
            "countryCode": "USA",
            "stateCode": "WV",
            "junctionType": "REGULAR",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "BEAR_LEFT",
            "message": "Bear left at Marland Heights Rd"
          },
          {
            "routeOffsetInMeters": 1347,
            "travelTimeInSeconds": 206,
            "point": {
              "latitude": 40.39934,
              "longitude": -80.59081
            },
            "instructionType": "TURN",
            "roadNumbers": [
              "WV-2"
            ],
            "street": "Main St",
            "countryCode": "USA",
            "stateCode": "WV",
            "junctionType": "REGULAR",
            "turnAngleInDecimalDegrees": 90,
            "possibleCombineWithNext": true,
            "drivingSide": "RIGHT",
            "maneuver": "TURN_RIGHT",
            "message": "Turn right onto Main St/WV-2",
            "combinedMessage": "Turn right onto Main St/WV-2 then turn right onto Market St"
          },
          {
            "routeOffsetInMeters": 2242,
            "travelTimeInSeconds": 287,
            "point": {
              "latitude": 40.39181,
              "longitude": -80.59386
            },
            "instructionType": "TURN",
            "street": "Market St",
            "countryCode": "USA",
            "stateCode": "WV",
            "junctionType": "REGULAR",
            "turnAngleInDecimalDegrees": 90,
            "possibleCombineWithNext": true,
            "drivingSide": "RIGHT",
            "maneuver": "TURN_RIGHT",
            "message": "Turn right onto Market St",
            "combinedMessage": "Turn right onto Market St then you have arrived at Market St. Your destination is on the right"
          },
          {
            "routeOffsetInMeters": 2307,
            "travelTimeInSeconds": 329,
            "point": {
              "latitude": 40.39213,
              "longitude": -80.59451
            },
            "instructionType": "LOCATION_ARRIVAL",
            "street": "Market St",
            "countryCode": "USA",
            "stateCode": "WV",
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "ARRIVE_RIGHT",
            "message": "You have arrived at Market St. Your destination is on the right"
          }
        ],
        "instructionGroups": [
          {
            "firstInstructionIndex": 0,
            "lastInstructionIndex": 2,
            "groupMessage": "Leave from Rothrock Ave. Take the Marland Heights Rd",
            "groupLengthInMeters": 1347
          },
          {
            "firstInstructionIndex": 3,
            "lastInstructionIndex": 5,
            "groupMessage": "Take the Main St/WV-2. Continue to your destination at Market St",
            "groupLengthInMeters": 960
          }
        ]
      }
    }
  ]
}
""".data(using: .utf8)!
