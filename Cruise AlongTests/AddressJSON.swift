//
//  AddressJSON.swift
//  Cruise AlongTests
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import Foundation

let singleAddressData = """
{
  "type": "POI",
  "id": "US/POI/p0/7799727",
  "score": 5.476039886474609,
  "dist": 1145.0453667693146,
  "info": "search:ta:840549000595048-US",
  "poi": {
    "name": "Papa John's",
    "phone": "+(1)-(304)-7977272",
    "brands": [
      {
        "name": "Papa John's"
      }
    ],
    "categorySet": [
      {
        "id": 7315036
      }
    ],
    "categories": [
      "pizza",
      "restaurant"
    ],
    "classifications": [
      {
        "code": "RESTAURANT",
        "names": [
          {
            "nameLocale": "en-US",
            "name": "restaurant"
          },
          {
            "nameLocale": "en-US",
            "name": "pizza"
          }
        ]
      }
    ]
  },
  "address": {
    "streetNumber": "4052",
    "streetName": "Washington St",
    "municipality": "Weirton",
    "countrySecondarySubdivision": "Brooke",
    "countryTertiarySubdivision": "Weirton",
    "countrySubdivision": "WV",
    "countrySubdivisionName": "West Virginia",
    "postalCode": "26062",
    "extendedPostalCode": "260625383",
    "countryCode": "US",
    "country": "United States",
    "countryCodeISO3": "USA",
    "freeformAddress": "4052 Washington St, Weirton, WV 26062",
    "localName": "Weirton"
  },
  "position": {
    "lat": 40.39222,
    "lon": -80.5944
  },
  "viewport": {
    "topLeftPoint": {
      "lat": 40.39312,
      "lon": -80.59558
    },
    "btmRightPoint": {
      "lat": 40.39132,
      "lon": -80.59322
    }
  },
  "entryPoints": [
    {
      "type": "main",
      "position": {
        "lat": 40.39237,
        "lon": -80.59462
      }
    }
  ]
}
""".data(using: .utf8)!


let resultsData = """
{
  "summary": {
    "query": "papa johns",
    "queryType": "NON_NEAR",
    "queryTime": 63,
    "numResults": 10,
    "offset": 0,
    "totalResults": 5525,
    "fuzzyLevel": 1,
    "geoBias": {
      "lat": 40.4000244,
      "lon": -80.6032212
    }
  },
  "results": [
    {
      "type": "POI",
      "id": "US/POI/p0/7799727",
      "score": 5.476039886474609,
      "dist": 1145.0453667693146,
      "info": "search:ta:840549000595048-US",
      "poi": {
        "name": "Papa John's",
        "phone": "+(1)-(304)-7977272",
        "brands": [
          {
            "name": "Papa John's"
          }
        ],
        "categorySet": [
          {
            "id": 7315036
          }
        ],
        "categories": [
          "pizza",
          "restaurant"
        ],
        "classifications": [
          {
            "code": "RESTAURANT",
            "names": [
              {
                "nameLocale": "en-US",
                "name": "restaurant"
              },
              {
                "nameLocale": "en-US",
                "name": "pizza"
              }
            ]
          }
        ]
      },
      "address": {
        "streetNumber": "4052",
        "streetName": "Washington St",
        "municipality": "Weirton",
        "countrySecondarySubdivision": "Brooke",
        "countryTertiarySubdivision": "Weirton",
        "countrySubdivision": "WV",
        "countrySubdivisionName": "West Virginia",
        "postalCode": "26062",
        "extendedPostalCode": "260625383",
        "countryCode": "US",
        "country": "United States",
        "countryCodeISO3": "USA",
        "freeformAddress": "4052 Washington St, Weirton, WV 26062",
        "localName": "Weirton"
      },
      "position": {
        "lat": 40.39222,
        "lon": -80.5944
      },
      "viewport": {
        "topLeftPoint": {
          "lat": 40.39312,
          "lon": -80.59558
        },
        "btmRightPoint": {
          "lat": 40.39132,
          "lon": -80.59322
        }
      },
      "entryPoints": [
        {
          "type": "main",
          "position": {
            "lat": 40.39237,
            "lon": -80.59462
          }
        }
      ]
    },
    {
      "type": "POI",
      "id": "US/POI/p1/6747763",
      "score": 5.461939811706543,
      "dist": 4692.789422154857,
      "info": "search:ta:840399003276471-US",
      "poi": {
        "name": "Papa John's",
        "phone": "+(1)-(740)-3460831",
        "brands": [
          {
            "name": "Papa John's"
          }
        ],
        "categorySet": [
          {
            "id": 7315036
          }
        ],
        "url": "www.papajohns.com",
        "categories": [
          "pizza",
          "restaurant"
        ],
        "classifications": [
          {
            "code": "RESTAURANT",
            "names": [
              {
                "nameLocale": "en-US",
                "name": "restaurant"
              },
              {
                "nameLocale": "en-US",
                "name": "pizza"
              }
            ]
          }
        ]
      },
      "address": {
        "streetNumber": "2203",
        "streetName": "Sunset Blvd",
        "municipality": "Steubenville",
        "countrySecondarySubdivision": "Jefferson",
        "countryTertiarySubdivision": "Steubenville City",
        "countrySubdivision": "OH",
        "countrySubdivisionName": "Ohio",
        "postalCode": "43952",
        "extendedPostalCode": "439522442",
        "countryCode": "US",
        "country": "United States",
        "countryCodeISO3": "USA",
        "freeformAddress": "2203 Sunset Blvd, Steubenville, OH 43952",
        "localName": "Steubenville"
      },
      "position": {
        "lat": 40.36897,
        "lon": -80.64074
      },
      "viewport": {
        "topLeftPoint": {
          "lat": 40.36987,
          "lon": -80.64192
        },
        "btmRightPoint": {
          "lat": 40.36807,
          "lon": -80.63956
        }
      },
      "entryPoints": [
        {
          "type": "main",
          "position": {
            "lat": 40.36927,
            "lon": -80.6407
          }
        }
      ]
    },
    {
      "type": "POI",
      "id": "US/POI/p1/6747914",
      "score": 5.0545501708984375,
      "dist": 28732.302553908838,
      "info": "search:ta:840399003234587-US",
      "poi": {
        "name": "Papa John's",
        "phone": "+(1)-(330)-3863873",
        "brands": [
          {
            "name": "Papa John's"
          }
        ],
        "categorySet": [
          {
            "id": 7315036
          }
        ],
        "categories": [
          "pizza",
          "restaurant"
        ],
        "classifications": [
          {
            "code": "RESTAURANT",
            "names": [
              {
                "nameLocale": "en-US",
                "name": "restaurant"
              },
              {
                "nameLocale": "en-US",
                "name": "pizza"
              }
            ]
          }
        ]
      },
      "address": {
        "streetNumber": "16761",
        "streetName": "Saint Clair Ave",
        "municipality": "East Liverpool",
        "countrySecondarySubdivision": "Columbiana",
        "countryTertiarySubdivision": "Saint Clair",
        "countrySubdivision": "OH",
        "countrySubdivisionName": "Ohio",
        "postalCode": "43920",
        "extendedPostalCode": "439209139",
        "countryCode": "US",
        "country": "United States",
        "countryCodeISO3": "USA",
        "freeformAddress": "16761 Saint Clair Ave, East Liverpool, OH 43920",
        "localName": "East Liverpool"
      },
      "position": {
        "lat": 40.65755,
        "lon": -80.57535
      },
      "viewport": {
        "topLeftPoint": {
          "lat": 40.65845,
          "lon": -80.57654
        },
        "btmRightPoint": {
          "lat": 40.65665,
          "lon": -80.57416
        }
      },
      "entryPoints": [
        {
          "type": "main",
          "position": {
            "lat": 40.65756,
            "lon": -80.57419
          }
        }
      ]
    },
    {
      "type": "POI",
      "id": "US/POI/p1/3871054",
      "score": 4.917449951171875,
      "dist": 35513.69032271565,
      "info": "search:ta:840421000700803-US",
      "poi": {
        "name": "Papa John's",
        "phone": "+(1)-(724)-3783800",
        "brands": [
          {
            "name": "Papa John's"
          }
        ],
        "categorySet": [
          {
            "id": 7315036
          }
        ],
        "categories": [
          "pizza",
          "restaurant"
        ],
        "classifications": [
          {
            "code": "RESTAURANT",
            "names": [
              {
                "nameLocale": "en-US",
                "name": "restaurant"
              },
              {
                "nameLocale": "en-US",
                "name": "pizza"
              }
            ]
          }
        ]
      },
      "address": {
        "streetNumber": "2671",
        "streetName": "Brodhead Rd",
        "municipality": "Aliquippa",
        "countrySecondarySubdivision": "Beaver",
        "countryTertiarySubdivision": "Aliquippa",
        "countrySubdivision": "PA",
        "countrySubdivisionName": "Pennsylvania",
        "postalCode": "15001",
        "extendedPostalCode": "150012759",
        "countryCode": "US",
        "country": "United States",
        "countryCodeISO3": "USA",
        "freeformAddress": "2671 Brodhead Rd, Aliquippa, PA 15001",
        "localName": "Aliquippa"
      },
      "position": {
        "lat": 40.60553,
        "lon": -80.28169
      },
      "viewport": {
        "topLeftPoint": {
          "lat": 40.60643,
          "lon": -80.28287
        },
        "btmRightPoint": {
          "lat": 40.60463,
          "lon": -80.28051
        }
      },
      "entryPoints": [
        {
          "type": "main",
          "position": {
            "lat": 40.60564,
            "lon": -80.28147
          }
        }
      ]
    },
    {
      "type": "POI",
      "id": "US/POI/p0/7799674",
      "score": 4.897119998931885,
      "dist": 36605.48683477583,
      "info": "search:ta:840549000596624-US",
      "poi": {
        "name": "Papa John's",
        "phone": "+(1)-(304)-2327272",
        "brands": [
          {
            "name": "Papa John's"
          }
        ],
        "categorySet": [
          {
            "id": 7315036
          }
        ],
        "categories": [
          "pizza",
          "restaurant"
        ],
        "classifications": [
          {
            "code": "RESTAURANT",
            "names": [
              {
                "nameLocale": "en-US",
                "name": "restaurant"
              },
              {
                "nameLocale": "en-US",
                "name": "pizza"
              }
            ]
          }
        ]
      },
      "address": {
        "streetNumber": "949",
        "streetName": "National Rd",
        "municipality": "Wheeling",
        "countrySecondarySubdivision": "Ohio",
        "countryTertiarySubdivision": "District 2",
        "countrySubdivision": "WV",
        "countrySubdivisionName": "West Virginia",
        "postalCode": "26003",
        "countryCode": "US",
        "country": "United States",
        "countryCodeISO3": "USA",
        "freeformAddress": "949 National Rd, Wheeling, WV 26003",
        "localName": "Wheeling"
      },
      "position": {
        "lat": 40.07783,
        "lon": -80.69172
      },
      "viewport": {
        "topLeftPoint": {
          "lat": 40.07873,
          "lon": -80.6929
        },
        "btmRightPoint": {
          "lat": 40.07693,
          "lon": -80.69054
        }
      },
      "entryPoints": [
        {
          "type": "main",
          "position": {
            "lat": 40.07765,
            "lon": -80.69165
          }
        }
      ]
    },
    {
      "type": "POI",
      "id": "US/POI/p0/8220716",
      "score": 4.865739822387695,
      "dist": 38360.17021610452,
      "info": "search:ta:840391000640524-US",
      "poi": {
        "name": "Papa John's",
        "phone": "+(1)-(740)-6332525",
        "brands": [
          {
            "name": "Papa John's"
          }
        ],
        "categorySet": [
          {
            "id": 7315036
          }
        ],
        "categories": [
          "pizza",
          "restaurant"
        ],
        "classifications": [
          {
            "code": "RESTAURANT",
            "names": [
              {
                "nameLocale": "en-US",
                "name": "restaurant"
              },
              {
                "nameLocale": "en-US",
                "name": "pizza"
              }
            ]
          }
        ]
      },
      "address": {
        "streetNumber": "333",
        "streetName": "Main St",
        "municipality": "Bridgeport",
        "countrySecondarySubdivision": "Belmont",
        "countryTertiarySubdivision": "Pease",
        "countrySubdivision": "OH",
        "countrySubdivisionName": "Ohio",
        "postalCode": "43912",
        "extendedPostalCode": "439121353",
        "countryCode": "US",
        "country": "United States",
        "countryCodeISO3": "USA",
        "freeformAddress": "333 Main St, Bridgeport, OH 43912",
        "localName": "Bridgeport"
      },
      "position": {
        "lat": 40.07222,
        "lon": -80.74404
      },
      "viewport": {
        "topLeftPoint": {
          "lat": 40.07312,
          "lon": -80.74522
        },
        "btmRightPoint": {
          "lat": 40.07132,
          "lon": -80.74286
        }
      },
      "entryPoints": [
        {
          "type": "main",
          "position": {
            "lat": 40.07253,
            "lon": -80.74394
          }
        }
      ]
    },
    {
      "type": "POI",
      "id": "US/POI/p1/2469159",
      "score": 4.850289821624756,
      "dist": 39260.16731158395,
      "info": "search:ta:840429003799302-US",
      "poi": {
        "name": "Papa John's",
        "phone": "+(1)-(412)-4890858",
        "brands": [
          {
            "name": "Papa John's"
          }
        ],
        "categorySet": [
          {
            "id": 7315036
          }
        ],
        "categories": [
          "pizza",
          "restaurant"
        ],
        "classifications": [
          {
            "code": "RESTAURANT",
            "names": [
              {
                "nameLocale": "en-US",
                "name": "restaurant"
              },
              {
                "nameLocale": "en-US",
                "name": "pizza"
              }
            ]
          }
        ]
      },
      "address": {
        "streetNumber": "5984",
        "streetName": "Steubenville Pike Rd",
        "municipality": "McKees Rocks",
        "countrySecondarySubdivision": "Allegheny",
        "countryTertiarySubdivision": "Robinson",
        "countrySubdivision": "PA",
        "countrySubdivisionName": "Pennsylvania",
        "postalCode": "15136",
        "extendedPostalCode": "151361315",
        "countryCode": "US",
        "country": "United States",
        "countryCodeISO3": "USA",
        "freeformAddress": "5984 Steubenville Pike Rd, McKees Rocks, PA 15136",
        "localName": "McKees Rocks"
      },
      "position": {
        "lat": 40.44724,
        "lon": -80.14359
      },
      "viewport": {
        "topLeftPoint": {
          "lat": 40.44814,
          "lon": -80.14477
        },
        "btmRightPoint": {
          "lat": 40.44634,
          "lon": -80.14241
        }
      },
      "entryPoints": [
        {
          "type": "main",
          "position": {
            "lat": 40.44716,
            "lon": -80.14335
          }
        }
      ]
    },
    {
      "type": "POI",
      "id": "US/POI/p1/3871339",
      "score": 4.847010135650635,
      "dist": 39454.58028562637,
      "info": "search:ta:840421000700789-US",
      "poi": {
        "name": "Papa John's",
        "phone": "+(1)-(724)-7467272",
        "brands": [
          {
            "name": "Papa John's"
          }
        ],
        "categorySet": [
          {
            "id": 7315036
          }
        ],
        "categories": [
          "pizza",
          "restaurant"
        ],
        "classifications": [
          {
            "code": "RESTAURANT",
            "names": [
              {
                "nameLocale": "en-US",
                "name": "restaurant"
              },
              {
                "nameLocale": "en-US",
                "name": "pizza"
              }
            ]
          }
        ]
      },
      "address": {
        "streetNumber": "113",
        "streetName": "Cavasina Dr",
        "municipality": "Canonsburg",
        "countrySecondarySubdivision": "Washington",
        "countryTertiarySubdivision": "North Strabane",
        "countrySubdivision": "PA",
        "countrySubdivisionName": "Pennsylvania",
        "postalCode": "15317",
        "extendedPostalCode": "153171784",
        "countryCode": "US",
        "country": "United States",
        "countryCodeISO3": "USA",
        "freeformAddress": "113 Cavasina Dr, Canonsburg, PA 15317",
        "localName": "Canonsburg"
      },
      "position": {
        "lat": 40.26353,
        "lon": -80.17358
      },
      "viewport": {
        "topLeftPoint": {
          "lat": 40.26443,
          "lon": -80.17476
        },
        "btmRightPoint": {
          "lat": 40.26263,
          "lon": -80.1724
        }
      },
      "entryPoints": [
        {
          "type": "main",
          "position": {
            "lat": 40.26331,
            "lon": -80.17331
          }
        }
      ]
    },
    {
      "type": "POI",
      "id": "US/POI/p1/3871165",
      "score": 4.8463897705078125,
      "dist": 39491.657190780265,
      "info": "search:ta:840421000700727-US",
      "poi": {
        "name": "Papa John's",
        "phone": "+(1)-(724)-2289800",
        "brands": [
          {
            "name": "Papa John's"
          }
        ],
        "categorySet": [
          {
            "id": 7315036
          }
        ],
        "categories": [
          "pizza",
          "restaurant"
        ],
        "classifications": [
          {
            "code": "RESTAURANT",
            "names": [
              {
                "nameLocale": "en-US",
                "name": "restaurant"
              },
              {
                "nameLocale": "en-US",
                "name": "pizza"
              }
            ]
          }
        ]
      },
      "address": {
        "streetNumber": "74",
        "streetName": "Murtland Ave",
        "municipality": "Washington",
        "countrySecondarySubdivision": "Washington",
        "countryTertiarySubdivision": "Washington",
        "countrySubdivision": "PA",
        "countrySubdivisionName": "Pennsylvania",
        "postalCode": "15301",
        "countryCode": "US",
        "country": "United States",
        "countryCodeISO3": "USA",
        "freeformAddress": "74 Murtland Ave, Washington, PA 15301",
        "localName": "Washington"
      },
      "position": {
        "lat": 40.17987,
        "lon": -80.23786
      },
      "viewport": {
        "topLeftPoint": {
          "lat": 40.18077,
          "lon": -80.23904
        },
        "btmRightPoint": {
          "lat": 40.17897,
          "lon": -80.23668
        }
      },
      "entryPoints": [
        {
          "type": "main",
          "position": {
            "lat": 40.18006,
            "lon": -80.23756
          }
        }
      ]
    },
    {
      "type": "POI",
      "id": "US/POI/p1/3870943",
      "score": 4.7336201667785645,
      "dist": 47300.20485851142,
      "info": "search:ta:840421000700798-US",
      "poi": {
        "name": "Papa John's",
        "phone": "+(1)-(724)-8438808",
        "brands": [
          {
            "name": "Papa John's"
          }
        ],
        "categorySet": [
          {
            "id": 7315036
          }
        ],
        "categories": [
          "pizza",
          "restaurant"
        ],
        "classifications": [
          {
            "code": "RESTAURANT",
            "names": [
              {
                "nameLocale": "en-US",
                "name": "restaurant"
              },
              {
                "nameLocale": "en-US",
                "name": "pizza"
              }
            ]
          }
        ]
      },
      "address": {
        "streetNumber": "2749",
        "streetName": "College Ave",
        "municipality": "Beaver Falls",
        "countrySecondarySubdivision": "Beaver",
        "countryTertiarySubdivision": "Beaver Falls",
        "countrySubdivision": "PA",
        "countrySubdivisionName": "Pennsylvania",
        "postalCode": "15010",
        "extendedPostalCode": "150103627",
        "countryCode": "US",
        "country": "United States",
        "countryCodeISO3": "USA",
        "freeformAddress": "2749 College Ave, Beaver Falls, PA 15010",
        "localName": "Beaver Falls"
      },
      "position": {
        "lat": 40.76774,
        "lon": -80.32163
      },
      "viewport": {
        "topLeftPoint": {
          "lat": 40.76864,
          "lon": -80.32282
        },
        "btmRightPoint": {
          "lat": 40.76684,
          "lon": -80.32044
        }
      },
      "entryPoints": [
        {
          "type": "main",
          "position": {
            "lat": 40.76792,
            "lon": -80.32142
          }
        }
      ]
    }
  ]
}
""".data(using: .utf8)!
