//================================================ SubBytes
module SubBytes_ny_2 (x, y);

   //------------------------------------------------
   input  [31:0] x;
   output [31:0] y;

   //------------------------------------------------
   wire [31:0] 	s;
   reg [31:0] y_reg;

   //------------------------------------------------
   GF_MULINV_8 u3 (.x(x[31:24]), .y(s[31:24]));
   GF_MULINV_8 u2 (.x(x[23:16]), .y(s[23:16]));
   GF_MULINV_8 u1 (.x(x[15: 8]), .y(s[15: 8]));
   GF_MULINV_8 u0 (.x(x[ 7: 0]), .y(s[ 7: 0]));
 
   // assign y = {mat_at(s[31:24]), mat_at(s[23:16]), 
	//        mat_at(s[15: 8]), mat_at(s[ 7: 0])};


   assign y[24+1] = ((~s[24+7] ^ s[24+6] ^ ~s[24+5] ^ s[24+1] ^ s[24+0])) ;
   assign y[24+0] = ((s[24+7] ^ ~s[24+6] ^ s[24+5] ^ s[24+4] ^ ~s[24+0])) ;
   assign y[24+2] = (  s[24+7] ^ s[24+6] ^ s[24+2] ^ ~s[24+1] ^ s[24+0] ) ;
   assign y[24+3] = (  ~s[24+7] ^ s[24+3] ^ s[24+2] ^ s[24+1] ^ s[24+0] ) ;
   assign y[24+4] = (  ~s[24+4] ^ s[24+3] ^ s[24+2] ^ s[24+1] ^ s[24+0] ) ;
   assign y[24+5] = ((~s[24+5] ^ ~s[24+4] ^ ~s[24+3] ^ ~s[24+2] ^ s[24+1])) ;
   assign y[24+6] = ((s[24+6] ^ ~s[24+5] ^ s[24+4] ^ s[24+3] ^ ~s[24+2])) ;
   assign y[24+7] = (  s[24+7] ^ s[24+6] ^ ~s[24+5] ^ s[24+4] ^ s[24+3] ) ;

   assign y[16+0] = (~(s[16+7] ^ ~s[16+6] ^ s[16+5] ^ s[16+4] ^ s[16+0])) ;
   assign y[16+1] = (~(s[16+7] ^ ~s[16+6] ^ s[16+5] ^ s[16+1] ^ s[16+0])) ;
   assign y[16+2] = (  s[16+7] ^ s[16+6] ^ s[16+2] ^ ~s[16+1] ^ s[16+0] ) ;
   assign y[16+3] = (  s[16+7] ^ s[16+3] ^ ~s[16+2] ^ s[16+1] ^ s[16+0] ) ;
   assign y[16+4] = (  s[16+4] ^ s[16+3] ^ s[16+2] ^ s[16+1] ^ ~s[16+0] ) ;
   assign y[16+5] = (~(s[16+5] ^ ~s[16+4] ^ s[16+3] ^ s[16+2] ^ s[16+1])) ;
   assign y[16+6] = (~(s[16+6] ^ s[16+5] ^ ~s[16+4] ^ s[16+3] ^ s[16+2])) ; 
   assign y[16+7] = (  s[16+7] ^ s[16+6] ^ s[16+5] ^ s[16+4] ^ ~s[16+3] ) ;

   assign y[8+0] = (~(s[8+7] ^ s[8+6] ^ ~s[8+5] ^ s[8+4] ^ s[8+0]) )      ;
   assign y[8+1] = ~(~(s[8+7] ^ s[8+6] ^ s[8+5] ^ s[8+1] ^ s[8+0]) )      ;
   assign y[8+2] = ~(  s[8+7] ^ s[8+6] ^ s[8+2] ^ s[8+1] ^ s[8+0]  )      ;
   assign y[8+3] = (  ~s[8+7] ^ s[8+3] ^ s[8+2] ^ s[8+1] ^ s[8+0]  )      ;
   assign y[8+4] = (  s[8+4] ^ s[8+3] ^ ~s[8+2] ^ s[8+1] ^ s[8+0]  )      ;
   assign y[8+5] = (~(s[8+5] ^ s[8+4] ^ ~s[8+3] ^ s[8+2] ^ s[8+1]) )      ;
   assign y[8+6] = (~(s[8+6] ^ s[8+5] ^ ~s[8+4] ^ s[8+3] ^ s[8+2]) )      ;
   assign y[8+7] = (  s[8+7] ^ s[8+6] ^ ~s[8+5] ^ s[8+4] ^ s[8+3]  )      ;

   assign y[0+0] = (~(s[0+7] ^ s[0+6] ^ ~s[0+5] ^ s[0+4] ^ s[0+0]))    ;
   assign y[0+1] = (~(s[0+7] ^ s[0+6] ^ ~s[0+5] ^ s[0+1] ^ s[0+0]))   ;
   assign y[0+2] = (  s[0+7] ^ ~s[0+6] ^ s[0+2] ^ s[0+1] ^ s[0+0] )   ;
   assign y[0+3] = (  s[0+7] ^ ~s[0+3] ^ s[0+2] ^ s[0+1] ^ s[0+0] )  ;
   assign y[0+4] = (  s[0+4] ^ s[0+3] ^ s[0+2] ^ ~s[0+1] ^ s[0+0] )  ;
   assign y[0+5] = (~(s[0+5] ^ s[0+4] ^ ~s[0+3] ^ s[0+2] ^ s[0+1]))   ;
   assign y[0+6] = (~(s[0+6] ^ ~s[0+5] ^ s[0+4] ^ s[0+3] ^ s[0+2]))  ;
   assign y[0+7] = (  s[0+7] ^ ~s[0+6] ^ s[0+5] ^ s[0+4] ^ s[0+3] )  ;
    
   //------------------------------------------------ Affine matrix
   // function [7:0] mat_at;
   //    input [7:0] x;
   //    begin
	//  mat_at[0] = ~(x[7] ^ x[6] ^ x[5] ^ x[4] ^ x[0]);
	//  mat_at[1] = ~(x[7] ^ x[6] ^ x[5] ^ x[1] ^ x[0]);
	//  mat_at[2] =   x[7] ^ x[6] ^ x[2] ^ x[1] ^ x[0];
	//  mat_at[3] =   x[7] ^ x[3] ^ x[2] ^ x[1] ^ x[0];
	//  mat_at[4] =   x[4] ^ x[3] ^ x[2] ^ x[1] ^ x[0];
	//  mat_at[5] = ~(x[5] ^ x[4] ^ x[3] ^ x[2] ^ x[1]);
	//  mat_at[6] = ~(x[6] ^ x[5] ^ x[4] ^ x[3] ^ x[2]);
	//  mat_at[7] =   x[7] ^ x[6] ^ x[5] ^ x[4] ^ x[3];
   //    end
   // endfunction
endmodule // SubBytes



