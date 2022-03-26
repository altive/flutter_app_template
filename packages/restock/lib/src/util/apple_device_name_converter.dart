// ignore_for_file: lines_longer_than_80_chars
String convertAppleDeviceName(String machineName) {
  switch (machineName) {
    /* Simulator */
    case 'i386':
      return 'Simulator';
    case 'x86_64':
      return 'Simulator';
    /* iPod */
    case 'iPod1,1':
      return 'iPod Touch 1st'; // iPod Touch 1st Generation
    case 'iPod2,1':
      return 'iPod Touch 2nd'; // iPod Touch 2nd Generation
    case 'iPod3,1':
      return 'iPod Touch 3rd'; // iPod Touch 3rd Generation
    case 'iPod4,1':
      return 'iPod Touch 4th'; // iPod Touch 4th Generation
    case 'iPod5,1':
      return 'iPod Touch 5th'; // iPod Touch 5th Generation
    case 'iPod7,1':
      return 'iPod Touch 6th'; // iPod Touch 6th Generation
    /* iPhone */
    case 'iPhone1,1':
      return 'iPhone 2G'; // iPhone 2G
    case 'iPhone1,2':
      return 'iPhone 3G'; // iPhone 3G
    case 'iPhone2,1':
      return 'iPhone 3GS'; // iPhone 3GS
    case 'iPhone3,1':
      return 'iPhone 4'; // iPhone 4 GSM
    case 'iPhone3,2':
      return 'iPhone 4'; // iPhone 4 GSM 2012
    case 'iPhone3,3':
      return 'iPhone 4'; // iPhone 4 CDMA For Verizon,Sprint
    case 'iPhone4,1':
      return 'iPhone 4S'; // iPhone 4S
    case 'iPhone5,1':
      return 'iPhone 5'; // iPhone 5 GSM
    case 'iPhone5,2':
      return 'iPhone 5'; // iPhone 5 Global
    case 'iPhone5,3':
      return 'iPhone 5c'; // iPhone 5c GSM
    case 'iPhone5,4':
      return 'iPhone 5c'; // iPhone 5c Global
    case 'iPhone6,1':
      return 'iPhone 5s'; // iPhone 5s GSM
    case 'iPhone6,2':
      return 'iPhone 5s'; // iPhone 5s Global
    case 'iPhone7,1':
      return 'iPhone 6 Plus'; // iPhone 6 Plus
    case 'iPhone7,2':
      return 'iPhone 6'; // iPhone 6
    case 'iPhone8,1':
      return 'iPhone 6S'; // iPhone 6S
    case 'iPhone8,2':
      return 'iPhone 6S Plus'; // iPhone 6S Plus
    case 'iPhone8,4':
      return 'iPhone SE'; // iPhone SE
    case 'iPhone9,1':
      return 'iPhone 7'; // iPhone 7 A1660,A1779,A1780
    case 'iPhone9,3':
      return 'iPhone 7'; // iPhone 7 A1778
    case 'iPhone9,2':
      return 'iPhone 7 Plus'; // iPhone 7 Plus A1661,A1785,A1786
    case 'iPhone9,4':
      return 'iPhone 7 Plus'; // iPhone 7 Plus A1784
    case 'iPhone10,1':
      return 'iPhone 8'; // iPhone 8 A1863,A1906,A1907
    case 'iPhone10,4':
      return 'iPhone 8'; // iPhone 8 A1905
    case 'iPhone10,2':
      return 'iPhone 8 Plus'; // iPhone 8 Plus A1864,A1898,A1899
    case 'iPhone10,5':
      return 'iPhone 8 Plus'; // iPhone 8 Plus A1897
    case 'iPhone10,3':
      return 'iPhone X'; // iPhone X A1865,A1902
    case 'iPhone10,6':
      return 'iPhone X'; // iPhone X A1901
    case 'iPhone11,8':
      return 'iPhone XR'; // iPhone XR A1984,A2105,A2106,A2108
    case 'iPhone11,2':
      return 'iPhone XS'; // iPhone XS A2097,A2098
    case 'iPhone11,4':
      return 'iPhone XS Max'; // iPhone XS Max A1921,A2103
    case 'iPhone11,6':
      return 'iPhone XS Max'; // iPhone XS Max A2104

    /* iPad */
    case 'iPad1,1':
      return 'iPad 1'; // iPad 1
    case 'iPad2,1':
      return 'iPad 2 WiFi'; // iPad 2
    case 'iPad2,2':
      return 'iPad 2 Cell'; // iPad 2 GSM
    case 'iPad2,3':
      return 'iPad 2 Cell'; // iPad 2 CDMA (Cellular)
    case 'iPad2,4':
      return 'iPad 2 WiFi'; // iPad 2 Mid2012
    case 'iPad2,5':
      return 'iPad Mini WiFi'; // iPad Mini WiFi
    case 'iPad2,6':
      return 'iPad Mini Cell'; // iPad Mini GSM (Cellular)
    case 'iPad2,7':
      return 'iPad Mini Cell'; // iPad Mini Global (Cellular)
    case 'iPad3,1':
      return 'iPad 3 WiFi'; // iPad 3 WiFi
    case 'iPad3,2':
      return 'iPad 3 Cell'; // iPad 3 CDMA (Cellular)
    case 'iPad3,3':
      return 'iPad 3 Cell'; // iPad 3 GSM (Cellular)
    case 'iPad3,4':
      return 'iPad 4 WiFi'; // iPad 4 WiFi
    case 'iPad3,5':
      return 'iPad 4 Cell'; // iPad 4 GSM (Cellular)
    case 'iPad3,6':
      return 'iPad 4 Cell'; // iPad 4 Global (Cellular)
    case 'iPad4,1':
      return 'iPad Air WiFi'; // iPad Air WiFi
    case 'iPad4,2':
      return 'iPad Air Cell'; // iPad Air Cellular
    case 'iPad4,3':
      return 'iPad Air China'; // iPad Air ChinaModel
    case 'iPad4,4':
      return 'iPad Mini 2 WiFi'; // iPad mini 2 WiFi
    case 'iPad4,5':
      return 'iPad Mini 2 Cell'; // iPad mini 2 Cellular
    case 'iPad4,6':
      return 'iPad Mini 2 China'; // iPad mini 2 ChinaModel
    case 'iPad4,7':
      return 'iPad Mini 3 WiFi'; // iPad mini 3 WiFi
    case 'iPad4,8':
      return 'iPad Mini 3 Cell'; // iPad mini 3 Cellular
    case 'iPad4,9':
      return 'iPad Mini 3 China'; // iPad mini 3 ChinaModel
    case 'iPad5,1':
      return 'iPad Mini 4 WiFi'; // iPad Mini 4 WiFi
    case 'iPad5,2':
      return 'iPad Mini 4 Cell'; // iPad Mini 4 Cellular
    case 'iPad5,3':
      return 'iPad Air 2 WiFi'; // iPad Air 2 WiFi
    case 'iPad5,4':
      return 'iPad Air 2 Cell'; // iPad Air 2 Cellular
    case 'iPad6,3':
      return 'iPad Pro 9.7inch WiFi'; // iPad Pro 9.7inch WiFi
    case 'iPad6,4':
      return 'iPad Pro 9.7inch Cell'; // iPad Pro 9.7inch Cellular
    case 'iPad6,7':
      return 'iPad Pro 12.9inch WiFi'; // iPad Pro 12.9inch WiFi
    case 'iPad6,8':
      return 'iPad Pro 12.9inch Cell'; // iPad Pro 12.9inch Cellular
    case 'iPad6,11':
      return 'iPad 5th'; // iPad 5th Generation WiFi
    case 'iPad6,12':
      return 'iPad 5th'; // iPad 5th Generation Cellular
    case 'iPad7,1':
      return 'iPad Pro 12.9inch 2nd'; // iPad Pro 12.9inch 2nd Generation WiFi
    case 'iPad7,2':
      return 'iPad Pro 12.9inch 2nd'; // iPad Pro 12.9inch 2nd Generation Cellular
    case 'iPad7,3':
      return 'iPad Pro 10.5inch'; // iPad Pro 10.5inch A1701 WiFi
    case 'iPad7,4':
      return 'iPad Pro 10.5inch'; // iPad Pro 10.5inch A1709 Cellular
    case 'iPad7,5':
      return 'iPad 6th'; // iPad 6th Generation WiFi
    case 'iPad7,6':
      return 'iPad 6th'; // iPad 6th Generation Cellular
    case 'iPad8,1':
      return 'iPad Pro 11inch WiFi'; // iPad Pro 11inch WiFi
    case 'iPad8,2':
      return 'iPad Pro 11inch WiFi'; // iPad Pro 11inch WiFi
    case 'iPad8,3':
      return 'iPad Pro 11inch Cell'; // iPad Pro 11inch Cellular
    case 'iPad8,4':
      return 'iPad Pro 11inch Cell'; // iPad Pro 11inch Cellular
    case 'iPad8,5':
      return 'iPad Pro 12.9inch WiFi'; // iPad Pro 12.9inch WiFi
    case 'iPad8,6':
      return 'iPad Pro 12.9inch WiFi'; // iPad Pro 12.9inch WiFi
    case 'iPad8,7':
      return 'iPad Pro 12.9inch Cell'; // iPad Pro 12.9inch Cellular
    case 'iPad8,8':
      return 'iPad Pro 12.9inch Cell'; // iPad Pro 12.9inch Cellular
    case 'iPad11,1':
      return 'iPad Mini 5th WiFi'; // iPad mini 5th WiFi
    case 'iPad11,2':
      return 'iPad Mini 5th Cell'; // iPad mini 5th Cellular
    case 'iPad11,3':
      return 'iPad Air 3rd WiFi'; // iPad Air 3rd generation WiFi
    case 'iPad11,4':
      return 'iPad Air 3rd Cell'; // iPad Air 3rd generation Cellular
    default:
      return machineName;
  }
}
