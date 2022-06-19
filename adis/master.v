/*                      MASTER SPI

    The master in SPI protocol has four wires, the slave 
    selection wire, clock wire, MISO wire, and MOSI wire.

    Input : Slave select ( here cs ),
            MOSI ( here mosi ),
            clock ( here clk ),
            address passed through MOSI ( here add )
    Output: MISO ( here miso ),
            data output ( here data )

    The finite state machine corresponding to SPI 
    communication has four states after selection of slave:
    ~ Sending R/W bit through MOSI to slave
    ~ Sending the address through MOSI
    ~ Zero padding
*/


`include "shift_register_sipo.v"
`include "shift_register_piso.v"


module master(input [15:0]add, input clk, input cs, input MISO,
              output reg MOSI, output reg [15:0]data);
    // inout or different input and output??
    reg state = 2'b00;
    reg si, on;
    wire [15:0]po;
    shift_register_sipo MISO_reg(clk, si, po);
    shift_register_piso MOSI_reg(clk, on, add, so);
    always@(clk)
        if(~cs)
            if(clk)
                case (state)
                00: begin
                        MOSI = 1'b1;    // assuming 1 is read
                        state = 2'b01;
                        #2 on = 1;
                    end
                01: begin
                        MOSI = so;
                    end
                /*10: begin
                        MOSI = 1'b0;
                        if(address)
                            state = 2'b01;
                      end*/
                endcase
            else 
            begin
                si = MISO;
                data = po;
            end
endmodule
