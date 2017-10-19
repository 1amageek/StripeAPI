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
/**
 # Supported presentment currencies
 Any Stripe user can process charges in the following list of currencies with these exceptions:
 - Currencies marked with * are not supported by American Express
 - Most alternative payment methods can only be used with a single currency
 - Brazilian Stripe accounts (currently in Preview) can only charge in Brazilian Real
 - Mexican Stripe accounts (currently in Preview) can only charge in Mexican Peso
 */
public enum Currency: String, Codable {
    
    case AFN = "afn" // Afghan Afghani, AFN*
    case ALL = "all" // Albanian Lek, ALL
    case DZD = "dzd" // Algerian Dinar, DZD
    case AOA = "aoa" // Angolan Kwanza, AOA*
    case ARS = "ars" // Argentine Peso, ARS*
    case AMD = "amd" // Armenian Dram, AMD
    case AWG = "awg" // Aruban Florin, AWG
    case AUD = "aud" // Australian Dollar, AUD
    case AZN = "azn" // Azerbaijani Manat, AZN
    case BSD = "bsd" // Bahamian Dollar, BSD
    case BDT = "bdt" // Bangladeshi Taka, BDT
    case BBD = "bbd" // Barbadian Dollar, BBD
    case BZD = "bzd" // Belize Dollar, BZD
    case BMD = "bmd" // Bermudian Dollar, BMD
    case BOB = "bob" // Bolivian Boliviano, BOB*
    case BAM = "bam" // Bosnia & Herzegovina Convertible Mark, BAM
    case BWP = "bwp" // Botswana Pula, BWP
    case BRL = "brl" // Brazilian Real, BRL*
    case GBP = "gbp" // British Pound, GBP
    case BND = "bnd" // Brunei Dollar, BND
    case BGN = "bgn" // Bulgarian Lev, BGN
    case BIF = "bif" // Burundian Franc, BIF
    case KHR = "khr" // Cambodian Riel, KHR
    case CAD = "cad" // Canadian Dollar, CAD
    case CVE = "cve" // Cape Verdean Escudo, CVE*
    case KYD = "kyd" // Cayman Islands Dollar, KYD
    case XAF = "xaf" // Central African Cfa Franc, XAF
    case XPF = "xpf" // Cfp Franc, XPF*
    case CLP = "clp" // Chilean Peso, CLP*
    case CNY = "cny" // Chinese Renminbi Yuan, CNY
    case COP = "cop" // Colombian Peso, COP*
    case KMF = "kmf" // Comorian Franc, KMF
    case CDF = "cdf" // Congolese Franc, CDF
    case CRC = "crc" // Costa Rican Colón, CRC*
    case HRK = "hrk" // Croatian Kuna, HRK
    case CZK = "czk" // Czech Koruna, CZK*
    case DKK = "dkk" // Danish Krone, DKK
    case DJF = "djf" // Djiboutian Franc, DJF*
    case DOP = "dop" // Dominican Peso, DOP
    case XCD = "xcd" // East Caribbean Dollar, XCD
    case EGP = "egp" // Egyptian Pound, EGP
    case ETB = "etb" // Ethiopian Birr, ETB
    case EUR = "eur" // Euro, EUR
    case FKP = "fkp" // Falkland Islands Pound, FKP*
    case FJD = "fjd" // Fijian Dollar, FJD
    case GMD = "gmd" // Gambian Dalasi, GMD
    case GEL = "gel" // Georgian Lari, GEL
    case GIP = "gip" // Gibraltar Pound, GIP
    case GTQ = "gtq" // Guatemalan Quetzal, GTQ*
    case GNF = "gnf" // Guinean Franc, GNF*
    case GYD = "gyd" // Guyanese Dollar, GYD
    case HTG = "htg" // Haitian Gourde, HTG
    case HNL = "hnl" // Honduran Lempira, HNL*
    case HKD = "hkd" // Hong Kong Dollar, HKD
    case HUF = "huf" // Hungarian Forint, HUF*
    case ISK = "isk" // Icelandic Króna, ISK
    case INR = "inr" // Indian Rupee, INR*
    case IDR = "idr" // Indonesian Rupiah, IDR
    case ILS = "ils" // Israeli New Sheqel, ILS
    case JMD = "jmd" // Jamaican Dollar, JMD
    case JPY = "jpy" // Japanese Yen, JPY
    case KZT = "kzt" // Kazakhstani Tenge, KZT
    case KES = "kes" // Kenyan Shilling, KES
    case KGS = "kgs" // Kyrgyzstani Som, KGS
    case LAK = "lak" // Lao Kip, LAK*
    case LBP = "lbp" // Lebanese Pound, LBP
    case LSL = "lsl" // Lesotho Loti, LSL
    case LRD = "lrd" // Liberian Dollar, LRD
    case MOP = "mop" // Macanese Pataca, MOP
    case MKD = "mkd" // Macedonian Denar, MKD
    case MGA = "mga" // Malagasy Ariary, MGA
    case MWK = "mwk" // Malawian Kwacha, MWK
    case MYR = "myr" // Malaysian Ringgit, MYR
    case MVR = "mvr" // Maldivian Rufiyaa, MVR
    case MRO = "mro" // Mauritanian Ouguiya, MRO
    case MUR = "mur" // Mauritian Rupee, MUR*
    case MXN = "mxn" // Mexican Peso, MXN*
    case MDL = "mdl" // Moldovan Leu, MDL
    case MNT = "mnt" // Mongolian Tögrög, MNT
    case MAD = "mad" // Moroccan Dirham, MAD
    case MZN = "mzn" // Mozambican Metical, MZN
    case MMK = "mmk" // Myanmar Kyat, MMK
    case NAD = "nad" // Namibian Dollar, NAD
    case NPR = "npr" // Nepalese Rupee, NPR
    case ANG = "ang" // Netherlands Antillean Gulden, ANG
    case TWD = "twd" // New Taiwan Dollar, TWD
    case NZD = "nzd" // New Zealand Dollar, NZD
    case NIO = "nio" // Nicaraguan Córdoba, NIO*
    case NGN = "ngn" // Nigerian Naira, NGN
    case NOK = "nok" // Norwegian Krone, NOK
    case PKR = "pkr" // Pakistani Rupee, PKR
    case PAB = "pab" // Panamanian Balboa, PAB*
    case PGK = "pgk" // Papua New Guinean Kina, PGK
    case PYG = "pyg" // Paraguayan Guaraní, PYG*
    case PEN = "pen" // Peruvian Nuevo Sol, PEN*
    case PHP = "php" // Philippine Peso, PHP
    case PLN = "pln" // Polish Złoty, PLN
    case QAR = "qar" // Qatari Riyal, QAR
    case RON = "ron" // Romanian Leu, RON
    case RUB = "rub" // Russian Ruble, RUB
    case RWF = "rwf" // Rwandan Franc, RWF
    case STD = "std" // São Tomé and Príncipe Dobra, STD
    case SHP = "shp" // Saint Helenian Pound, SHP*
    case SVC = "svc" // Salvadoran Colón, SVC*
    case WST = "wst" // Samoan Tala, WST
    case SAR = "sar" // Saudi Riyal, SAR
    case RSD = "rsd" // Serbian Dinar, RSD
    case SCR = "scr" // Seychellois Rupee, SCR
    case SLL = "sll" // Sierra Leonean Leone, SLL
    case SGD = "sgd" // Singapore Dollar, SGD
    case SBD = "sbd" // Solomon Islands Dollar, SBD
    case SOS = "sos" // Somali Shilling, SOS
    case ZAR = "zar" // South African Rand, ZAR
    case KRW = "krw" // South Korean Won, KRW
    case LKR = "lkr" // Sri Lankan Rupee, LKR
    case SRD = "srd" // Surinamese Dollar, SRD*
    case SZL = "szl" // Swazi Lilangeni, SZL
    case SEK = "sek" // Swedish Krona, SEK
    case CHF = "chf" // Swiss Franc, CHF
    case TJS = "tjs" // Tajikistani Somoni, TJS
    case TZS = "tzs" // Tanzanian Shilling, TZS
    case THB = "thb" // Thai Baht, THB
    case TOP = "top" // Tongan Paʻanga, TOP
    case TTD = "ttd" // Trinidad and Tobago Dollar, TTD
    case TRY = "try" // Turkish Lira, TRY
    case UGX = "ugx" // Ugandan Shilling, UGX
    case UAH = "uah" // Ukrainian Hryvnia, UAH
    case AED = "aed" // United Arab Emirates Dirham, AED
    case USD = "usd" // United States Dollar, USD
    case UYU = "uyu" // Uruguayan Peso, UYU*
    case UZS = "uzs" // Uzbekistani Som, UZS
    case VUV = "vuv" // Vanuatu Vatu, VUV
    case VND = "vnd" // Vietnamese Đồng, VND
    case XOF = "xof" // West African Cfa Franc, XOF*
    case YER = "yer" // Yemeni Rial, YER
    case ZMW = "zmw" // Zambian Kwacha, ZMW
}
