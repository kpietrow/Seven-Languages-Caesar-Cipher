/** Kevin Pietrow */

object caesar {
	def encrypt(input2:String, num: Int) = {
		var input = input2.toUpperCase();
		
		var temp = "";
		
		var i = 0;
	
		for( i <- 0 until (input.length) ) {
			if (input(i).toInt == 32) {
				temp = temp + ((32).toChar).toString;
			}
		
			else if((input(i).toInt + num) > 90) {
				temp = temp + ((64 + (input(i).toInt + num - 90)).toChar).toString;
			}
			
			else {
				temp = temp + ((input(i).toInt + num).toChar).toString;
			}
		}
		println(temp);
	}

	def decrypt(input2:String, num: Int) = {
		var input = input2.toUpperCase();
		
		var temp = "";
		
		var i = 0;
		for( i <- 0 until (input.length) ) {
			if (input(i).toInt == 32) {
				temp = temp + ((32).toChar).toString;
			}
			
			else if((input(i).toInt - num) < 65) {
				temp = temp + ((91 - (65 - (input(i).toInt - num))).toChar).toString;
			}
			
			else {
				temp = temp + ((input(i).toInt - num).toChar).toString;
			}
		}
		
		println(temp);
	} 
	
	def solve(input:String, num: Int) {
			for( i <- (num) to 0 by -1) {
				decrypt(input, i);
			}
		
	}
		


		def main(args: Array[String]) {
			println("Encrypt: with \"Scala time\" as the string, and 17 as the shift.");
			encrypt("Scala Time", 17);
			println("\nDecrypt: with \"Get to THE Chopper\" as the string, and 6 as the shift.");
			decrypt("Get to THE Chopper", 6);
			println("\nSolve: with \"ScaLA in the house JA\" as the string, and the max shift as 26.");
			solve("ScaLA in the house JA", 26);
		}
}
