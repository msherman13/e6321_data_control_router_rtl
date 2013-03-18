library verilog;
use verilog.vl_types.all;
entity counter1_4 is
    port(
        filesize        : in     vl_logic_vector(31 downto 0);
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        count           : out    vl_logic_vector(31 downto 0);
        done            : out    vl_logic
    );
end counter1_4;
