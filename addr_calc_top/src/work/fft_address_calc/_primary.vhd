library verilog;
use verilog.vl_types.all;
entity fft_address_calc is
    port(
        offset          : in     vl_logic_vector(31 downto 0);
        filesize        : in     vl_logic_vector(31 downto 0);
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        addr            : out    vl_logic_vector(31 downto 0);
        done            : out    vl_logic
    );
end fft_address_calc;
