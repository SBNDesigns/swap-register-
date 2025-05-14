module reg_file
    #(parameter ADDR_WIDTH = 7, DATA_WIDTH = 8)(
    input clk,
    input we,
    input [ADDR_WIDTH - 1: 0] address_w, address_r,
    input [DATA_WIDTH - 1: 0] data_w,
    output [DATA_WIDTH - 1: 0] data_r    
    );
    
    reg [DATA_WIDTH - 1: 0] memory [0: 2 ** ADDR_WIDTH - 1];
    
    always @(posedge clk)
    begin
        // Synchronous write port
        if (we)
            memory[address_w] <= data_w;                              
    end
    
    // Asynchronous read port
    assign data_r = memory[address_r];

endmodule