library verilog;
use verilog.vl_types.all;
entity shifter2b is
    port(
        \in\            : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end shifter2b;
