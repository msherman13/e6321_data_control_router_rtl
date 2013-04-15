library verilog;
use verilog.vl_types.all;
entity adder32b is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        s               : out    vl_logic_vector(31 downto 0)
    );
end adder32b;
