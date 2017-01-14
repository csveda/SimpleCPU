#include <stdint.h>

#define FALSE 0
#define TRUE  1

#define MIPS_REGS 32

typedef struct CPU_State_Struct {

  uint32_t PC;		        /* program counter */
  uint32_t REGS[MIPS_REGS]; /* register file. */
  uint32_t HI, LO;          /* special regs for mult/div. */
} CPU_State;

/* Data Structure for Latch */

extern CPU_State CURRENT_STATE, NEXT_STATE;

extern int RUN_BIT; 	/* run bit                  */
extern int prev_pc;     /* previous program counter */
extern int rt_as_src;   /* Use RT reg as source     */

uint32_t mem_read_32(uint32_t address);
void     mem_write_32(uint32_t address, uint32_t value);

/* YOU IMPLEMENT THIS FUNCTION */
void process_instruction();
extern void init();
extern void run(int num_cycles);
extern int compare_r (int pc, int instr, int rd, int rs, int rt, int rd_val, int rs_val, int rt_val);
extern int compare_i (int pc, int instr, int rs, int rt, int rs_val, int rt_val);
