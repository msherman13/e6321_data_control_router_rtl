library verilog;
use verilog.vl_types.all;
entity AFHCINX2TS is
    port(
        S               : out    vl_logic;
        CO              : out    vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic;
        CIN             : in     vl_logic
    );
end AFHCINX2TS;