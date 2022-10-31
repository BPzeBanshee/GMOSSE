/// @description scr_encrypt(str,key)
/// @param str
/// @param key
function scr_encrypt(argument0, argument1) {
	/*
	rc4_encrypt_b64

	based off the rc4 script by xot
	with modifications for GMS use by NailBuster
	*/
	var str,key,out,len,strlen,i,S,j,temp,pos,t,pad,b64,bin,tab;


	str = argument0;
	key = argument1;

	strlen = string_length(str);
	for (i=0; i<strlen; i+=1) out[i] = 0;

	len = string_length(key);
	for (i=0; i<256; i+=1) S[i] = i;
	j = 0;
	for (i=0; i<256; i+=1) 
	    {
	    j = (j + S[i] + ord(string_char_at(key,(i mod len)+1))) mod 256;
	    temp = S[i];
	    S[i] = S[j];
	    S[j] = temp;
	    }
	i = 0;
	j = 0;
	for (pos=0; pos<string_length(str); pos+=1) 
	    {
	    i = (i + 1) mod 256;
	    j = (j + S[i]) mod 256;
	    temp = S[i];
	    S[i] = S[j];
	    S[j] = temp;
	    t = (S[i] + S[j]) mod 256;
	    out[pos] = (ord(string_char_at(str,pos+1)) ^ S[t]);
	    }

	//encode array of bytes to result str.
	len = strlen;
	tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
	pad = "";
	b64 = "";
	for (i=0;i<len;i+=3) 
	    {
	    bin[0] = out[i];
	    if (i+1)< len bin[1]=out[i+1]; else bin[1]=0;
	    if (i+2)< len bin[2] = out[i+2]; else bin[2]=0;
    
	    b64 += string_char_at(tab,1+(bin[0]>>2));
	    b64 += string_char_at(tab,1+(((bin[0]&3)<<4)|(bin[1]>>4)));
	    if (i+1)< len 
	        { 
	        bin[1]=out[i+1];
	        b64 += string_char_at(tab,1+(((bin[1]&15)<<2)|(bin[2]>>6)));
	        } 
	    else pad +="=";
	    if (i+2)< len 
	        { 
	        bin[2] = out[i+2];
	        b64 += string_char_at(tab,1+(bin[2]&63));
	        } 
	    else pad +="=";
	    }
	return b64 + pad;



}
