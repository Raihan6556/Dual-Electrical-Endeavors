module decode #(
    parameter int IALIGN_IN_BITS  = 32,
    parameter int IALIGN_IN_BYTES = IALIGN_IN_BITS / 8,

    parameter int XLEN = 32
) (
    input logic [31:0] instruction,
    output logic signed [31:0] registers[32],
    output logic [31:0] pc
);
  logic [6:0] opcode;
  logic [11:7] rd;
  logic [14:12] funct3;
  logic [19:15] rs1;
  logic [24:20] rs2;
  logic [31:25] funct7;
  logic signed [31:12] imm_u;
  logic signed [31:20] imm_i;

  assign opcode = instruction[6:0];
  assign rd     = instruction[11:7];
  assign funct3 = instruction[14:12];
  assign rs1    = instruction[19:15];
  assign rs2    = instruction[24:20];
  assign funct7 = instruction[31:25];
  assign imm_u  = instruction[31:12];
  assign imm_i  = instruction[31:20];

  // Chapter 36. RV32/64G Instruction Set Listings
  always @(instruction, pc) begin
    case (opcode)
      // lui (Load Upper Immediate)
      7'b0110111: registers[rd][31:12] = imm_u;

      // auipc (Add Upper Immediate to Program Counter)
      7'b0010111: registers[rd][31:12] = 20'(pc + imm_u);

      // jal
      7'b1101111: begin
        logic signed [20:0] imm_j;

        imm_j = {
          instruction[31],  // imm_j[20]
          instruction[19:12],  // imm_j[19:12]
          instruction[20],  // imm_j[11]
          instruction[30:21],  // imm_j[10:1]
          1'b0  // imm_j[0]
        };

        registers[rd] = pc + 4;


        pc += 32'(imm_j);

        // TODO: throw a Instruction-Address-Misaligned exception
        // if (pc % (IALIGN_IN_BYTES) != 0) throw misaligned-address-exception;
      end

      // jalr
      7'b1100111: begin
        registers[rd] = pc + 4;
        pc = 32'(registers[rs1] + imm_i);
        pc[0] = 0;  // set lsb to zero

        // TODO: throw a Instruction-Address-Misaligned exception
        // if (pc % (IALIGN_IN_BYTES) != 0) throw misaligned-address-exception;
      end

      // branching instructions all use the B immediate and the same opcode
      7'b1100011: begin
        // https://rvopcode.com/en/instruction-encoder?asm=beq%20x1%2C%20x2%2C%20-4
        logic signed [12:0] imm_b;
        imm_b = {
          instruction[31],  // imm[12]
          instruction[7],  // imm[11]
          instruction[30:25],  // imm[10:5]
          instruction[11:8],  // imm[4:1]
          1'b0  // imm[0]
        };

        case (funct3)
          3'b000: if (registers[rs1] == registers[rs2]) pc += 32'(imm_b);  // beq (Branch If Equal)
          3'b001:
          if (registers[rs1] != registers[rs2]) pc += 32'(imm_b);  // bne (Branch If Not Equal)
          3'b100:
          if (registers[rs1] < registers[rs2]) pc += 32'(imm_b);  // blt (Branch If Less Than)
          3'b101:
          if (registers[rs1] >= registers[rs2]) pc += 32'(imm_b);  // bge (Branch If Greater Than)
          3'b110:
          if (registers[rs1] <= registers[rs2])
            pc += 32'(imm_b);  // bltu (Branch If Less Than Or Equal To)
          3'b111:
          if (registers[rs1] >= registers[rs2])
            pc += 32'(imm_b);  // bgeu (Branch If Greater Than Or Equal To)
          default: ;
        endcase
      end

      7'b0010011: begin
        case (funct3)
          3'b000: registers[rd] = 32'(rs1 + imm_i);  // addi (Add Immediate)
          3'b010:
          registers[rd] = 32'(registers[rs1] < imm_i);  // slti (set less than immediate, 1/0)
          3'b011:
          registers[rd] = 32'(unsigned'(registers[rs1]) < unsigned'(imm_i)); // stliu (set less than immediate unsigned 1/0)
          3'b100: registers[rd] = 32'(registers[rs1] ^ imm_i);  // xori (xor's rs1 with i immediate)
          3'b110: registers[rd] = 32'(registers[rs1] | imm_i);  // ori (or's rs1 with i immediate)
          3'b111: registers[rd] = 32'(registers[rs1] & imm_i);  // andi (ands rs1 with i immediate)
          3'b001: registers[rd] = 32'(registers[rs1] << rs2);  // slli (shift left logically)

          3'b101: begin
            logic [6:0] lower;
            lower = instruction[31:25];
            case (lower)
              7'b0000000:
              registers[rd] = 32'(registers[rs1] >> rs2);  // srli (shift right logically)
              7'b0100000:
              registers[rd] = 32'(registers[rs1] >>> rs2);  // srai (shift right arithmetically)

              default: ;
            endcase
          end
          default: ;
        endcase
      end

      7'b0110011: begin
        case (funct3)
          3'b000: begin
            logic [6:0] lower;
            lower = instruction[31:25];
            case (lower)
              7'b0000000: registers[rd] = registers[rs1] + registers[rs2];  // add
              7'b0100000: registers[rd] = registers[rs1] - registers[rs2];  // sub

              default: ;
            endcase
          end

          3'b001: registers[rd] = registers[rs1] << registers[rs2];  // sll (shift left logical)
          3'b010: registers[rd] = 32'(registers[rs1] < registers[rs2]);  // slt (set less than)
          3'b011:
          registers[rd] = 32'(unsigned'(registers[rs1]) < unsigned'(registers[rs2])); // sltu (set less than unsigned)
          3'b100: registers[rd] = registers[rs1] ^ registers[rs2];  // xor (bitwise xor)

          3'b101: begin
            logic [6:0] lower;
            lower = instruction[31:25];
            case (lower)
              7'b0000000:
              registers[rd] = registers[rs1] >> registers[rs2];  // srl (shift right logically)
              7'b0100000:
              registers[rd] = registers[rs1] >>> registers[rs2]; // sra (shift right arithmetically)
              default: ;
            endcase
          end

          3'b110:  registers[rd] = registers[rs1] | registers[rs2];  // or
          3'b111:  registers[rd] = registers[rs1] & registers[rs2];  // and
          default: ;
        endcase
      end

      // TODO: other rv32i instructions...

      // unknown opcode
      default: ;
    endcase
  end

endmodule
