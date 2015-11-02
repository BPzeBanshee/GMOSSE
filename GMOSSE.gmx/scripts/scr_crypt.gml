/*
**********************************************
************File Encryption System************
**********Written by: Kevin Haroldsen*********
**********************************************
********A bit speed-improvement by Drara******
**********************************************

Use this to encrypt/decrypt a file using XOR encryption. 
It can be used to prevent editing of save files, or for other things.


Arguments:

The First Argument is the file you want to encrypt. Use a full path. 
Make sure it is a string.

The Second Argument is the encryption key. It must be a string.
It can be as long as you want. Longer is more secure.

The Third Argument is the strongnest of the encryption.
The value should be between 0 and 10;
0 means the best encryption, 10 the fastest solution.

A higher number means that at the encryption bytes are skipped.
How often the bytes are skipped is dependent from the size of the file.



How it works:
The script generates a key based on the key you provide and the game id.
It then goes through the file and encrypts each byte using xor encryption,
rotating through the key. By rotating through the key, two identical letters next
to each other will not be look the same when encrypted. Sometimes the file is encrypted
enough that it is interpreted as Japanese in notepad- seeing it as Unicode.


How XOR encryption works:

XOR is a logic gate. The are 8 logic gates-AND,OR,XOR,YES,NAND,NOR,NXOR,and NOT.

When you enter values into a logic gate, it returns a value. All return either 0 or 1.
0 or 1 can mean No or Yes, False or True, or some others.

XOR generally allows you to input two values. If those values are the same, it will output 0.
Otherwise it will output 1.

Here is a truth table for XOR:
 ____________________
|Input1|Input2|Output|
|______|______|______|
|   0  |   0  |   0  |
|______|______|______|
|   1  |   0  |   1  |
|______|______|______|
|   0  |   1  |   1  |
|______|______|______|
|   1  |   1  |   0  |
|______|______|______|

This is simple boolean XOR.

Binary XOR uses boolean XOR to edit its values. With binary xor, it's almost like it's an operand like 
addition or multiplication.

First of all, binary is a base 2 number system only using 0 and 1. It is what computers use.
Counting from 0 from 5 is 
0
1
10
11
100
101
This is the binary system. With computers, a bit is a 0 or a 1. a byte is a group of 8 bits.

Binary XOR edits a whole byte of data.
The number 106 is 01101010
The number 203 is 11001011

So... 106 xor 203 is:

	0   1   1   0   1   0   1   0
	|   |   |   |   |   |   |   |
   \|/ \|/ \|/ \|/ \|/ \|/ \|/ \|/ 
xor 1   1   0   0   1   0   1   1
	-------------------------------
	1   0   1   0   0   0   0   1
	
10100001 is 161.
So, 106 xor 203 is 161.

Each letter or number in a text file is a byte. For example, the letter Q is 1010001.
So if you xor 1010001 (Q)  with 1001011 (K), you get 11010, which is a right arrow mark.
Now if you xor 11010 with 1001011 (K), you get 1010001, which is Q. So, you can encrypt and decrypt with a key.
	



NOTE:
Files encrypted with this will only be correctly decrypted with the same game- or at least with the 
same game id.

Written January 6th 2010
*/

//define all variables
var file,read,gmid,key,keypos,keylength,keys,filesize,
epos,rate;

if !file_exists(argument0) then return (-1);

//define all variables.
keypos = 0;
gmid = string(game_id);
key = "";
read = 0;
file = 0;
epos = 0;
rate = min(argument2,10);
rate = max(rate,0);

repeat 5
    {
	   gmid += gmid;//repeat the game id 5 times for a long key.
    }

//Generate an long key using the game_id and the key given. done by XORing the key and the game_id.

epos = 0;

repeat(floor(string_length(string(game_id))*5))
    {

	   keys[epos] = ord(string_copy(gmid,epos,2)) ^ (ord(string_char_at(argument1,keypos))-floor(epos/3));//XOR the key and the game id
	
	   keypos+=1;
	
	   if keypos>string_length(argument1) then keypos=1;
	   epos += 1;
    }

epos -= 1;

keypos = 0;//make sure you are at the beginning of the key.

file = file_bin_open(argument0,2);//open the file, using basic binary functions

file_bin_seek(file,0);//make sure you are at the start of the file

//This is where you actually encrypt the file. Notice the actual encryption is only a few lines long.
filesize = file_bin_size(file);

rate *= filesize/10000;
rate = round(rate);

do
    {
	   read = file_bin_read_byte(file); //read the chosen byte. Doing so will also advance to the next byte.
	   file_bin_seek(file,file_bin_position(file)-1); //go to the byte before, returning to the byte that you just read.
	   file_bin_write_byte(file,read ^ keys[keypos]); //write the encrypted byte where a byte was previously.It will advance to the next byte
	   keypos += 1; //go to the next character in the key to encrypt with.
	   if keypos > epos then keypos = 1;
	   if rate file_bin_seek(file,file_bin_position(file)+rate);   // set the realtive position. that means bytes are skipped 
    }
until(file_bin_position(file) >= filesize);

file_bin_close(file);//close the binary file when finished.

return (1);//returns 1 to confirm it worked.
