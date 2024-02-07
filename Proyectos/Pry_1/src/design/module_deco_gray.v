module top # (

    parameter WIDTH = 4,
    parameter REFRESH = 13500000,
    parameter DISPLAY_REFRESH = 27000000
)(
    
    input                 clk_i,
    input                 rst_i,
    input [WIDTH - 1 : 0] codigo_bin_i,

    output wire [1 : 0]    anodo,
    output wire [6 : 0]    catodo,              
    output [WIDTH - 1 : 0] codigo_gray_led

);
    integer i; 

    localparam WIDTH_COUNTER         = $clog2(REFRESH);
    localparam WIDTH_DISPLAY_COUNTER = $clog2(DISPLAY_REFRESH);

    reg [WIDTH - 1 : 0]                 codigo_bin_sync_r;
    reg [WIDTH - 1 : 0]                 codigo_gray_o;
    reg [WIDTH_COUNTER - 1 : 0]         cuenta;
    reg [WIDTH_DISPLAY_COUNTER - 1 : 0] cuenta_display;

    reg en_lectura;
    reg en_conmutador;
    reg [1 : 0] decena_unidad;

    wire [7 : 0] bcd;

    //Contador de tasa de refresco de entrada
    always @ (posedge clk_i) begin
        
        if(!rst_i) begin
        
            cuenta <= REFRESH - 1;
        end

        else begin 

            if(cuenta == '0) begin
                
                cuenta <= REFRESH - 1;
            end

            else begin

                cuenta <= cuenta - 1'b1;
            end
        end
    end

    assign en_lectura = ~&(cuenta);

    //Contador de tasa de refresco de salida
    always @ (posedge clk_i) begin
        
        if(!rst_i) begin
        
            cuenta_display <= DISPLAY_REFRESH - 1;
        end

        else begin 

            if(cuenta_display == '0) begin
                
                cuenta_display <= DISPLAY_REFRESH - 1;
            end

            else begin

                cuenta_display <= cuenta_display - 1'b1;
            end
        end
    end

    assign en_conmutador = ~&(cuenta_display);

    //Syncronizador
    always @(posedge clk_i) begin

        if(!rst_i) begin
        
            codigo_bin_sync_r <= '0;
        end

        else begin 

            if(en_lectura) begin

                codigo_bin_sync_r <= codigo_bin_i;
            end

            else begin
                
                codigo_bin_sync_r <= codigo_bin_sync_r;
            end
        end  
    end

    //Decodificador de gray
    always @(codigo_bin_sync_r) begin
        
        codigo_gray_o = '0;

        case(codigo_bin_sync_r) 

            4'b0000: codigo_gray_o = 4'b0000; //0
            4'b0001: codigo_gray_o = 4'b0001; //1
            4'b0010: codigo_gray_o = 4'b0011; //2
            4'b0011: codigo_gray_o = 4'b0010; //3
            4'b0100: codigo_gray_o = 4'b0110; //4
            4'b0101: codigo_gray_o = 4'b0111; //5
            4'b0110: codigo_gray_o = 4'b0101; //6
            4'b0111: codigo_gray_o = 4'b0100; //7
            4'b1000: codigo_gray_o = 4'b1100; //8
            4'b1001: codigo_gray_o = 4'b1101; //9
            4'b1010: codigo_gray_o = 4'b1111; //10
            4'b1011: codigo_gray_o = 4'b1110; //11
            4'b1100: codigo_gray_o = 4'b1010; //12
            4'b1101: codigo_gray_o = 4'b1011; //13
            4'b1110: codigo_gray_o = 4'b1001; //14
            4'b1111: codigo_gray_o = 4'b1000; //15
            
            default: codigo_gray_o = 4'b0000;

        endcase
    end

    assign codigo_gray_led = ~codigo_gray_o;

    //Contador de 2 bit
    always @ (posedge clk_i) begin
        
        if(!rst_i) begin
        
            decena_unidad <= '0;
        end

        else begin 

            if(en_conmutador == 1'b1) begin
                
                decena_unidad <= decena_unidad + 1'b1;
            end

            else begin

                decena_unidad <= decena_unidad;
            end
        end
    end

    
    // Binario a BCD

    always @ (codigo_bin_sync_r) begin

        bcd[3 : 0] = codigo_bin_sync_r;
        bcd[7 : 4] = codigo_bin_sync_r + 1;
     
    end

    wire [3 : 0] digito_o;

    //Logica de mostrar unidades y decenas
    always @(decena_unidad) begin

        digito_o = '0;
        anodo = 2'b11;
        
        case(decena_unidad) 
            
            2'b00 : begin
                
                anodo = 2'b10;
                digito_o = bcd [3 : 0];
            end

            2'b01 : begin
                
                anodo = 2'b11;
                digito_o = bcd [7 : 4]; 
            end

            2'b10 : begin
                
                anodo = 2'b01;
                digito_o = bcd [7 : 4];
            end

            2'b11 : begin
                
                anodo = 2'b11;
                digito_o = bcd [3 : 0];
            end

            default: begin
                
                anodo = 2'b11;
                digito_o = '0;
            end
        endcase
    end

    //BCD a 7 segmentos
    always @ (digito_o) begin

        catodo = 7'b1111111;
            
        case(digito_o)

                4'd0: catodo = 7'b1000000;
                4'd1: catodo = 7'b1111001;
                4'd2: catodo = 7'b0100100;
                4'd3: catodo = 7'b0110000;
                4'd4: catodo = 7'b0011001;
                4'd5: catodo = 7'b0010010;
                4'd6: catodo = 7'b0000010;
                4'd7: catodo = 7'b1111000;
                4'd8: catodo = 7'b0000000;
                4'd9: catodo = 7'b0010000;
                default: catodo = 7'b1111111;

        endcase
    end
    
endmodule