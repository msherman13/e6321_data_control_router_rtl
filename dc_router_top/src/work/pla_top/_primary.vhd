library verilog;
use verilog.vl_types.all;
entity pla_top is
    port(
        instruction     : in     vl_logic_vector(31 downto 0);
        fft_read_done   : in     vl_logic;
        fft_write_done  : in     vl_logic;
        fir_read_done   : in     vl_logic;
        fir_write_done  : in     vl_logic;
        iir_read_done   : in     vl_logic;
        iir_write_done  : in     vl_logic;
        fft_enable      : out    vl_logic;
        fir_enable      : out    vl_logic;
        iir_enable      : out    vl_logic;
        acc_done        : out    vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end pla_top;
