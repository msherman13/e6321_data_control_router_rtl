library verilog;
use verilog.vl_types.all;
entity CMPR32X4TS is
    port(
        S               : out    vl_logic;
        CO              : out    vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic;
        C               : in     vl_logic
    );
end CMPR32X4TS;
