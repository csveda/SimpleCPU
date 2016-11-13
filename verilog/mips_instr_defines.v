// Declare all the instruction related defines here
// Op/funct field for all the supported instructions
`define ADD     6'b10_0000 // R
`define ADDU    6'b10_0001 // R
`define ADDI    6'b00_1000 // I
`define ADDIU   6'b00_1001 // I
`define AND     6'b10_0100 // R
`define ANDI    6'b00_1100 // I
`define BEQ     6'b00_0100 // I
`define BGEZ    6'b00_0001 // I
`define BGEZAL  6'b01_0001 // I
`define BGTZ    6'b00_0111 // I
`define BLEZ    6'b00_0110 // I
`define BLTZ    6'b00_0001 // I
`define BLTZAL  6'b00_0001 // I
`define BNE     6'b00_0101 // I
`define DIV     6'b01_1010 // R
`define DIVU    6'b01_1011 // R
`define J       6'b00_0010 // J
`define JAL     6'b00_0011 // J
`define JALR    6'b00_1001 // R
`define JR      6'b00_1000 // R
`define LB      6'b10_0000 // I
`define LBU     6'b10_0100 // I
`define LH      6'b10_0001 // I
`define LHU     6'b10_0101 // I
`define LUI     6'b00_1111 // I
`define LW      6'b10_0011 // I
`define MFHI    6'b01_0000 // R
`define MFLO    6'b01_0010 // R
`define MTHI    6'b01_0001 // R
`define MTLO    6'b01_0011 // R
`define MULT    6'b01_1000 // R
`define MULTU   6'b01_1001 // R
`define NOR     6'b10_0111 // R
`define OR      6'b10_0101 // R
`define ORI     6'b00_1101 // I
`define SB      6'b10_1000 // I
`define SH      6'b10_1001 // I
`define SW      6'b10_1011 // I
`define SLL     6'b00_0000 // R
`define SLLV    6'b00_0100 // R
`define SLT     6'b10_1010 // R
`define SLTI    6'b00_1010 // I
`define SLTIU   6'b00_1011 // I
`define SLTU    6'b10_1011 // R
`define SRA     6'b00_0011 // R
`define SRAV    6'b00_0111 // R
`define SRL     6'b00_0010 // R
`define SRLV    6'b00_0110 // R
`define SUB     6'b10_0010 // R
`define SUBU    6'b10_0011 // R
`define SYSCALL 6'b00_0011 // R
`define XOR     6'b10_0110 // R
`define XORI    6'b00_1110 // I
