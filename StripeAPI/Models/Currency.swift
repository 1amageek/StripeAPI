//
//  Currency.swift
//  StripeAPI
//
//  Created by nori on 2017/10/16.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

// https://www.iso.org/iso-4217-currency-codes.html
// https://stripe.com/docs/currencies
public enum Currency: String {
    
    case AFN = "AFN" // Afghan Afghani, AFN*
    case ALL = "ALL" // Albanian Lek, ALL
    case DZD = "DZD" // Algerian Dinar, DZD
    case AOA = "AOA" // Angolan Kwanza, AOA*
    case ARS = "ARS" // Argentine Peso, ARS*
    case AMD = "AMD" // Armenian Dram, AMD
    case AWG = "AWG" // Aruban Florin, AWG
    case AUD = "AUD" // Australian Dollar, AUD
    case AZN = "AZN" // Azerbaijani Manat, AZN
    case BSD = "BSD" // Bahamian Dollar, BSD
    case BDT = "BDT" // Bangladeshi Taka, BDT
    case BBD = "BBD" // Barbadian Dollar, BBD
    case BZD = "BZD" // Belize Dollar, BZD
    case BMD = "BMD" // Bermudian Dollar, BMD
    case BOB = "BOB" // Bolivian Boliviano, BOB*
    case BAM = "BAM" // Bosnia & Herzegovina Convertible Mark, BAM
    case BWP = "BWP" // Botswana Pula, BWP
    case BRL = "BRL" // Brazilian Real, BRL*
    case GBP = "GBP" // British Pound, GBP
    case BND = "BND" // Brunei Dollar, BND
    case BGN = "BGN" // Bulgarian Lev, BGN
    case BIF = "BIF" // Burundian Franc, BIF
    case KHR = "KHR" // Cambodian Riel, KHR
    case CAD = "CAD" // Canadian Dollar, CAD
    case CVE = "CVE" // Cape Verdean Escudo, CVE*
    case KYD = "KYD" // Cayman Islands Dollar, KYD
    case XAF = "XAF" // Central African Cfa Franc, XAF
    case XPF = "XPF" // Cfp Franc, XPF*
    case CLP = "CLP" // Chilean Peso, CLP*
    case CNY = "CNY" // Chinese Renminbi Yuan, CNY
    case COP = "COP" // Colombian Peso, COP*
    case KMF = "KMF" // Comorian Franc, KMF
    case CDF = "CDF" // Congolese Franc, CDF
    case CRC = "CRC" // Costa Rican Colón, CRC*
    case HRK = "HRK" // Croatian Kuna, HRK
    case CZK = "CZK" // Czech Koruna, CZK*
    case DKK = "DKK" // Danish Krone, DKK
    case DJF = "DJF" // Djiboutian Franc, DJF*
    case DOP = "DOP" // Dominican Peso, DOP
    case XCD = "XCD" // East Caribbean Dollar, XCD
    case EGP = "EGP" // Egyptian Pound, EGP
    case ETB = "ETB" // Ethiopian Birr, ETB
    case EUR = "EUR" // Euro, EUR
    case FKP = "FKP" // Falkland Islands Pound, FKP*
    case FJD = "FJD" // Fijian Dollar, FJD
    case GMD = "GMD" // Gambian Dalasi, GMD
    case GEL = "GEL" // Georgian Lari, GEL
    case GIP = "GIP" // Gibraltar Pound, GIP
    case GTQ = "GTQ" // Guatemalan Quetzal, GTQ*
    case GNF = "GNF" // Guinean Franc, GNF*
    case GYD = "GYD" // Guyanese Dollar, GYD
    case HTG = "HTG" // Haitian Gourde, HTG
    case HNL = "HNL" // Honduran Lempira, HNL*
    case HKD = "HKD" // Hong Kong Dollar, HKD
    case HUF = "HUF" // Hungarian Forint, HUF*
    case ISK = "ISK" // Icelandic Króna, ISK
    case INR = "INR" // Indian Rupee, INR*
    case IDR = "IDR" // Indonesian Rupiah, IDR
    case ILS = "ILS" // Israeli New Sheqel, ILS
    case JMD = "JMD" // Jamaican Dollar, JMD
    case JPY = "JPY" // Japanese Yen, JPY
    case KZT = "KZT" // Kazakhstani Tenge, KZT
    case KES = "KES" // Kenyan Shilling, KES
    case KGS = "KGS" // Kyrgyzstani Som, KGS
    case LAK = "LAK" // Lao Kip, LAK*
    case LBP = "LBP" // Lebanese Pound, LBP
    case LSL = "LSL" // Lesotho Loti, LSL
    case LRD = "LRD" // Liberian Dollar, LRD
    case MOP = "MOP" // Macanese Pataca, MOP
    case MKD = "MKD" // Macedonian Denar, MKD
    case MGA = "MGA" // Malagasy Ariary, MGA
    case MWK = "MWK" // Malawian Kwacha, MWK
    case MYR = "MYR" // Malaysian Ringgit, MYR
    case MVR = "MVR" // Maldivian Rufiyaa, MVR
    case MRO = "MRO" // Mauritanian Ouguiya, MRO
    case MUR = "MUR" // Mauritian Rupee, MUR*
    case MXN = "MXN" // Mexican Peso, MXN*
    case MDL = "MDL" // Moldovan Leu, MDL
    case MNT = "MNT" // Mongolian Tögrög, MNT
    case MAD = "MAD" // Moroccan Dirham, MAD
    case MZN = "MZN" // Mozambican Metical, MZN
    case MMK = "MMK" // Myanmar Kyat, MMK
    case NAD = "NAD" // Namibian Dollar, NAD
    case NPR = "NPR" // Nepalese Rupee, NPR
    case ANG = "ANG" // Netherlands Antillean Gulden, ANG
    case TWD = "TWD" // New Taiwan Dollar, TWD
    case NZD = "NZD" // New Zealand Dollar, NZD
    case NIO = "NIO" // Nicaraguan Córdoba, NIO*
    case NGN = "NGN" // Nigerian Naira, NGN
    case NOK = "NOK" // Norwegian Krone, NOK
    case PKR = "PKR" // Pakistani Rupee, PKR
    case PAB = "PAB" // Panamanian Balboa, PAB*
    case PGK = "PGK" // Papua New Guinean Kina, PGK
    case PYG = "PYG" // Paraguayan Guaraní, PYG*
    case PEN = "PEN" // Peruvian Nuevo Sol, PEN*
    case PHP = "PHP" // Philippine Peso, PHP
    case PLN = "PLN" // Polish Złoty, PLN
    case QAR = "QAR" // Qatari Riyal, QAR
    case RON = "RON" // Romanian Leu, RON
    case RUB = "RUB" // Russian Ruble, RUB
    case RWF = "RWF" // Rwandan Franc, RWF
    case STD = "STD" // São Tomé and Príncipe Dobra, STD
    case SHP = "SHP" // Saint Helenian Pound, SHP*
    case SVC = "SVC" // Salvadoran Colón, SVC*
    case WST = "WST" // Samoan Tala, WST
    case SAR = "SAR" // Saudi Riyal, SAR
    case RSD = "RSD" // Serbian Dinar, RSD
    case SCR = "SCR" // Seychellois Rupee, SCR
    case SLL = "SLL" // Sierra Leonean Leone, SLL
    case SGD = "SGD" // Singapore Dollar, SGD
    case SBD = "SBD" // Solomon Islands Dollar, SBD
    case SOS = "SOS" // Somali Shilling, SOS
    case ZAR = "ZAR" // South African Rand, ZAR
    case KRW = "KRW" // South Korean Won, KRW
    case LKR = "LKR" // Sri Lankan Rupee, LKR
    case SRD = "SRD" // Surinamese Dollar, SRD*
    case SZL = "SZL" // Swazi Lilangeni, SZL
    case SEK = "SEK" // Swedish Krona, SEK
    case CHF = "CHF" // Swiss Franc, CHF
    case TJS = "TJS" // Tajikistani Somoni, TJS
    case TZS = "TZS" // Tanzanian Shilling, TZS
    case THB = "THB" // Thai Baht, THB
    case TOP = "TOP" // Tongan Paʻanga, TOP
    case TTD = "TTD" // Trinidad and Tobago Dollar, TTD
    case TRY = "TRY" // Turkish Lira, TRY
    case UGX = "UGX" // Ugandan Shilling, UGX
    case UAH = "UAH" // Ukrainian Hryvnia, UAH
    case AED = "AED" // United Arab Emirates Dirham, AED
    case USD = "USD" // United States Dollar, USD
    case UYU = "UYU" // Uruguayan Peso, UYU*
    case UZS = "UZS" // Uzbekistani Som, UZS
    case VUV = "VUV" // Vanuatu Vatu, VUV
    case VND = "VND" // Vietnamese Đồng, VND
    case XOF = "XOF" // West African Cfa Franc, XOF*
    case YER = "YER" // Yemeni Rial, YER
    case ZMW = "ZMW" // Zambian Kwacha, ZMW
    
}
