import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";

actor{
    public func average_array(array : [Int]) : async Int {
        
        var sum : Int = 0;

        for (elem in array.vals()){
            sum := sum+elem;
        };
        
        return sum;
    };

    public func count_character(t : Text, c : Char) : async Nat {
        var count : Nat = 0;
        for (char in t.chars()){
            if(char == c){
                count := count+1;
            }
        };
        return count;
    };

    public func factorial(n : Nat) : async Nat {
        var fac : Nat = 1;
        let i = Iter.range(1,n);

        for(num in i){
            fac := fac * num;
        };

        return fac;
    };

    public func number_of_words(t : Text) : async Nat {
        type Pattern = Text.Pattern;
        var count : Nat = 0;
        let p : Pattern = #char(' ');
        var it : Iter.Iter<Text> = Text.split(t, p);
        for(elem in it)
        {
            count := count + 1;
        };
        return count;
    };

    public func find_duplicates(a : [Nat]) : async [Nat] {
        let arraySize : Nat = a.size();
        var returnArr : [Nat] = [];
        let iterF = Iter.range(0,arraySize-1);
        
        for(numF in iterF)
        {
          var iterS = Iter.range(numF, arraySize);
          for(numS in iterS)
          {
            if(a[numF] == a[numS]){
              returnArr := Array.append<Nat>(returnArr, [a[numF]]);
            }
          };
        };

        return returnArr;
    };  

  public func convert_to_binary(n : Nat) : async Text
  {
    var tmpF : Nat = 0;
    var tmpS : Nat = n;
    var returnText : Text = "";

    while (tmpS > 0)
    {
        tmpF := tmpS % 2;
        returnText := Nat.toText(tmpF) # returnText;
        tmpS := tmpS / 2;
    };

    return returnText;
  };

}

