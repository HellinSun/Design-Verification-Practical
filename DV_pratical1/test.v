module test(c_clk,req1_cmd_in,req1_data_in,req2_cmd_in,req2_data_in,req3_cmd_in,req3_data_in,req4_cmd_in,req4_data_in, reset);

  output [0:3] 	 req1_cmd_in, req2_cmd_in, req3_cmd_in, req4_cmd_in;
  output [0:31]    req1_data_in, req2_data_in, req3_data_in, req4_data_in;
  output reg 	         c_clk;
  output reg [1:7] 	 reset;

  initial begin
    req1_cmd_in = 0;
    req1_data_in = 0;
    req2_cmd_in = 0;
    req2_data_in = 0;
    req3_cmd_in = 0;
    req3_data_in = 0;
    req4_data_in = 0;
  end

  always #100 c_clk = ~c_clk;
  
  initial begin 
    // First drive reset. Driving bit 1 is enough to reset the design.
    reset[1] = 1;
    #800 
    reset[1] = 0;

    // TEST 1: 1h + 1FF_FFFFh = 200_0000 ?

    #400
    req1_cmd_in = 1;
    req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
    req2_cmd_in = 0;
    req2_data_in = 0;
    req3_cmd_in = 0;
    req3_data_in = 0;
    req4_cmd_in = 0;
    req4_data_in = 0;

    #200
    
    req1_cmd_in = 0;
    req1_data_in = 32'b0001_1111_1111_1111_1111_1111_1111_1111;
    
    //Test 2: 
    #400
    req1_cmd_in = 1;
    req1_data_in = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
    req2_cmd_in = 0;
    req2_data_in = 0;
    req3_cmd_in = 0;
    req3_data_in = 0;
    req4_cmd_in = 0;
    req4_data_in = 0;

    #200
    
    req1_cmd_in = 0;
    req1_data_in = 32'b1111_1111_1111_1111_1111_1111_1111_1111;

    //Test 3:
    #400
    req1_cmd_in = 1;
    req1_data_in = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
    req2_cmd_in = 0;
    req2_data_in = 0;
    req3_cmd_in = 0;
    req3_data_in = 0;
    req4_cmd_in = 0;
    req4_data_in = 0;

    #200
    
    req1_cmd_in = 0;
    req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
  
    //Test 4:

  end

endmodule