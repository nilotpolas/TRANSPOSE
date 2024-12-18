
/*  ******* encrypto ************ */
#include<stdio.h>
#include "aes.h"

void aes_func_call(int statemt1[32]){
	int type=128128;
	int nb=4;
	int i1,i,j;
	int statemt[32];//={50,67,246,168,136,90,48,141,49,49,152,162,224,55,7,52,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

#pragma HLS PIPELINE off
	for(i=0;i<32;i++)
	{
		statemt[i]=statemt1[i];
	}

	int word1[4][120]={43,40,171,9,160,136,35,42,242,122,89,115,61,71,30,109,239,168,182,219,212,124,202,17,109,17,219,202,78,95,132,78,234,181,49,127,172,25,40,87,208,201,225,182,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			,126,174,247,207,250,84,163,108,194,150,53,89,128,22,35,122,68,82,113,11,209,131,242,249,136,11,249,0,84,95,166,166,210,141,43,141,119,250,209,92,20,238,63,99,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			,21,210,21,79,254,44,57,118,149,185,128,246,71,254,126,136,165,91,37,173,198,157,184,21,163,62,134,147,247,201,79,220,115,186,245,41,102,220,41,0,249,37,12,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			22,166,136,60,23,177,57,5,242,67,122,127,125,62,68,59,65,127,59,0,248,135,188,188,122,253,65,253,14,243,178,79,33,210,96,47,243,33,65,110,168,137,200,166,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

	AddRoundKey (statemt, type, 0,word1);  

#pragma HLS PIPELINE off
	for (i = 1; i <= round_val + 9; ++i)
	{
#pragma HLS UNROLL factor=1
		ByteSub_ShiftRow (statemt, nb);	  	 
		MixColumn_AddRoundKey (statemt, nb, i);	  	 
	}


	ByteSub_ShiftRow (statemt, nb);  
	AddRoundKey (statemt, type, i,word1);
#pragma HLS PIPELINE off
	for(i=0;i<32;i++)
	{
		statemt1[i]=statemt[i];
	}
}

int
encrypt (int statemt[32], int key[32], int type)
{
	int i;
	/*
+--------------------------------------------------------------------------+
| * Test Vector (added for CHStone)                                        |
|     out_enc_statemt : expected output data for "encrypt"                 |
+--------------------------------------------------------------------------+
	 */
	const int out_enc_statemt[16] =
	{ 0x39, 0x25, 0x84, 0x1d, 0x2, 0xdc, 0x9, 0xfb, 0xdc, 0x11, 0x85, 0x97,
			0x19, 0x6a, 0xb, 0x32
	};

	int i1;
	KeySchedule (type, key);
	switch (type)
	{
	case 128128:
		round_val = 0;
		nb = 4;
		break;
	case 192128:
		round_val = 2;
		nb = 4;
		break;
	case 256128:
		round_val = 4;
		nb = 4;
		break;
	case 128192:
	case 192192:
		round_val = 2;
		nb = 6;
		break;
	case 256192:
		round_val = 4;
		nb = 6;
		break;
	case 128256:
	case 192256:
	case 256256:
		round_val = 4;
		nb = 8;
		break;
	}
	aes_func_call(statemt);


	printf ("Encrypted message:  ");
#pragma HLS PIPELINE off
	for (i = 0; i < nb * 4; ++i)
	{
		if (statemt[i] < 16)
			printf ("0");
		printf ("%x", statemt[i]);
	}


	int main_result;
#pragma HLS PIPELINE off
	for (i = 0; i < 16; i++)
	{
		main_result += (statemt[i] != out_enc_statemt[i]);
	}

	return 0;
}
