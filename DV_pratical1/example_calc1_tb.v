`uselib lib=calc1_black_box

module example_calc1_tb;

	//TO DO:
	// 1. all the arithmatic results correct 
	// 2. input commands invalid (0,1,2,5,6)
	// 3. add/subtract overflow&underflow
	// 4. response code shows correctly
	// 5. the second request gets prohibited before the first one finishes
	// 6. whether the priority works as first come first served
	// 7. given multiple requests at once, no data would be lost
   wire [0:31]   out_data1, out_data2, out_data3, out_data4;
   wire [0:1]    out_resp1, out_resp2, out_resp3, out_resp4;
   
   reg 	         c_clk;
   reg [0:3] 	 req1_cmd_in, req2_cmd_in, req3_cmd_in, req4_cmd_in;
   reg [0:31]    req1_data_in, req2_data_in, req3_data_in, req4_data_in;
   reg [1:7] 	 reset;
   
   test StimulusGenerator(c_clk,req1_cmd_in, req1_data_in, req2_cmd_in, req2_data_in, req3_cmd_in, req3_data_in, req4_cmd_in, req4_data_in, reset);   

	 calc1 DUV(out_data1, out_data2, out_data3, out_data4, out_resp1, out_resp2, out_resp3, out_resp4, c_clk, req1_cmd_in, req1_data_in, req2_cmd_in, req2_data_in, req3_cmd_in, req3_data_in, req4_cmd_in, req4_data_in, reset);
	
	 check Checker(req1_cmd_in, req1_data_in, req2_cmd_in, req2_data_in, req3_cmd_in, req3_data_in, req4_cmd_in, req4_data_in, out_data1, out_data2, out_data3, out_data4, out_resp1, out_resp2, out_resp3, out_resp4, reset);
   
  initial
    begin

	
				
	// TEST 2: 1FF_FFFFh + 1FF_FFFFh =  3FFF_FFFE ?

        #400
	  
        req1_cmd_in = 1;
	req1_data_in = 32'h1FFF_FFFF;
	req2_cmd_in = 0;
	req2_data_in = 0;
	req3_cmd_in = 0;
	req3_data_in = 0;
	req4_cmd_in = 0;
	req4_data_in = 0;

	#200
	
	req1_cmd_in = 0;
	req1_data_in = 32'h1FFF_FFFF;
				
	// TEST 3: 0+0=0 ?

	#400 

        req1_cmd_in = 1;
	req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	req2_cmd_in = 0;
	req2_data_in = 0;
	req3_cmd_in = 0;
	req3_data_in = 0;
	req4_cmd_in = 0;
	req4_data_in = 0;

	#200
	
	req1_cmd_in = 0;
	req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

	#2000 $stop;

     end // initial begin

   

endmodule // example_calc1_tb


   
