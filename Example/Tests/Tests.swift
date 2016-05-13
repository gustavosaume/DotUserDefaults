// https://github.com/Quick/Quick

import Quick
import Nimble
import DotUserDefaults

class DotUserDefaultsSpec: QuickSpec {

  private enum Foo: String {
    case Bar = "Bar"
  }

  let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

  override func spec() {
    afterEach {
      NSUserDefaults.resetStandardUserDefaults()
    }

    describe("accessing user defaults") {
      context("when the value is an object") {
        let testObject = NSDate()

        it("can read") {
          self.defaults.setObject(testObject, forKey: Foo.Bar.rawValue)
          expect(self.defaults.objectForKey(Foo.Bar) as? NSDate) == testObject
        }

        it("can write") {
          self.defaults.setObject(testObject, forKey: Foo.Bar)
          expect(self.defaults.objectForKey(Foo.Bar.rawValue) as? NSDate) == testObject
        }

        it("can remove") {
          self.defaults.setObject(testObject, forKey: Foo.Bar.rawValue)
          self.defaults.removeObjectForKey(Foo.Bar)
          self.defaults.synchronize()
          expect(self.defaults.objectForKey(Foo.Bar.rawValue)).to(beNil())
        }
      }

      context("when the value is a string") {
        let testString = "yay"

        it("can read") {
          self.defaults.setObject(testString, forKey: Foo.Bar.rawValue)
          expect(self.defaults.stringForKey(Foo.Bar)) == testString
        }

        it("can write") {
          self.defaults.setObject(testString, forKey: Foo.Bar)
          expect(self.defaults.stringForKey(Foo.Bar.rawValue)) == testString
        }
      }

      context("when the value is an array") {
        let testArray = [4, 8, 15, 16, 23, 42]

        it("can read") {
          self.defaults.setObject(testArray, forKey: Foo.Bar.rawValue)
          expect(self.defaults.arrayForKey(Foo.Bar) as? [Int]) == testArray
        }

        it("can write") {
          self.defaults.setObject(testArray, forKey: Foo.Bar)
          expect(self.defaults.arrayForKey(Foo.Bar.rawValue) as? [Int]) == testArray
        }
      }

      context("when the value is a dictionary") {
        let testDict = ["wait for": "it"]

        it("can read") {
          self.defaults.setObject(testDict, forKey: Foo.Bar.rawValue)
          expect(self.defaults.dictionaryForKey(Foo.Bar) as? [String: String]) == testDict
        }

        it("can write") {
          self.defaults.setObject(testDict, forKey: Foo.Bar)
          expect(self.defaults.dictionaryForKey(Foo.Bar.rawValue) as? [String: String]) == testDict
        }
      }

      context("when the value is data") {
        let testData = NSData(base64EncodedString: "VGhpcyBpcyBCYXNlNjQ=", options: [])

        it("can read") {
          self.defaults.setObject(testData, forKey: Foo.Bar.rawValue)
          expect(self.defaults.dataForKey(Foo.Bar)) == testData
        }

        it("can write") {
          self.defaults.setObject(testData, forKey: Foo.Bar)
          expect(self.defaults.dataForKey(Foo.Bar.rawValue)) == testData
        }
      }

      context("when the value is an array of strings") {
        let testArray = ["it", "works"]

        it("can read") {
          self.defaults.setObject(testArray, forKey: Foo.Bar.rawValue)
          expect(self.defaults.stringArrayForKey(Foo.Bar)) == testArray
        }

        it("can write") {
          self.defaults.setObject(testArray, forKey: Foo.Bar)
          expect(self.defaults.stringArrayForKey(Foo.Bar.rawValue)) == testArray
        }
      }

      context("when the value is an integer") {
        let testInt = 42

        it("can read") {
          self.defaults.setInteger(testInt, forKey: Foo.Bar.rawValue)
          expect(self.defaults.integerForKey(Foo.Bar)) == testInt
        }

        it("can write") {
          self.defaults.setInteger(testInt, forKey: Foo.Bar)
          expect(self.defaults.integerForKey(Foo.Bar.rawValue)) == testInt
        }
      }

      context("when the value is a float") {
        let testFloat: Float = 3.1416

        it("can read") {
          self.defaults.setFloat(testFloat, forKey: Foo.Bar.rawValue)
          expect(self.defaults.floatForKey(Foo.Bar)) == testFloat
        }

        it("can write") {
          self.defaults.setFloat(testFloat, forKey: Foo.Bar)
          expect(self.defaults.floatForKey(Foo.Bar.rawValue)) == testFloat
        }
      }

      context("when the value is a double") {
        let testDouble = 3.1416

        it("can read") {
          self.defaults.setDouble(testDouble, forKey: Foo.Bar.rawValue)
          expect(self.defaults.doubleForKey(Foo.Bar)) == testDouble
        }

        it("can write") {
          self.defaults.setDouble(testDouble, forKey: Foo.Bar)
          expect(self.defaults.doubleForKey(Foo.Bar.rawValue)) == testDouble
        }
      }

      context("when the value is a boolean") {
        let testBool = true

        it("can read") {
          self.defaults.setBool(testBool, forKey: Foo.Bar.rawValue)
          expect(self.defaults.boolForKey(Foo.Bar)).to(beTrue())
        }

        it("can write") {
          self.defaults.setBool(testBool, forKey: Foo.Bar)
          expect(self.defaults.boolForKey(Foo.Bar.rawValue)).to(beTrue())
        }
      }

      context("when the value is an URL") {
        let testURL = NSURL(string: "https://github.com/gustavosaume/DotUserDefaults.git")

        it("can read") {
          self.defaults.setURL(testURL, forKey: Foo.Bar.rawValue)
          expect(self.defaults.URLForKey(Foo.Bar)) == testURL
        }

        it("can write") {
          self.defaults.setURL(testURL, forKey: Foo.Bar)
          expect(self.defaults.URLForKey(Foo.Bar.rawValue)) == testURL
        }
      }

      context("when the value is an Enum<String>") {
        enum Value: String {
          case Yas = "yas"
        }

        context("and the key is a string") {
          it("can read") {
            self.defaults.setObject(Value.Yas.rawValue, forKey: Foo.Bar.rawValue)
            expect(self.defaults.enumForKey(Foo.Bar.rawValue) as Value!) == Value.Yas
          }

          it("can read wrong values") {
            self.defaults.setObject("Nope", forKey: Foo.Bar.rawValue)
            let actual: Value? = self.defaults.enumForKey(Foo.Bar.rawValue)
            expect(actual).to(beNil())
          }

          it("can write") {
            self.defaults.setEnum(Value.Yas, forKey: Foo.Bar.rawValue)
            expect(self.defaults.stringForKey(Foo.Bar.rawValue)) == Value.Yas.rawValue
          }
        }

        context("and the key is another enum") {
          it("can read") {
            self.defaults.setObject(Value.Yas.rawValue, forKey: Foo.Bar)
            expect(self.defaults.enumForKey(Foo.Bar) as Value!) == Value.Yas
          }

          it("can read wrong values") {
            self.defaults.setObject("Nope", forKey: Foo.Bar)
            let actual: Value? = self.defaults.enumForKey(Foo.Bar)
            expect(actual).to(beNil())
          }

          it("can write") {
            self.defaults.setEnum(Value.Yas, forKey: Foo.Bar)
            expect(self.defaults.stringForKey(Foo.Bar)) == Value.Yas.rawValue
          }
        }
      }

      context("when the value is an Enum<Int>") {
        enum Value: Int {
          case Zero = 0
        }

        context("and the key is a string") {
          it("can read") {
            self.defaults.setInteger(Value.Zero.rawValue, forKey: Foo.Bar.rawValue)
            expect(self.defaults.enumForKey(Foo.Bar.rawValue) as Value!) == Value.Zero
          }

          it("can read wrong values") {
            self.defaults.setInteger(10000, forKey: Foo.Bar.rawValue)
            let actual: Value? = self.defaults.enumForKey(Foo.Bar.rawValue)
            expect(actual).to(beNil())
          }

          it("can write") {
            self.defaults.setEnum(Value.Zero, forKey: Foo.Bar.rawValue)
            expect(self.defaults.integerForKey(Foo.Bar.rawValue)) == Value.Zero.rawValue
          }
        }

        context("and the key is another enum") {
          it("can read") {
            self.defaults.setInteger(Value.Zero.rawValue, forKey: Foo.Bar)
            expect(self.defaults.enumForKey(Foo.Bar) as Value!) == Value.Zero
          }

          it("can read wrong values") {
            self.defaults.setInteger(10000, forKey: Foo.Bar)
            let actual: Value? = self.defaults.enumForKey(Foo.Bar)
            expect(actual).to(beNil())
          }

          it("can write") {
            self.defaults.setEnum(Value.Zero, forKey: Foo.Bar)
            expect(self.defaults.integerForKey(Foo.Bar)) == Value.Zero.rawValue
          }
        }
      }

      context("when the value is an Enum<Double>") {
        enum Value: Double {
          case Pi = 3.1416
        }

        context("and the key is a string") {
          it("can read") {
            self.defaults.setDouble(Value.Pi.rawValue, forKey: Foo.Bar.rawValue)
            expect(self.defaults.enumForKey(Foo.Bar.rawValue) as Value!) == Value.Pi
          }

          it("can read wrong values") {
            self.defaults.setDouble(99.9999999, forKey: Foo.Bar.rawValue)
            let actual: Value? = self.defaults.enumForKey(Foo.Bar.rawValue)
            expect(actual).to(beNil())
          }

          it("can write") {
            self.defaults.setEnum(Value.Pi, forKey: Foo.Bar.rawValue)
            expect(self.defaults.doubleForKey(Foo.Bar.rawValue)) == Value.Pi.rawValue
          }
        }

        context("and the key is another enum") {
          it("can read") {
            self.defaults.setObject(Value.Pi.rawValue, forKey: Foo.Bar)
            expect(self.defaults.enumForKey(Foo.Bar) as Value!) == Value.Pi
          }

          it("can read wrong values") {
            self.defaults.setDouble(99.9999999, forKey: Foo.Bar)
            let actual: Value? = self.defaults.enumForKey(Foo.Bar)
            expect(actual).to(beNil())
          }


          it("can write") {
            self.defaults.setEnum(Value.Pi, forKey: Foo.Bar)
            expect(self.defaults.doubleForKey(Foo.Bar)) == Value.Pi.rawValue
          }
        }
      }

      context("when the value is an Enum<Float>") {
        enum Value: Float {
          case Pi = 3.1416
        }

        context("and the key is a string") {
          it("can read") {
            self.defaults.setFloat(Value.Pi.rawValue, forKey: Foo.Bar.rawValue)
            expect(self.defaults.enumForKey(Foo.Bar.rawValue) as Value!) == Value.Pi
          }

          it("can read wrong values") {
            self.defaults.setFloat(0.00001, forKey: Foo.Bar.rawValue)
            let actual: Value? = self.defaults.enumForKey(Foo.Bar.rawValue)
            expect(actual).to(beNil())
          }

          it("can write") {
            self.defaults.setEnum(Value.Pi, forKey: Foo.Bar.rawValue)
            expect(self.defaults.floatForKey(Foo.Bar.rawValue)) == Value.Pi.rawValue
          }
        }

        context("and the key is another enum") {
          it("can read") {
            self.defaults.setFloat(Value.Pi.rawValue, forKey: Foo.Bar)
            expect(self.defaults.enumForKey(Foo.Bar) as Value!) == Value.Pi
          }

          it("can read wrong values") {
            self.defaults.setFloat(0.00001, forKey: Foo.Bar)
            let actual: Value? = self.defaults.enumForKey(Foo.Bar)
            expect(actual).to(beNil())
          }

          it("can write") {
            self.defaults.setEnum(Value.Pi, forKey: Foo.Bar)
            expect(self.defaults.floatForKey(Foo.Bar)) == Value.Pi.rawValue
          }
        }
      }
    }
  }
}
