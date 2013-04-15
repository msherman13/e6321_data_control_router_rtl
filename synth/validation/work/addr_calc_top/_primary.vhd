library verilog;
use verilog.vl_types.all;
entity addr_calc_top is
    port(
        offset          : in     vl_logic_vector(31 downto 0);
        filesize        : in     vl_logic_vector(31 downto 0);
        fft_enable      : in     vl_logic;
        fir_enable      : in     vl_logic;
        iir_enable      : in     vl_logic;
        fft_read_pause  : in     vl_logic;
        fir_read_pause  : in     vl_logic;
        iir_read_pause  : in     vl_logic;
        fft_write_pause : in     vl_logic;
        fir_write_pause : in     vl_logic;
        iir_write_pause : in     vl_logic;
        clk             : in     vl_logic;
        addr            : out    vl_logic_vector(31 downto 0);
        fft_read_done   : out    vl_logic;
        fft_write_done  : out    vl_logic;
        fir_read_done   : out    vl_logic;
        fir_write_done  : out    vl_logic;
        iir_read_done   : out    vl_logic;
        iir_write_done  : out    vl_logic
    );
end addr_calc_top;
