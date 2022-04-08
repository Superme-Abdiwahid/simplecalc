import CoreFoundation
import Darwin
print("Welcome to the UW Calculator Playground")

func factorial(number: Int) -> Int {
    if(number == 0){
        return 1;
    }
    return number * factorial(number: number - 1);
    
}

func calculate(_ args: [String]) -> Int {
    var count = 0;
    if(args.count == 0) {
        return 0;
        
    }else{
    var result: Array<Substring> = []
    for i in 0...args.count - 1{
        let split = args[i].split(separator: " ")
        result.append(split[0])
        var none = Int(split[0])
        if(none != nil){
            none = Int(split[0]);
        }
        
    }
    if(result.count == 3){
        let number1 = Int(result[0]);
        let number2 = Int(result[2]);
        if(result[1].starts(with: "+")){
            count = number1! + number2!;
        }else if(result[1].starts(with: "-")){
            count = number1! - number2!;
        }else if(result[1].starts(with: "*")){
            count = number1! * number2!;
        }else if(result[1].starts(with: "%")){
            count = number1! % number2!;
        }else{
            count = number1! / number2!
        }
        
    }else{
        let type = result[result.count - 1];
        if(type.starts(with: "fact")){
            let value = Int(result[0])
            if(value != nil){
            count = factorial(number: value!)
            }else{
                count = 0;
            }
        }else if(type.starts(with: "count")){
            count = result.count - 1;
        }else if(type.starts(with: "avg")){
            var total = 0;
            var sum = 0;
            var yes: Bool = false;
            if(result.count == 1) {return 0}
            for i in 0...result.count - 2{
                let print = Int(result[i]);
                if(print != nil){
                    sum += print!
                    total += 1;
                    yes = true;
                }
            }
            if(yes){
                count = sum / total;
            }
        }
    }
    }
    return count;
}

func calculate(_ arg: String) -> Int {
    if(arg.count == 0){
        return 0;
    }
    let Split = arg.split(separator: " ")
    var result = 0;
    if(Split.count == 3){
        let first = Int(Split[0]);
        let secondDigit = Int(Split[2]);
        let  operation = Split[1];
        if(operation.starts(with: "+")){
            result = first! + secondDigit!;
        }else if(operation.starts(with: "-")){
            result = first! - secondDigit!;
        }else if(operation.starts(with: "*")){
            result = first! * secondDigit!;
        }else if(operation.starts(with: "%")){
            result = first! % secondDigit!;
        }else{
            result = first! / secondDigit!
        }
        
    }else if(Split[Split.count - 1].starts(with: "count")){
        result = Split.count - 1;
    }else if(Split[Split.count - 1].starts(with: "fact")){
        let num = Int(Split[0])
        result = factorial(number: num!)
    }else if(Split[Split.count - 1].starts(with: "avg")){
        var total = 0;
        var sum = 0;
        var yes: Bool = false;
        if(Split.count == 1) {return 0}
        for i in 0...Split.count - 2{
            let print = Int(Split[i]);
            if(print != nil){
                sum += print!
                total += 1;
                yes = true;
            }
        }
        if(yes){
            result = sum / total;
        }
    }
    return result;
}


/* ABDIWAHID'S TEST CASES */

calculate(["100", "*", "200"]) == 20000

calculate(["100", "/", "10"]) == 10


calculate(["-200", "/", "5"]) == -40


calculate(["0", "-", "0"]) == 0

calculate(["20", "-", "70"]) == -50

calculate([]) == 0  // testing on an empty array

calculate(["-999999999", "+", "999999999"]) == 0 // testing with interg max and integer min value


calculate("") == 0 // testing on an empty string


//**************************************
// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

 
// Implement calculate([String]) and calculate(String)
// to use floating-point values

func calculate(_ args: [String]) -> Double {
    var count = 0.0;
    var result: Array<Substring> = []
    for i in 0...args.count - 1{
        let split = args[i].split(separator: " ")
        result.append(split[0])
        var none = Int(split[0])
        if(none != nil){
            none = Int(split[0]);
        }
        
    }
    if(result.count == 3){
        let number1 = Double(result[0]);
        let number2 = Double(result[2]);
        if(number1 != nil && number2 != nil){
        if(result[1].starts(with: "+")){
            count = number1! + number2!;
        }else if(result[1].starts(with: "-")){
            count = number1! - number2!;
        }else if(result[1].starts(with: "*")){
            count = number1! * number2!;
        }else if(result[1].starts(with: "%")){
           // count = number1! % number2!;
        }else{
           count = number1! / number2!
        }
        }
        
    }
    return count;
}
func calculate(_ arg: String) -> Double {
    var result = 0;
    let Split = arg.split(separator: " ");
    if(Split[Split.count - 1].starts(with: "count")){
       result = Split.count - 1;
   }
    return Double(result);
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5.0

