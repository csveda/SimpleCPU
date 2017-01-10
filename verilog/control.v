//Control circuit             
`include "verilog/mips_instr_defines.v"

module control
    (
        input   wire[5:0]   instr_op_ctl_i,
        input   wire[5:0]   instr_funct_ctl_i,
        output  wire        reg_dst_ctl_o,
        output  wire        jump_ctl_o,
        output  wire        branch_ctl_o,
        output  wire        mem_read_ctl_o,
        output  wire        mem_to_reg_ctl_o,
        output  wire[5:0]   alu_op_ctl_o,
        output  wire        mem_wr_ctl_o,
        output  wire        alu_src_ctl_o,
        output  wire        reg_wr_ctl_o,
        output  wire        sign_ext_ctl_o
    );

    wire       reg_dst_ctl;
    wire       jump_ctl;
    wire       branch_ctl;
    wire       mem_read_ctl;
    wire       mem_to_reg_ctl;
    wire[5:0]  alu_op_ctl;
    wire       mem_wr_ctl;
    wire       alu_src_ctl;
    wire       reg_wr_ctl;
    wire       sign_ext_ctl;

    reg[14:0]   controls;

    assign  reg_dst_ctl_o        = reg_dst_ctl;
    assign  jump_ctl_o           = jump_ctl;
    assign  branch_ctl_o         = branch_ctl;
    assign  mem_read_ctl_o       = mem_read_ctl;
    assign  mem_to_reg_ctl_o     = mem_to_reg_ctl;
    assign  alu_op_ctl_o         = alu_op_ctl;
    assign  mem_wr_ctl_o         = mem_wr_ctl;
    assign  alu_src_ctl_o        = alu_src_ctl;
    assign  reg_wr_ctl_o         = reg_wr_ctl;
    assign  sign_ext_ctl_o       = sign_ext_ctl;


    assign {reg_dst_ctl, jump_ctl, branch_ctl, mem_read_ctl, mem_to_reg_ctl,
            alu_op_ctl, mem_wr_ctl, alu_src_ctl, reg_wr_ctl, sign_ext_ctl}  = controls;

    always @ *
    begin
      case (instr_op_ctl_i)
        //alu_op_ctl: 
        //6'b000_00_0: ADD 
        //6'b000_00_1: SUB
        //6'b000_01_0: shift left 
        //6'b000_10_0: logical shift right 
        //6'b000_11_0: arithmetic shift right 
        //6'b001_00_0: logical OR
        //6'b010_00_0: logical AND
        //6'b011_00_0: logical NOR
        //6'b100_00_0: logical XOR
        //reg_dst_ctl, jump_ctl, branch_ctl, mem_read_ctl, mem_to_reg_ctl, alu_op_ctl, mem_wr_ctl, alu_src_ctl, reg_wr_ctl, sign_ext
        `ADDI   :   controls = 15'b0_0_0_0_0_000000_0_1_1_1; // I
        `ADDIU  :   controls = 15'b0_0_0_0_0_000000_0_1_1_1; // I
        `ANDI   :   controls = 15'b0_0_0_0_0_010000_0_1_1_0; // I
        `SLTI   :   controls = 15'b0_0_0_0_0_101001_0_1_1_1; // I
        `SLTIU  :   controls = 15'b0_0_0_0_0_110001_0_1_1_1; // I
        `ORI    :   controls = 15'b0_0_0_0_0_001000_0_1_1_0; // I
        `XORI   :   controls = 15'b0_0_0_0_0_100000_0_1_1_0; // I
        `BEQ    :   controls = 15'b0_0_0_1_0_000001_0_1_0_1; // I
        `BGEZ   :   controls = 15'b0_0_0_1_0_000001_0_1_0_1; // I
        `BGEZAL :   controls = 15'b0_0_0_1_0_000001_0_1_1_1; // I
        `BGTZ   :   controls = 15'b0_0_0_1_0_000000_0_1_0_1; // I
        `BLEZ   :   controls = 15'b0_0_0_1_0_000000_0_1_0_1; // I
        `BLTZ   :   controls = 15'b0_0_0_1_0_000000_0_1_0_1; // I
        `BLTZAL :   controls = 15'b0_0_0_1_0_000000_0_1_1_1; // I
        `BNE    :   controls = 15'b0_0_0_1_0_000001_0_1_0_1; // I
        `LB     :   controls = 15'b0_0_0_1_1_000000_0_1_1_1; // I
        `LBU    :   controls = 15'b0_0_0_1_1_000000_0_1_1_1; // I
        `LH     :   controls = 15'b0_0_0_1_1_000000_0_1_1_1; // I
        `LHU    :   controls = 15'b0_0_0_1_1_000000_0_1_1_1; // I
        `LUI    :   controls = 15'b0_0_0_1_1_000000_0_1_1_1; // I
        `LW     :   controls = 15'b0_0_0_1_1_000000_0_1_1_1; // I
        `SB     :   controls = 15'b0_0_0_0_0_000000_1_1_0_1; // I
        `SH     :   controls = 15'b0_0_0_0_0_000000_1_1_0_1; // I
        `SW     :   controls = 15'b0_0_0_0_0_000000_1_1_0_1; // I
        `J      :   controls = 15'b0_1_0_0_0_000000_0_1_0_1; // J
        `JAL    :   controls = 15'b0_1_0_0_0_000000_0_1_1_1; // J
        5'b00000:   
          case (instr_funct_ctl_i)
            //alu_op_ctl: 
            //6'b000_00_0: ADD 
            //6'b000_00_1: SUB
            //6'b000_01_0: shift left 
            //6'b000_10_0: logical shift right 
            //6'b000_11_0: arithmetic shift right 
            //6'b001_00_0: logical OR
            //6'b010_00_0: logical AND
            //6'b011_00_0: logical NOR
            //6'b100_00_0: logical XOR
            //reg_dst_ctl, jump_ctl, branch_ctl, mem_read_ctl, mem_to_reg_ctl, alu_op_ctl, mem_wr_ctl, alu_src_ctl, reg_wr_ctl
            `ADD    :   controls = 15'b1_0_0_0_0_000000_0_0_1_0; // R
            `ADDU   :   controls = 15'b1_0_0_0_0_000000_0_0_1_0; // R
            `AND    :   controls = 15'b1_0_0_0_0_010000_0_0_1_0; // R
            `DIV    :   controls = 15'b1_0_0_0_0_000000_0_0_1_0; // R
            `DIVU   :   controls = 15'b1_0_0_0_0_000000_0_0_1_0; // R
            `JALR   :   controls = 15'b1_0_0_0_0_000000_0_0_1_0; // R
            `JR     :   controls = 15'b1_0_0_0_0_000000_0_0_1_0; // R
            `MFHI   :   controls = 15'b1_0_0_0_0_000000_0_0_1_0; // R
            `MFLO   :   controls = 15'b1_0_0_0_0_000000_0_0_1_0; // R
            `MTHI   :   controls = 15'b1_0_0_0_0_000000_0_0_1_0; // R
            `MTLO   :   controls = 15'b1_0_0_0_0_000000_0_0_1_0; // R
            `MULT   :   controls = 15'b1_0_0_0_0_000000_0_0_1_0; // R
            `MULTU  :   controls = 15'b1_0_0_0_0_000000_0_0_1_0; // R
            `NOR    :   controls = 15'b1_0_0_0_0_011000_0_0_1_0; // R
            `OR     :   controls = 15'b1_0_0_0_0_001000_0_0_1_0; // R
            `SLLV   :   controls = 15'b1_0_0_0_0_000010_0_0_1_0; // R
            `SLT    :   controls = 15'b1_0_0_0_0_101001_0_0_1_0; // R
            `SLTU   :   controls = 15'b1_0_0_0_0_110001_0_0_1_0; // R
            `SRA    :   controls = 15'b1_0_0_0_0_000110_0_0_1_0; // R
            `SRAV   :   controls = 15'b1_0_0_0_0_000110_0_0_1_0; // R
            `SRL    :   controls = 15'b1_0_0_0_0_000100_0_0_1_0; // R
            `SRLV   :   controls = 15'b1_0_0_0_0_000100_0_0_1_0; // R
            `SUB    :   controls = 15'b1_0_0_0_0_000001_0_0_1_0; // R
            `SUBU   :   controls = 15'b1_0_0_0_0_000001_0_0_1_0; // R
            `SYSCALL:   controls = 15'b1_0_0_0_0_000000_0_0_1_0; // R
            `XOR    :   controls = 15'b1_0_0_0_0_100000_0_0_1_0; // R
            `SLL    :   controls = 15'b1_0_0_0_0_000010_0_0_1_0; // R
            default :   controls = 15'b1_0_0_0_0_000000_0_0_1_0;
          endcase
        default :   controls = 15'b1_0_0_0_0_000000_0_0_1_0;
      endcase
    end
    
endmodule