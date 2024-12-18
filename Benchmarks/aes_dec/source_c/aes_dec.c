#include<stdio.h>
#include "aes.h"


void aes_decrypt_call(int statemt1[32]){
	int i;
	int type=128128;
	int nb=4;
	int round_val=10;

	for(i=0;i<32;i++)
  {
      #pragma hls pipeline off

			statemt[i]=statemt1[i];
  }

	int word1[4][120]={43,40,171,9,160,136,35,42,242,122,89,115,61,71,30,109,239,168,182,219,212,124,202,17,109,17,219,202,78,95,132,78,234,181,49,127,172,25,40,87,208,201,225,182,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		,126,174,247,207,250,84,163,108,194,150,53,89,128,22,35,122,68,82,113,11,209,131,242,249,136,11,249,0,84,95,166,166,210,141,43,141,119,250,209,92,20,238,63,99,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		,21,210,21,79,254,44,57,118,149,185,128,246,71,254,126,136,165,91,37,173,198,157,184,21,163,62,134,147,247,201,79,220,115,186,245,41,102,220,41,0,249,37,12,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		22,166,136,60,23,177,57,5,242,67,122,127,125,62,68,59,65,127,59,0,248,135,188,188,122,253,65,253,14,243,178,79,33,210,96,47,243,33,65,110,168,137,200,166,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

	AddRoundKey (statemt, type, round_val, word);
	InversShiftRow_ByteSub (statemt, nb);
	for (i = round_val - 1; i >= 1; --i)
		{

      #pragma hls pipeline off

		  AddRoundKey_InversMixColumn (statemt, nb, i,word);
		  InversShiftRow_ByteSub (statemt, nb);
		}
	AddRoundKey (statemt, type, 0, word);
	for(i=0;i<32;i++)
  {
    #pragma hls pipeline off

		statemt1[i]=statemt[i];
  }
}

int
decrypt (int statemt[32], int key[32], int type)
{
  
/*
+--------------------------------------------------------------------------+
| * Test Vector (added for CHStone)                                        |
|     out_enc_statemt : expected output data for "decrypt"                 |
+--------------------------------------------------------------------------+
*/
  const int out_dec_statemt[16] =
    { 0x32, 0x43, 0xf6, 0xa8, 0x88, 0x5a, 0x30, 0x8d, 0x31, 0x31, 0x98, 0xa2,
    0xe0, 0x37, 0x7, 0x34
  };
  KeySchedule (type, key);

  switch (type)
    {
    case 128128:
      round_val = 10;
      nb = 4;
      break;
    case 128192:
    case 192192:
      round_val = 12;
      nb = 6;
      break;
    case 192128:
      round_val = 12;
      nb = 4;
      break;
    case 128256:
    case 192256:
      round_val = 14;
      nb = 8;
      break;
    case 256128:
      round_val = 14;
      nb = 4;
      break;
    case 256192:
      round_val = 14;
      nb = 6;
      break;
    case 256256:
      round_val = 14;
      nb = 8;
      break;
    }

	aes_decrypt_call(statemt);

  int main_result=0;
  int i;
  for (i = 0; i < 16; i++)
  {
    #pragma hls pipeline off
    
    main_result += (statemt[i] != out_dec_statemt[i]);
  }

  return 0;
}
