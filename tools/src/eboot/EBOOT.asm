.PSP
.open "1_extracted\\EBOOT.BIN","3_patched\\SYSDIR\\EBOOT.BIN",0x8804000 -0xc0
  ; grouping macro, does nothing but allows gruping in code editor
  .macro .endorg :: .endmacro
  .definelabel func_08886344, 0x08886344

  ; speaker name limit
  .org 0x08807808
      addiu      a0,a1,0x10
      li         a1,0x29
  .endorg

  ; speaker textbox limit
  ; claim enough stack space
  .org 0x08886708 :: addiu      sp,-0x200

  ; free claimed stack space
  .org 0x0888676C :: addiu      sp,0x200
  .org 0x08886798 :: addiu      sp,0x200
  .org 0x088867D8 :: addiu      sp,0x200
  
  ; fixup call
  .org 0x0888679C
      addiu      a1,sp,0x30     ; second arg now starts at new claimed space
      jal        func_08886344
       li        a2,0x20        ; new max speaker line size
      move        s2,v0
      addiu      a0,sp,0x30     ; first arg now starts at new claimed space
  .endorg

  ; textbox line limit char
  .org 0x08804DC0
      li         a0,0x29
  .endorg

  ; log textbox line limit char
  .org 0x08811CE0
      li         a2,0x29
  .endorg


  ; letter spacing
  .org 0x08808D1C
      addiu      a0,a0,0x10
  .endorg

  ; checksum always true
  .org 0x0882B284
      li         v0,0x1
  .endorg

  ; jump to vwf
  .org 0x08886640
      jal        vwf_speaker
  .endorg


  .org 0x08886644
      nop
  .org 0x0888664C
      nop
  .endorg


  .org 0x08886BFC
      nop
  .org 0x08886C04
      nop
  .org 0x08886C18
      addu       a2,a0,a1
  .endorg


  .org 0x08886C34
      jal        vwf_text
  .endorg


  .org 0x0893CCC0
    .func vwf_speaker
        li         v0,0x5C
        mult       a0,v0
        mflo       a0
        addu       v0,a0,a1
        lbu        v0,0x5B(v0) ; load width from lt.bin
        addi       v0,v0,1
        beqz       s3,@@Lab2
         move       a0,v0
        lhu        a0,0x30(s5)
        addu       a2,a2,a0
        addu       a0,a0,v0
      @@Lab2:
        sh         a0,0x30(s5)
        jr         ra
         lhu        a0,0x0(s0)
    .endfunction

    .func vwf_text
        li         v0,0x5C
        mult       s6,v0
        mflo       a0
        addu       v0,a0,a1
        lbu        v0,0x5B(v0) ; load width from lt.bin
        lbu        a0,0x0(s1)
        beqz       a0,@@Lab1
         move       a0,v0
        lhu        a0,0x20(s1)
        addu       a2,a2,a0
        addu       a0,a0,v0
      @@Lab1:
        sh         a0,0x20(s1)
        jr         ra
         move       a0,s6
    .endfunction
  .endorg

.close
