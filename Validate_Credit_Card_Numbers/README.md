Program created during the "Introduction to Functional Programming - edX" course.

The purpose of this simple program, is to validate the credit card number.

The algorithm follows these steps:
1. Double the value of every second digit beginning with the rightmost.
2. Add the digits of the doubled values and the undoubled digits from the original number.
3. Calculate the modulus of the sum divided by 10.
4. If the result equals 0, then the number is valid.

Here is an example of the results of each step on the number 4012888888881881.
1. In order to start with the rightmost digit, we produce a reversed list of digits. Then, we double every second digit. Result: [1,16,8,2,8,16,8,16,8,16,8,16,2,2,0,8].
2. We sum all of the digits of the resulting list above. Note that we must again split the elements of the list into their digits (e.g. 16 becomes [1, 6]). Result: 90.
3. Finally, we calculate the modulus of 90 over 10. Result: 0.
