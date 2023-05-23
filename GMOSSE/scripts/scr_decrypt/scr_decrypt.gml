/// @description scr_decrypt(str,key)
/// @param str
/// @param key
function scr_decrypt(str,key) {
	/*
	rc4_decrypt_b64

	based off the rc4 script by xot
	with modifications for GMS use by NailBuster
	*/
	var out,len,strlen,i,S,j,temp,pos,t,pad,b64,bin,tab,outsize;

	//base64_decode string to array of bytes for decryption
	strlen = string_length(str);
	for (i=0; i<strlen; i+=1) out[i] = 0;
	outsize=0;

	b64 = str;
	len = string_length(b64);
	pad = "=";
	tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
	str = "";
	while (string_length(b64) mod 4) b64 += pad;
	for(i=0;i<len;i+=4) 
	    {
	    bin[0] = string_pos(string_char_at(b64,i+1),tab)-1;
	    bin[1] = string_pos(string_char_at(b64,i+2),tab)-1;
	    bin[2] = string_pos(string_char_at(b64,i+3),tab)-1;
	    bin[3] = string_pos(string_char_at(b64,i+4),tab)-1;
	    out[outsize] = (255&(bin[0]<<2)|(bin[1]>>4));
	    outsize +=1;
	    if (bin[2] >= 0) { out[outsize] = (255&(bin[1]<<4)|(bin[2]>>2)); outsize +=1;}
	    if (bin[3] >= 0) { out[outsize] = (255&(bin[2]<<6)|(bin[3])); outsize +=1;}
	    }

	var outst="";
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
	for (pos=0; pos<outsize; pos+=1) 
	    {
	    i = (i + 1) mod 256;
	    j = (j + S[i]) mod 256;
	    temp = S[i];
	    S[i] = S[j];
	    S[j] = temp;
	    t = (S[i] + S[j]) mod 256;
	    outst += chr(out[pos] ^ S[t]);
	    }
	return (outst);
}