library verilog;
use verilog.vl_types.all;
entity data_bus_controller is
    port(
        data_bus        : inout  vl_logic_vector(31 downto 0);
        fft_data_in     : in     vl_logic_vector(31 downto 0);
        fir_data_in     : in     vl_logic_vector(31 downto 0);
        iir_data_in     : in     vl_logic_vector(31 downto 0);
        fft_data_out    : out    vl_logic_vector(31 downto 0);
        fir_data_out    : out    vl_logic_vector(31 downto 0);
        iir_data_out    : out    vl_logic_vector(31 downto 0);
        to_fft_empty    : in     vl_logic;
        to_fft_full     : in     vl_logic;
        from_fft_empty  : in     vl_logic;
        from_fft_full   : in     vl_logic;
        to_fir_empty    : in     vl_logic;
        to_fir_full     : in     vl_logic;
        from_fir_empty  : in     vl_logic;
        from_fir_full   : in     vl_logic;
        to_iir_empty    : in     vl_logic;
        to_iir_full     : in     vl_logic;
        from_iir_empty  : in     vl_logic;
        from_iir_full   : in     vl_logic;
        data_to_fft     : out    vl_logic;
        data_from_fft   : out    vl_logic;
        data_to_fir     : out    vl_logic;
        data_from_fir   : out    vl_logic;
        data_to_iir     : out    vl_logic;
        data_from_iir   : out    vl_logic;
        fft_enable      : in     vl_logic;
        fir_enable      : in     vl_logic;
        iir_enable      : in     vl_logic;
        clk             : in     vl_logic
    );
end data_bus_controller;
