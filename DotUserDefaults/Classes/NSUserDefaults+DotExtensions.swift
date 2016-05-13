//
//  UserDefaultsUtils.swift
//  UserDefaultsUtils
//
//  Created by Gustavo Saume on 4/28/16.
//  Copyright © 2016 BigPanza. All rights reserved.
//

import Foundation

public enum RawRepresentableError: ErrorType {
  case InvalidRawValue
}

extension NSUserDefaults {

  public func objectForKey<K: RawRepresentable where K.RawValue == String>(defaultName: K) -> AnyObject? {
    return objectForKey(defaultName.rawValue)
  }

  public func setObject<K: RawRepresentable where K.RawValue == String>(value: AnyObject?, forKey defaultName: K) {
    setObject(value, forKey: defaultName.rawValue)
  }

  public func removeObjectForKey<K: RawRepresentable where K.RawValue == String>(defaultName: K) {
    removeObjectForKey(defaultName.rawValue)
  }
  
  public func stringForKey<K: RawRepresentable where K.RawValue == String>(defaultName: K) -> String? {
    return stringForKey(defaultName.rawValue)
  }

  public func arrayForKey<K: RawRepresentable where K.RawValue == String>(defaultName: K) -> [AnyObject]? {
    return arrayForKey(defaultName.rawValue)
  }

  public func dictionaryForKey<K: RawRepresentable where K.RawValue == String>(defaultName: K) -> [String : AnyObject]? {
    return dictionaryForKey(defaultName.rawValue)
  }

  public func dataForKey<K: RawRepresentable where K.RawValue == String>(defaultName: K) -> NSData? {
    return dataForKey(defaultName.rawValue)
  }

  public func stringArrayForKey<K: RawRepresentable where K.RawValue == String>(defaultName: K) -> [String]? {
    return stringArrayForKey(defaultName.rawValue)
  }

  public func integerForKey<K: RawRepresentable where K.RawValue == String>(defaultName: K) -> Int {
    return integerForKey(defaultName.rawValue)
  }

  public func floatForKey<K: RawRepresentable where K.RawValue == String>(defaultName: K) -> Float {
    return floatForKey(defaultName.rawValue)
  }

  public func doubleForKey<K: RawRepresentable where K.RawValue == String>(defaultName: K) -> Double {
    return doubleForKey(defaultName.rawValue)
  }

  public func boolForKey<K: RawRepresentable where K.RawValue == String>(defaultName: K) -> Bool {
    return boolForKey(defaultName.rawValue)
  }

  public func URLForKey<K: RawRepresentable where K.RawValue == String>(defaultName: K) -> NSURL? {
    return URLForKey(defaultName.rawValue)
  }

  public func enumForKey<T: RawRepresentable where T.RawValue == Int>(defaultName: String) -> T? {
    guard let storedEnum = T(rawValue: integerForKey(defaultName)) else {
      return nil
    }

    return storedEnum
  }

  public func enumForKey<K: RawRepresentable, T: RawRepresentable where K.RawValue == String, T.RawValue == Int>(defaultName: K) -> T? {
    guard let storedEnum = T(rawValue: integerForKey(defaultName)) else {
      return nil
    }

    return storedEnum
  }

  public func enumForKey<T: RawRepresentable where T.RawValue == Double>(defaultName: String) -> T? {
    guard let storedEnum = T(rawValue: doubleForKey(defaultName)) else {
      return nil
    }

    return storedEnum
  }

  public func enumForKey<K: RawRepresentable, T: RawRepresentable where K.RawValue == String, T.RawValue == Double>(defaultName: K) -> T? {
    guard let storedEnum = T(rawValue: doubleForKey(defaultName)) else {
      return nil
    }

    return storedEnum
  }

  public func enumForKey<T: RawRepresentable where T.RawValue == Float>(defaultName: String) -> T? {
    guard let storedEnum = T(rawValue: floatForKey(defaultName)) else {
      return nil
    }

    return storedEnum
  }

  public func enumForKey<K: RawRepresentable, T: RawRepresentable where K.RawValue == String, T.RawValue == Float>(defaultName: K) -> T? {
    guard let storedEnum = T(rawValue: floatForKey(defaultName)) else {
      return nil
    }

    return storedEnum
  }

  public func enumForKey<T: RawRepresentable where T.RawValue == String>(defaultName: String) -> T? {
    guard let storedString = stringForKey(defaultName), storedEnum = T(rawValue: storedString) else {
      return nil
    }

    return storedEnum
  }

  public func enumForKey<K: RawRepresentable, T: RawRepresentable where K.RawValue == String, T.RawValue == String>(defaultName: K) -> T? {
    guard let storedString = stringForKey(defaultName), storedEnum = T(rawValue: storedString) else {
      return nil
    }

    return storedEnum
  }


  // MARK: - Setters

  public func setInteger<K: RawRepresentable where K.RawValue == String>(value: Int, forKey defaultName: K) {
    setInteger(value, forKey: defaultName.rawValue)
  }

  public func setFloat<K: RawRepresentable where K.RawValue == String>(value: Float, forKey defaultName: K) {
    setFloat(value, forKey: defaultName.rawValue)
  }

  public func setDouble<K: RawRepresentable where K.RawValue == String>(value: Double, forKey defaultName: K) {
    setDouble(value, forKey: defaultName.rawValue)
  }

  public func setBool<K: RawRepresentable where K.RawValue == String>(value: Bool, forKey defaultName: K) {
    setBool(value, forKey: defaultName.rawValue)
  }

  @available(iOS 4.0, *)
  public func setURL<K: RawRepresentable where K.RawValue == String>(url: NSURL?, forKey defaultName: K) {
    setURL(url, forKey: defaultName.rawValue)
  }

  public func setEnum<V: RawRepresentable where V.RawValue == String>(value: V, forKey key: String) {
    setObject(value.rawValue, forKey: key)
  }

  public func setEnum<V: RawRepresentable, K: RawRepresentable where V.RawValue == String, K.RawValue == String>(value: V, forKey key: K) {
    setObject(value.rawValue, forKey: key.rawValue)
  }

  public func setEnum<V: RawRepresentable where V.RawValue == Int>(value: V, forKey key: String) {
    setInteger(value.rawValue, forKey: key)
  }

  public func setEnum<V: RawRepresentable, K: RawRepresentable where V.RawValue == Int, K.RawValue == String>(value: V, forKey key: K) {
    setInteger(value.rawValue, forKey: key.rawValue)
  }

  public func setEnum<V: RawRepresentable where V.RawValue == Double>(value: V, forKey key: String) {
    setDouble(value.rawValue, forKey: key)
  }

  public func setEnum<V: RawRepresentable, K: RawRepresentable where V.RawValue == Double, K.RawValue == String>(value: V, forKey key: K) {
    setDouble(value.rawValue, forKey: key.rawValue)
  }

  public func setEnum<V: RawRepresentable where V.RawValue == Float>(value: V, forKey key: String) {
    setFloat(value.rawValue, forKey: key)
  }

  public func setEnum<V: RawRepresentable, K: RawRepresentable where V.RawValue == Float, K.RawValue == String>(value: V, forKey key: K) {
    setFloat(value.rawValue, forKey: key.rawValue)
  }
}
