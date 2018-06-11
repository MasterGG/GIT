/* 
 * Command line: opannotate -e main --assembly ./aes_gcm 
 * 
 * Interpretation of command line:
 * Output annotated assembly listing with samples
 * 
 * CPU: Intel Haswell microarchitecture, speed 2.601e+06 MHz (estimated)
 * Counted CPU_CLK_UNHALTED events (Clock cycles when not halted) with a unit mask of 0x00 (No unit mask) count 100000
 */
               :
               :/home/csr/aes_test/aes_gcm:     file format elf64-x86-64
               :
               :
               :Disassembly of section .text:
               :
0000000000400c10 <AES_GCM_encrypt>: /* AES_GCM_encrypt total:  13927  7.0804 */
    15  0.0076 :  400c10:	push   %r15
               :  400c12:	vpxor  %xmm0,%xmm0,%xmm0
               :  400c16:	push   %r14
               :  400c18:	push   %r13
     9  0.0046 :  400c1a:	push   %r12
               :  400c1c:	push   %rbp
               :  400c1d:	push   %rbx
               :  400c1e:	sub    $0x1e0,%rsp
    10  0.0051 :  400c25:	mov    0x220(%rsp),%eax
               :  400c2c:	mov    %r8,0x1b8(%rsp)
               :  400c34:	mov    %r9d,0x1c0(%rsp)
    15  0.0076 :  400c3c:	mov    0x228(%rsp),%r8
               :  400c44:	mov    0x230(%rsp),%r9d
               :  400c4c:	vmovaps %xmm0,0x1c8(%rsp)
               :  400c55:	cmp    $0xc,%eax
               :  400c58:	je     40292b <AES_GCM_encrypt+0x1d1b>
               :  400c5e:	vmovdqa (%r8),%xmm10
               :  400c63:	cmp    $0x1,%r9d
               :  400c67:	jle    402a26 <AES_GCM_encrypt+0x1e16>
               :  400c6d:	lea    -0x2(%r9),%r11d
               :  400c71:	vmovdqa %xmm10,%xmm7
               :  400c75:	lea    0x10(%r8),%r10
               :  400c79:	add    $0x2,%r11
               :  400c7d:	shl    $0x4,%r11
               :  400c81:	add    %r8,%r11
               :  400c84:	nopl   0x0(%rax)
               :  400c88:	vaesenc (%r10),%xmm7,%xmm7
               :  400c8d:	add    $0x10,%r10
               :  400c91:	cmp    %r11,%r10
               :  400c94:	jne    400c88 <AES_GCM_encrypt+0x78>
               :  400c96:	vmovdqa 0x2d62(%rip),%xmm5        # 403a00 <_IO_stdin_used+0x10>
               :  400c9e:	movslq %r9d,%rbx
               :  400ca1:	mov    %rbx,%r10
               :  400ca4:	mov    %rbx,0x1a0(%rsp)
               :  400cac:	vmovaps %xmm5,0x188(%rsp)
               :  400cb5:	lea    0xf(%rax),%ebx
               :  400cb8:	shl    $0x4,%r10
               :  400cbc:	test   %eax,%eax
               :  400cbe:	cmovns %eax,%ebx
               :  400cc1:	vmovdqa (%r8,%r10,1),%xmm6
               :  400cc7:	sar    $0x4,%ebx
               :  400cca:	vaesenclast %xmm6,%xmm7,%xmm0
               :  400ccf:	vpshufb %xmm5,%xmm0,%xmm0
               :  400cd4:	vmovdqa %xmm0,%xmm12
               :  400cd8:	test   %ebx,%ebx
               :  400cda:	jle    402a1b <AES_GCM_encrypt+0x1e0b>
               :  400ce0:	lea    -0x1(%rbx),%r11d
               :  400ce4:	mov    %rcx,%r10
               :  400ce7:	vpxor  %xmm1,%xmm1,%xmm1
               :  400ceb:	add    $0x1,%r11
               :  400cef:	shl    $0x4,%r11
               :  400cf3:	add    %rcx,%r11
               :  400cf6:	nopw   %cs:0x0(%rax,%rax,1)
               :  400d00:	vmovdqu (%r10),%xmm7
               :  400d05:	add    $0x10,%r10
               :  400d09:	vpshufb %xmm5,%xmm7,%xmm7
               :  400d0e:	vpxor  %xmm7,%xmm1,%xmm0
               :  400d12:	vpclmullqhqdq %xmm12,%xmm0,%xmm3
               :  400d18:	vpclmulhqlqdq %xmm12,%xmm0,%xmm1
               :  400d1e:	vpxor  %xmm3,%xmm1,%xmm1
               :  400d22:	vpslldq $0x8,%xmm1,%xmm3
               :  400d27:	vpclmullqlqdq %xmm12,%xmm0,%xmm2
               :  400d2d:	vpclmulhqhqdq %xmm12,%xmm0,%xmm0
               :  400d33:	vpxor  %xmm3,%xmm2,%xmm2
               :  400d37:	vpsrld $0x1f,%xmm2,%xmm3
               :  400d3c:	vpsrldq $0xc,%xmm3,%xmm8
               :  400d41:	vpsrldq $0x8,%xmm1,%xmm1
               :  400d46:	vpslldq $0x4,%xmm3,%xmm3
               :  400d4b:	vpxor  %xmm1,%xmm0,%xmm1
               :  400d4f:	vpslld $0x1,%xmm2,%xmm2
               :  400d54:	vpor   %xmm2,%xmm3,%xmm2
               :  400d58:	vpslld $0x1f,%xmm2,%xmm0
               :  400d5d:	vpslld $0x19,%xmm2,%xmm9
               :  400d62:	vpslld $0x1e,%xmm2,%xmm3
               :  400d67:	vpsrld $0x1f,%xmm1,%xmm4
               :  400d6c:	vpxor  %xmm0,%xmm3,%xmm3
               :  400d70:	vpxor  %xmm9,%xmm3,%xmm0
               :  400d75:	vpsrldq $0x4,%xmm0,%xmm9
               :  400d7a:	vpslldq $0xc,%xmm0,%xmm0
               :  400d7f:	vpxor  %xmm0,%xmm2,%xmm0
               :  400d83:	vpslld $0x1,%xmm1,%xmm1
               :  400d88:	vpsrld $0x1,%xmm0,%xmm11
               :  400d8d:	vpsrld $0x2,%xmm0,%xmm3
               :  400d92:	vpsrld $0x7,%xmm0,%xmm2
               :  400d97:	vpxor  %xmm11,%xmm3,%xmm3
               :  400d9c:	vpslldq $0x4,%xmm4,%xmm4
               :  400da1:	vpxor  %xmm2,%xmm9,%xmm2
               :  400da5:	vpxor  %xmm2,%xmm3,%xmm2
               :  400da9:	vpor   %xmm1,%xmm4,%xmm1
               :  400dad:	vpor   %xmm8,%xmm1,%xmm8
               :  400db2:	vpxor  %xmm0,%xmm8,%xmm0
               :  400db6:	vpxor  %xmm0,%xmm2,%xmm0
               :  400dba:	vmovdqa %xmm0,%xmm1
               :  400dbe:	cmp    %r11,%r10
               :  400dc1:	jne    400d00 <AES_GCM_encrypt+0xf0>
               :  400dc7:	test   $0xf,%al
               :  400dc9:	je     400efa <AES_GCM_encrypt+0x2ea>
               :  400dcf:	mov    %eax,%r10d
               :  400dd2:	sar    $0x1f,%r10d
               :  400dd6:	shr    $0x1c,%r10d
               :  400dda:	lea    (%rax,%r10,1),%r11d
               :  400dde:	and    $0xf,%r11d
               :  400de2:	sub    %r10d,%r11d
               :  400de5:	test   %r11d,%r11d
               :  400de8:	jle    402a3e <AES_GCM_encrypt+0x1e2e>
               :  400dee:	lea    0x1c8(%rsp),%r10
               :  400df6:	shl    $0x4,%ebx
               :  400df9:	sub    $0x1,%r11d
               :  400dfd:	movslq %ebx,%rbx
               :  400e00:	add    $0x1,%r11
               :  400e04:	mov    %r10,%rbp
               :  400e07:	add    %rbx,%rcx
               :  400e0a:	mov    %rcx,%rbx
               :  400e0d:	cmp    $0x8,%r11d
               :  400e11:	jae    402904 <AES_GCM_encrypt+0x1cf4>
               :  400e17:	xor    %ecx,%ecx
               :  400e19:	test   $0x4,%r11b
               :  400e1d:	jne    40287d <AES_GCM_encrypt+0x1c6d>
               :  400e23:	test   $0x2,%r11b
               :  400e27:	jne    4028a2 <AES_GCM_encrypt+0x1c92>
               :  400e2d:	and    $0x1,%r11d
               :  400e31:	jne    402893 <AES_GCM_encrypt+0x1c83>
               :  400e37:	vmovdqa 0x1c8(%rsp),%xmm1
               :  400e40:	vpshufb 0x188(%rsp),%xmm1,%xmm1
               :  400e4a:	vpxor  %xmm1,%xmm0,%xmm0
               :  400e4e:	vpclmulhqlqdq %xmm12,%xmm0,%xmm2
               :  400e54:	vpclmullqhqdq %xmm12,%xmm0,%xmm3
               :  400e5a:	vpxor  %xmm3,%xmm2,%xmm3
               :  400e5e:	vpslldq $0x8,%xmm3,%xmm2
               :  400e63:	vmovdqa %xmm1,%xmm7
               :  400e67:	vpclmullqlqdq %xmm12,%xmm0,%xmm1
               :  400e6d:	vpsrldq $0x8,%xmm3,%xmm4
               :  400e72:	vpxor  %xmm2,%xmm1,%xmm2
               :  400e76:	vpclmulhqhqdq %xmm12,%xmm0,%xmm0
               :  400e7c:	vpsrld $0x1f,%xmm2,%xmm3
               :  400e81:	vpxor  %xmm4,%xmm0,%xmm0
               :  400e85:	vpslld $0x1,%xmm2,%xmm2
               :  400e8a:	vpsrld $0x1f,%xmm0,%xmm1
               :  400e8f:	vpslld $0x1,%xmm0,%xmm5
               :  400e94:	vpsrldq $0xc,%xmm3,%xmm0
               :  400e99:	vpslldq $0x4,%xmm3,%xmm3
               :  400e9e:	vpor   %xmm2,%xmm3,%xmm2
               :  400ea2:	vpslld $0x1f,%xmm2,%xmm4
               :  400ea7:	vpslld $0x19,%xmm2,%xmm8
               :  400eac:	vpslld $0x1e,%xmm2,%xmm3
               :  400eb1:	vpxor  %xmm3,%xmm4,%xmm3
               :  400eb5:	vpxor  %xmm8,%xmm3,%xmm3
               :  400eba:	vpsrldq $0x4,%xmm3,%xmm4
               :  400ebf:	vpslldq $0xc,%xmm3,%xmm3
               :  400ec4:	vpxor  %xmm3,%xmm2,%xmm2
               :  400ec8:	vpslldq $0x4,%xmm1,%xmm1
               :  400ecd:	vpsrld $0x1,%xmm2,%xmm3
               :  400ed2:	vpor   %xmm5,%xmm1,%xmm1
               :  400ed6:	vpor   %xmm0,%xmm1,%xmm0
               :  400eda:	vpxor  %xmm2,%xmm0,%xmm0
               :  400ede:	vpsrld $0x2,%xmm2,%xmm9
               :  400ee3:	vpsrld $0x7,%xmm2,%xmm8
               :  400ee8:	vpxor  %xmm9,%xmm3,%xmm1
               :  400eed:	vpxor  %xmm8,%xmm4,%xmm4
               :  400ef2:	vpxor  %xmm4,%xmm1,%xmm1
               :  400ef6:	vpxor  %xmm1,%xmm0,%xmm0
               :  400efa:	shl    $0x3,%eax
               :  400efd:	cltq   
               :  400eff:	vpinsrq $0x0,%rax,%xmm7,%xmm7
               :  400f05:	xor    %eax,%eax
               :  400f07:	vpinsrq $0x1,%rax,%xmm7,%xmm1
               :  400f0d:	vpxor  %xmm0,%xmm1,%xmm0
               :  400f11:	vpclmulhqlqdq %xmm12,%xmm0,%xmm3
               :  400f17:	vpclmullqhqdq %xmm12,%xmm0,%xmm2
               :  400f1d:	vpxor  %xmm3,%xmm2,%xmm2
               :  400f21:	vpslldq $0x8,%xmm2,%xmm4
               :  400f26:	vpclmullqlqdq %xmm12,%xmm0,%xmm1
               :  400f2c:	vpclmulhqhqdq %xmm12,%xmm0,%xmm0
               :  400f32:	vpsrldq $0x8,%xmm2,%xmm3
               :  400f37:	vpxor  %xmm4,%xmm1,%xmm1
               :  400f3b:	vpsrld $0x1f,%xmm1,%xmm2
               :  400f40:	vpxor  %xmm3,%xmm0,%xmm0
               :  400f44:	vpsrldq $0xc,%xmm2,%xmm5
               :  400f49:	vpslld $0x1,%xmm1,%xmm1
               :  400f4e:	vpslldq $0x4,%xmm2,%xmm2
               :  400f53:	vpor   %xmm1,%xmm2,%xmm1
               :  400f57:	vpslld $0x1f,%xmm1,%xmm4
               :  400f5c:	vpslld $0x19,%xmm1,%xmm7
               :  400f61:	vpslld $0x1e,%xmm1,%xmm2
               :  400f66:	vpsrld $0x1f,%xmm0,%xmm3
               :  400f6b:	vpxor  %xmm2,%xmm4,%xmm2
               :  400f6f:	vpxor  %xmm7,%xmm2,%xmm2
               :  400f73:	vpsrldq $0x4,%xmm2,%xmm4
               :  400f78:	vpslldq $0xc,%xmm2,%xmm2
               :  400f7d:	vpxor  %xmm2,%xmm1,%xmm1
               :  400f81:	vpslld $0x1,%xmm0,%xmm0
               :  400f86:	vpsrld $0x1,%xmm1,%xmm2
               :  400f8b:	vpsrld $0x2,%xmm1,%xmm8
               :  400f90:	vpsrld $0x7,%xmm1,%xmm7
               :  400f95:	vpslldq $0x4,%xmm3,%xmm3
               :  400f9a:	vpxor  %xmm7,%xmm4,%xmm4
               :  400f9e:	vpor   %xmm0,%xmm3,%xmm0
               :  400fa2:	vpor   %xmm5,%xmm0,%xmm0
               :  400fa6:	vpxor  %xmm1,%xmm0,%xmm1
               :  400faa:	vpxor  %xmm8,%xmm2,%xmm0
               :  400faf:	vpxor  %xmm4,%xmm0,%xmm0
               :  400fb3:	vpxor  %xmm0,%xmm1,%xmm0
               :  400fb7:	vpshufb 0x188(%rsp),%xmm0,%xmm0
               :  400fc1:	vpxor  %xmm0,%xmm10,%xmm5
               :  400fc5:	vmovaps %xmm0,0x108(%rsp)
               :  400fce:	vmovaps %xmm5,0x28(%rsp)
               :  400fd4:	cmp    $0x1,%r9d
               :  400fd8:	jle    40100c <AES_GCM_encrypt+0x3fc>
               :  400fda:	lea    -0x2(%r9),%ecx
               :  400fde:	vmovdqa %xmm5,%xmm0
               :  400fe2:	lea    0x10(%r8),%rax
               :  400fe6:	add    $0x2,%rcx
               :  400fea:	shl    $0x4,%rcx
               :  400fee:	add    %r8,%rcx
               :  400ff1:	nopl   0x0(%rax)
               :  400ff8:	vaesenc (%rax),%xmm0,%xmm0
               :  400ffd:	add    $0x10,%rax
               :  401001:	cmp    %rcx,%rax
               :  401004:	jne    400ff8 <AES_GCM_encrypt+0x3e8>
               :  401006:	vmovaps %xmm0,0x28(%rsp)
               :  40100c:	vmovdqa 0x28(%rsp),%xmm7
               :  401012:	vaesenclast %xmm6,%xmm7,%xmm5
               :  401017:	vmovaps %xmm5,0x1a8(%rsp)
               :  401020:	vpclmullqhqdq %xmm12,%xmm12,%xmm1
    62  0.0315 :  401026:	vmovdqa %xmm1,%xmm2
               :  40102a:	vpclmulhqlqdq %xmm12,%xmm12,%xmm3
    19  0.0097 :  401030:	vpclmullqlqdq %xmm12,%xmm12,%xmm0
    13  0.0066 :  401036:	vpxor  %xmm3,%xmm2,%xmm1
               :  40103a:	vpslldq $0x8,%xmm1,%xmm2
     3  0.0015 :  40103f:	vpclmulhqhqdq %xmm12,%xmm12,%xmm4
    10  0.0051 :  401045:	mov    0x218(%rsp),%eax
               :  40104c:	vpxor  %xmm2,%xmm0,%xmm0
               :  401050:	vpsrldq $0x8,%xmm1,%xmm1
     8  0.0041 :  401055:	vpsrld $0x1f,%xmm0,%xmm2
               :  40105a:	vpxor  %xmm1,%xmm4,%xmm1
     8  0.0041 :  40105e:	vpslld $0x1,%xmm0,%xmm0
               :  401063:	vpslld $0x1,%xmm1,%xmm4
     7  0.0036 :  401068:	lea    0x7f(%rax),%r10d
               :  40106c:	test   %eax,%eax
               :  40106e:	cmovns %eax,%r10d
     6  0.0031 :  401072:	vpsrld $0x1f,%xmm1,%xmm3
               :  401077:	vpslldq $0x4,%xmm2,%xmm1
               :  40107c:	vpor   %xmm0,%xmm1,%xmm0
               :  401080:	vpsrldq $0xc,%xmm2,%xmm5
    11  0.0056 :  401085:	sar    $0x7,%r10d
               :  401089:	vpslld $0x1f,%xmm0,%xmm2
               :  40108e:	vpslld $0x19,%xmm0,%xmm6
    12  0.0061 :  401093:	vpslld $0x1e,%xmm0,%xmm1
     9  0.0046 :  401098:	vpxor  %xmm1,%xmm2,%xmm1
     8  0.0041 :  40109c:	vpxor  %xmm6,%xmm1,%xmm1
     4  0.0020 :  4010a0:	vpsrldq $0x4,%xmm1,%xmm2
     6  0.0031 :  4010a5:	vpslldq $0xc,%xmm1,%xmm1
     9  0.0046 :  4010aa:	vpxor  %xmm1,%xmm0,%xmm0
     8  0.0041 :  4010ae:	vpslldq $0x4,%xmm3,%xmm3
               :  4010b3:	vpsrld $0x2,%xmm0,%xmm8
     8  0.0041 :  4010b8:	vpor   %xmm4,%xmm3,%xmm1
               :  4010bc:	vpor   %xmm5,%xmm1,%xmm1
               :  4010c0:	vpsrld $0x7,%xmm0,%xmm7
     4  0.0020 :  4010c5:	vpsrld $0x1,%xmm0,%xmm6
     6  0.0031 :  4010ca:	vpxor  %xmm0,%xmm1,%xmm0
               :  4010ce:	vpxor  %xmm7,%xmm2,%xmm1
               :  4010d2:	vpxor  %xmm8,%xmm6,%xmm6
    10  0.0051 :  4010d7:	vpxor  %xmm1,%xmm6,%xmm1
    10  0.0051 :  4010db:	vpxor  %xmm1,%xmm0,%xmm7
     8  0.0041 :  4010df:	vmovdqa %xmm7,%xmm13
               :  4010e3:	vpclmulhqlqdq %xmm7,%xmm12,%xmm2
    68  0.0346 :  4010e9:	vpclmullqhqdq %xmm7,%xmm12,%xmm1
    18  0.0092 :  4010ef:	vpxor  %xmm2,%xmm1,%xmm1
     6  0.0031 :  4010f3:	vpslldq $0x8,%xmm1,%xmm2
     4  0.0020 :  4010f8:	vpclmullqlqdq %xmm7,%xmm12,%xmm0
    16  0.0081 :  4010fe:	vpsrldq $0x8,%xmm1,%xmm1
     7  0.0036 :  401103:	vpxor  %xmm2,%xmm0,%xmm0
     1 5.1e-04 :  401107:	vpclmulhqhqdq %xmm7,%xmm12,%xmm4
     9  0.0046 :  40110d:	vpsrld $0x1f,%xmm0,%xmm2
     1 5.1e-04 :  401112:	vpxor  %xmm1,%xmm4,%xmm1
     5  0.0025 :  401116:	vmovaps %xmm7,-0x18(%rsp)
               :  40111c:	vpslld $0x1,%xmm1,%xmm4
    10  0.0051 :  401121:	vpsrld $0x1f,%xmm1,%xmm3
     3  0.0015 :  401126:	vpslld $0x1,%xmm0,%xmm0
     2  0.0010 :  40112b:	vpslldq $0x4,%xmm2,%xmm1
               :  401130:	vpor   %xmm0,%xmm1,%xmm0
     1 5.1e-04 :  401134:	vpsrldq $0xc,%xmm2,%xmm5
     2  0.0010 :  401139:	vpslld $0x19,%xmm0,%xmm6
     2  0.0010 :  40113e:	vpslld $0x1f,%xmm0,%xmm2
    13  0.0066 :  401143:	vpslld $0x1e,%xmm0,%xmm1
               :  401148:	vpxor  %xmm1,%xmm2,%xmm1
     6  0.0031 :  40114c:	vpxor  %xmm6,%xmm1,%xmm1
     5  0.0025 :  401150:	vpsrldq $0x4,%xmm1,%xmm2
    16  0.0081 :  401155:	vpslldq $0xc,%xmm1,%xmm1
     3  0.0015 :  40115a:	vpxor  %xmm1,%xmm0,%xmm0
     4  0.0020 :  40115e:	vpslldq $0x4,%xmm3,%xmm3
               :  401163:	vpsrld $0x2,%xmm0,%xmm7
     9  0.0046 :  401168:	vpor   %xmm4,%xmm3,%xmm3
               :  40116c:	vpor   %xmm5,%xmm3,%xmm5
               :  401170:	vpsrld $0x7,%xmm0,%xmm6
     7  0.0036 :  401175:	vpsrld $0x1,%xmm0,%xmm1
     8  0.0041 :  40117a:	vpxor  %xmm6,%xmm2,%xmm2
               :  40117e:	vpxor  %xmm0,%xmm5,%xmm0
               :  401182:	vpxor  %xmm7,%xmm1,%xmm1
     3  0.0015 :  401186:	vpxor  %xmm2,%xmm1,%xmm1
    11  0.0056 :  40118a:	vpxor  %xmm1,%xmm0,%xmm7
     6  0.0031 :  40118e:	vmovdqa %xmm7,%xmm14
               :  401192:	vpclmulhqlqdq %xmm7,%xmm12,%xmm2
    68  0.0346 :  401198:	vpclmullqhqdq %xmm7,%xmm12,%xmm1
    12  0.0061 :  40119e:	vpxor  %xmm2,%xmm1,%xmm1
     9  0.0046 :  4011a2:	vpslldq $0x8,%xmm1,%xmm2
     8  0.0041 :  4011a7:	vpclmullqlqdq %xmm7,%xmm12,%xmm0
    16  0.0081 :  4011ad:	vpsrldq $0x8,%xmm1,%xmm1
     3  0.0015 :  4011b2:	vpxor  %xmm2,%xmm0,%xmm0
     2  0.0010 :  4011b6:	vpclmulhqhqdq %xmm7,%xmm12,%xmm4
     1 5.1e-04 :  4011bc:	vpsrld $0x1f,%xmm0,%xmm2
     6  0.0031 :  4011c1:	vpxor  %xmm1,%xmm4,%xmm1
     2  0.0010 :  4011c5:	vmovaps %xmm7,-0x28(%rsp)
               :  4011cb:	vpslld $0x1,%xmm1,%xmm4
     9  0.0046 :  4011d0:	vpsrld $0x1f,%xmm1,%xmm3
     7  0.0036 :  4011d5:	vpslld $0x1,%xmm0,%xmm0
     5  0.0025 :  4011da:	vpslldq $0x4,%xmm2,%xmm1
               :  4011df:	vpor   %xmm0,%xmm1,%xmm0
     6  0.0031 :  4011e3:	vpsrldq $0xc,%xmm2,%xmm5
     4  0.0020 :  4011e8:	vpslld $0x19,%xmm0,%xmm6
     5  0.0025 :  4011ed:	vpslld $0x1f,%xmm0,%xmm2
     7  0.0036 :  4011f2:	vpslld $0x1e,%xmm0,%xmm1
     3  0.0015 :  4011f7:	vpxor  %xmm1,%xmm2,%xmm1
     6  0.0031 :  4011fb:	vpxor  %xmm6,%xmm1,%xmm1
    10  0.0051 :  4011ff:	vpsrldq $0x4,%xmm1,%xmm2
    14  0.0071 :  401204:	vpslldq $0xc,%xmm1,%xmm1
     3  0.0015 :  401209:	vpxor  %xmm1,%xmm0,%xmm0
     7  0.0036 :  40120d:	vpslldq $0x4,%xmm3,%xmm3
               :  401212:	vpsrld $0x2,%xmm0,%xmm7
     4  0.0020 :  401217:	vpor   %xmm4,%xmm3,%xmm3
               :  40121b:	vpor   %xmm5,%xmm3,%xmm5
               :  40121f:	vpsrld $0x7,%xmm0,%xmm6
    14  0.0071 :  401224:	vpsrld $0x1,%xmm0,%xmm1
     2  0.0010 :  401229:	vpxor  %xmm6,%xmm2,%xmm2
     4  0.0020 :  40122d:	vpxor  %xmm0,%xmm5,%xmm0
               :  401231:	vpxor  %xmm7,%xmm1,%xmm1
     2  0.0010 :  401235:	vpxor  %xmm2,%xmm1,%xmm1
     7  0.0036 :  401239:	vpxor  %xmm1,%xmm0,%xmm7
     5  0.0025 :  40123d:	vmovdqa %xmm7,%xmm11
               :  401241:	vpclmulhqlqdq %xmm7,%xmm12,%xmm3
    66  0.0336 :  401247:	vpclmullqhqdq %xmm7,%xmm12,%xmm0
    19  0.0097 :  40124d:	vpxor  %xmm3,%xmm0,%xmm0
     6  0.0031 :  401251:	vpslldq $0x8,%xmm0,%xmm3
    15  0.0076 :  401256:	vpclmullqlqdq %xmm7,%xmm12,%xmm1
     4  0.0020 :  40125c:	vpsrldq $0x8,%xmm0,%xmm0
     7  0.0036 :  401261:	vpxor  %xmm3,%xmm1,%xmm3
               :  401265:	vpclmulhqhqdq %xmm7,%xmm12,%xmm2
    10  0.0051 :  40126b:	vpsrld $0x1f,%xmm3,%xmm4
               :  401270:	vpxor  %xmm0,%xmm2,%xmm2
     8  0.0041 :  401274:	vmovaps %xmm7,-0x38(%rsp)
               :  40127a:	vpslld $0x1,%xmm3,%xmm3
               :  40127f:	vpslldq $0x4,%xmm4,%xmm0
     6  0.0031 :  401284:	vpor   %xmm3,%xmm0,%xmm0
    11  0.0056 :  401288:	vpsrldq $0xc,%xmm4,%xmm7
               :  40128d:	vpslld $0x19,%xmm0,%xmm5
     7  0.0036 :  401292:	vpslld $0x1f,%xmm0,%xmm4
     6  0.0031 :  401297:	vpslld $0x1e,%xmm0,%xmm3
     8  0.0041 :  40129c:	vpsrld $0x1f,%xmm2,%xmm1
               :  4012a1:	vpxor  %xmm3,%xmm4,%xmm3
     6  0.0031 :  4012a5:	vpxor  %xmm5,%xmm3,%xmm3
     1 5.1e-04 :  4012a9:	vpsrldq $0x4,%xmm3,%xmm4
    15  0.0076 :  4012ae:	vpslldq $0xc,%xmm3,%xmm3
     1 5.1e-04 :  4012b3:	vpxor  %xmm3,%xmm0,%xmm0
     3  0.0015 :  4012b7:	vpslld $0x1,%xmm2,%xmm2
               :  4012bc:	vpsrld $0x2,%xmm0,%xmm6
     8  0.0041 :  4012c1:	vpsrld $0x7,%xmm0,%xmm5
     4  0.0020 :  4012c6:	vpsrld $0x1,%xmm0,%xmm3
     9  0.0046 :  4012cb:	vpslldq $0x4,%xmm1,%xmm1
               :  4012d0:	vpxor  %xmm6,%xmm3,%xmm3
     6  0.0031 :  4012d4:	vpor   %xmm2,%xmm1,%xmm1
               :  4012d8:	vpor   %xmm7,%xmm1,%xmm7
               :  4012dc:	vpxor  %xmm5,%xmm4,%xmm1
               :  4012e0:	vpxor  %xmm0,%xmm7,%xmm7
     3  0.0015 :  4012e4:	vpxor  %xmm1,%xmm3,%xmm1
               :  4012e8:	vpxor  %xmm1,%xmm7,%xmm7
     7  0.0036 :  4012ec:	vpclmulhqlqdq %xmm7,%xmm12,%xmm3
    74  0.0376 :  4012f2:	vpclmullqhqdq %xmm7,%xmm12,%xmm0
    17  0.0086 :  4012f8:	vpxor  %xmm3,%xmm0,%xmm0
    13  0.0066 :  4012fc:	vpslldq $0x8,%xmm0,%xmm3
     5  0.0025 :  401301:	vpclmullqlqdq %xmm7,%xmm12,%xmm1
     9  0.0046 :  401307:	vpclmulhqhqdq %xmm7,%xmm12,%xmm2
     3  0.0015 :  40130d:	vpxor  %xmm3,%xmm1,%xmm3
               :  401311:	vpsrldq $0x8,%xmm0,%xmm0
    12  0.0061 :  401316:	vmovdqa %xmm7,%xmm15
               :  40131a:	vmovaps %xmm7,-0x48(%rsp)
               :  401320:	vpsrld $0x1f,%xmm3,%xmm4
               :  401325:	vpxor  %xmm0,%xmm2,%xmm0
     9  0.0046 :  401329:	vpslld $0x1,%xmm3,%xmm3
               :  40132e:	vpslld $0x1,%xmm0,%xmm2
    18  0.0092 :  401333:	vpsrld $0x1f,%xmm0,%xmm1
     3  0.0015 :  401338:	vpslldq $0x4,%xmm4,%xmm0
               :  40133d:	vpor   %xmm3,%xmm0,%xmm0
               :  401341:	vpsrldq $0xc,%xmm4,%xmm5
     2  0.0010 :  401346:	vpslld $0x1e,%xmm0,%xmm6
               :  40134b:	vpslld $0x1f,%xmm0,%xmm3
     7  0.0036 :  401350:	vpslld $0x19,%xmm0,%xmm4
     6  0.0031 :  401355:	vpxor  %xmm6,%xmm3,%xmm3
     3  0.0015 :  401359:	vpxor  %xmm4,%xmm3,%xmm4
     6  0.0031 :  40135d:	vpsrldq $0x4,%xmm4,%xmm3
     9  0.0046 :  401362:	vpslldq $0xc,%xmm4,%xmm4
     9  0.0046 :  401367:	vpxor  %xmm4,%xmm0,%xmm0
     9  0.0046 :  40136b:	vpslldq $0x4,%xmm1,%xmm1
               :  401370:	vpsrld $0x2,%xmm0,%xmm7
    10  0.0051 :  401375:	vpor   %xmm2,%xmm1,%xmm1
               :  401379:	vpor   %xmm5,%xmm1,%xmm5
               :  40137d:	vpsrld $0x7,%xmm0,%xmm6
     7  0.0036 :  401382:	vpsrld $0x1,%xmm0,%xmm4
    13  0.0066 :  401387:	vpxor  %xmm6,%xmm3,%xmm3
               :  40138b:	vpxor  %xmm0,%xmm5,%xmm0
               :  40138f:	vpxor  %xmm7,%xmm4,%xmm4
     6  0.0031 :  401393:	vpxor  %xmm3,%xmm4,%xmm4
     9  0.0046 :  401397:	vpxor  %xmm0,%xmm4,%xmm7
     9  0.0046 :  40139b:	vmovdqa %xmm7,%xmm8
               :  40139f:	vpclmulhqlqdq %xmm7,%xmm12,%xmm2
    66  0.0336 :  4013a5:	vpclmullqhqdq %xmm7,%xmm12,%xmm0
    12  0.0061 :  4013ab:	vpxor  %xmm2,%xmm0,%xmm0
     7  0.0036 :  4013af:	vpslldq $0x8,%xmm0,%xmm4
    13  0.0066 :  4013b4:	vpclmullqlqdq %xmm7,%xmm12,%xmm3
     8  0.0041 :  4013ba:	vpsrldq $0x8,%xmm0,%xmm2
     3  0.0015 :  4013bf:	vpxor  %xmm4,%xmm3,%xmm0
     8  0.0041 :  4013c3:	vpclmulhqhqdq %xmm7,%xmm12,%xmm1
     6  0.0031 :  4013c9:	vpsrld $0x1f,%xmm0,%xmm3
     5  0.0025 :  4013ce:	vpxor  %xmm2,%xmm1,%xmm2
     2  0.0010 :  4013d2:	vmovaps %xmm7,-0x58(%rsp)
               :  4013d8:	vpsrldq $0xc,%xmm3,%xmm5
     1 5.1e-04 :  4013dd:	vpslld $0x1,%xmm0,%xmm0
               :  4013e2:	vpslldq $0x4,%xmm3,%xmm3
    16  0.0081 :  4013e7:	vpor   %xmm0,%xmm3,%xmm0
     7  0.0036 :  4013eb:	vpslld $0x1e,%xmm0,%xmm6
     6  0.0031 :  4013f0:	vpslld $0x19,%xmm0,%xmm4
     3  0.0015 :  4013f5:	vpslld $0x1f,%xmm0,%xmm3
     6  0.0031 :  4013fa:	vpsrld $0x1f,%xmm2,%xmm1
               :  4013ff:	vpxor  %xmm6,%xmm3,%xmm3
     9  0.0046 :  401403:	vpxor  %xmm4,%xmm3,%xmm3
     8  0.0041 :  401407:	vpsrldq $0x4,%xmm3,%xmm4
    10  0.0051 :  40140c:	vpslldq $0xc,%xmm3,%xmm3
     7  0.0036 :  401411:	vpxor  %xmm3,%xmm0,%xmm0
     4  0.0020 :  401415:	vpslld $0x1,%xmm2,%xmm2
               :  40141a:	vpsrld $0x2,%xmm0,%xmm6
    16  0.0081 :  40141f:	vpsrld $0x7,%xmm0,%xmm7
    11  0.0056 :  401424:	vpsrld $0x1,%xmm0,%xmm3
     3  0.0015 :  401429:	vpxor  %xmm7,%xmm4,%xmm4
     2  0.0010 :  40142d:	vpslldq $0x4,%xmm1,%xmm1
               :  401432:	vpxor  %xmm6,%xmm3,%xmm3
     5  0.0025 :  401436:	vpxor  %xmm3,%xmm4,%xmm3
     6  0.0031 :  40143a:	vpor   %xmm2,%xmm1,%xmm1
               :  40143e:	vpor   %xmm5,%xmm1,%xmm5
               :  401442:	vpxor  %xmm0,%xmm5,%xmm0
               :  401446:	vpxor  %xmm0,%xmm3,%xmm5
     7  0.0036 :  40144a:	vpclmullqhqdq %xmm5,%xmm12,%xmm0
    57  0.0290 :  401450:	vpclmulhqlqdq %xmm5,%xmm12,%xmm1
     7  0.0036 :  401456:	vpxor  %xmm1,%xmm0,%xmm1
    11  0.0056 :  40145a:	vpslldq $0x8,%xmm1,%xmm0
    10  0.0051 :  40145f:	vpclmullqlqdq %xmm5,%xmm12,%xmm3
     5  0.0025 :  401465:	vpxor  %xmm0,%xmm3,%xmm0
    13  0.0066 :  401469:	vpsrld $0x1f,%xmm0,%xmm3
     8  0.0041 :  40146e:	vpclmulhqhqdq %xmm5,%xmm12,%xmm2
               :  401474:	vpsrldq $0xc,%xmm3,%xmm7
     3  0.0015 :  401479:	vmovdqa %xmm5,%xmm9
               :  40147d:	vmovaps %xmm5,-0x68(%rsp)
               :  401483:	vpslldq $0x4,%xmm3,%xmm3
     7  0.0036 :  401488:	vpslld $0x1,%xmm0,%xmm0
               :  40148d:	vpor   %xmm0,%xmm3,%xmm0
     7  0.0036 :  401491:	vpsrldq $0x8,%xmm1,%xmm1
               :  401496:	vpslld $0x1e,%xmm0,%xmm5
     9  0.0046 :  40149b:	vpxor  %xmm1,%xmm2,%xmm2
               :  40149f:	vpslld $0x1f,%xmm0,%xmm3
    14  0.0071 :  4014a4:	vpslld $0x19,%xmm0,%xmm4
     4  0.0020 :  4014a9:	vpxor  %xmm5,%xmm3,%xmm3
     1 5.1e-04 :  4014ad:	vpsrld $0x1f,%xmm2,%xmm1
               :  4014b2:	vpxor  %xmm4,%xmm3,%xmm4
    15  0.0076 :  4014b6:	vpsrldq $0x4,%xmm4,%xmm6
    14  0.0071 :  4014bb:	vpslldq $0xc,%xmm4,%xmm4
     2  0.0010 :  4014c0:	vpxor  %xmm4,%xmm0,%xmm0
     4  0.0020 :  4014c4:	vpslld $0x1,%xmm2,%xmm2
               :  4014c9:	vpsrld $0x7,%xmm0,%xmm3
     9  0.0046 :  4014ce:	vpslldq $0x4,%xmm1,%xmm1
               :  4014d3:	vpxor  %xmm3,%xmm6,%xmm3
     8  0.0041 :  4014d7:	vpsrld $0x1,%xmm0,%xmm4
               :  4014dc:	vpor   %xmm2,%xmm1,%xmm1
               :  4014e0:	vpor   %xmm7,%xmm1,%xmm1
               :  4014e4:	vpxor  %xmm0,%xmm1,%xmm1
     8  0.0041 :  4014e8:	vpsrld $0x2,%xmm0,%xmm5
               :  4014ed:	vpxor  %xmm5,%xmm4,%xmm0
    10  0.0051 :  4014f1:	vpxor  %xmm0,%xmm3,%xmm0
     7  0.0036 :  4014f5:	vpxor  %xmm0,%xmm1,%xmm7
     4  0.0020 :  4014f9:	vmovdqa %xmm7,%xmm6
               :  4014fd:	vmovaps %xmm7,-0x78(%rsp)
    10  0.0051 :  401503:	test   %r10d,%r10d
               :  401506:	jle    402a0b <AES_GCM_encrypt+0x1dfb>
               :  40150c:	lea    -0x1(%r10),%ecx
               :  401510:	vpshufd $0x4e,%xmm12,%xmm0
               :  401516:	vpxor  %xmm0,%xmm12,%xmm7
               :  40151a:	vpshufd $0x4e,%xmm13,%xmm0
               :  401520:	add    $0x1,%rcx
               :  401524:	mov    %rdx,%rax
               :  401527:	vmovaps %xmm12,0x28(%rsp)
               :  40152d:	vmovaps %xmm7,0x88(%rsp)
               :  401536:	shl    $0x7,%rcx
               :  40153a:	vpxor  %xmm13,%xmm0,%xmm7
               :  40153f:	vpshufd $0x4e,%xmm14,%xmm0
               :  401545:	vmovaps %xmm7,0x98(%rsp)
               :  40154e:	vpxor  %xmm14,%xmm0,%xmm5
               :  401553:	add    %rdx,%rcx
               :  401556:	vmovdqa 0x188(%rsp),%xmm14
               :  40155f:	vmovaps %xmm5,0xa8(%rsp)
               :  401568:	vpshufd $0x4e,%xmm11,%xmm0
               :  40156e:	vpxor  %xmm11,%xmm0,%xmm7
               :  401573:	vpshufd $0x4e,%xmm15,%xmm0
               :  401579:	vmovaps %xmm7,0xb8(%rsp)
               :  401582:	vpxor  %xmm15,%xmm0,%xmm5
               :  401587:	vpshufd $0x4e,%xmm8,%xmm0
               :  40158d:	vpxor  %xmm8,%xmm0,%xmm7
               :  401592:	vmovaps %xmm5,0xc8(%rsp)
               :  40159b:	vpshufd $0x4e,%xmm9,%xmm0
               :  4015a1:	vpxor  %xmm9,%xmm0,%xmm5
               :  4015a6:	vpshufd $0x4e,%xmm6,%xmm0
               :  4015ab:	vmovaps %xmm7,0xd8(%rsp)
               :  4015b4:	vpxor  %xmm6,%xmm0,%xmm7
               :  4015b8:	vpxor  %xmm15,%xmm15,%xmm15
               :  4015bd:	vmovaps %xmm5,0xe8(%rsp)
               :  4015c6:	vmovaps %xmm7,0xf8(%rsp)
               :  4015cf:	vmovaps %xmm10,0x118(%rsp)
               :  4015d8:	nopl   0x0(%rax,%rax,1)
               :  4015e0:	vmovdqu 0x10(%rax),%xmm0
               :  4015e5:	sub    $0xffffffffffffff80,%rax
               :  4015e9:	vmovdqu -0x10(%rax),%xmm9
               :  4015ee:	vmovdqu -0x30(%rax),%xmm5
               :  4015f3:	vpshufb %xmm14,%xmm0,%xmm6
               :  4015f8:	vmovdqa %xmm6,%xmm12
               :  4015fc:	vmovdqu -0x40(%rax),%xmm4
               :  401601:	vmovdqu -0x20(%rax),%xmm7
               :  401606:	vpshufb %xmm14,%xmm5,%xmm5
               :  40160b:	vmovdqa %xmm5,%xmm0
               :  40160f:	vmovdqu -0x80(%rax),%xmm1
               :  401614:	vpshufb %xmm14,%xmm4,%xmm4
               :  401619:	vmovdqa %xmm4,%xmm8
               :  40161d:	vmovdqu -0x60(%rax),%xmm2
               :  401622:	vmovdqu -0x50(%rax),%xmm3
               :  401627:	vmovaps %xmm5,0x18(%rsp)
               :  40162d:	vpshufb %xmm14,%xmm9,%xmm5
               :  401632:	vpshufb %xmm14,%xmm1,%xmm1
               :  401637:	vmovdqa -0x18(%rsp),%xmm9
               :  40163d:	vpxor  %xmm1,%xmm15,%xmm13
               :  401641:	vmovaps %xmm4,0x8(%rsp)
               :  401647:	vpshufb %xmm14,%xmm7,%xmm4
               :  40164c:	vmovdqa -0x38(%rsp),%xmm10
               :  401652:	vpshufb %xmm14,%xmm2,%xmm2
               :  401657:	vpshufb %xmm14,%xmm3,%xmm3
               :  40165c:	vmovaps %xmm6,0x48(%rsp)
               :  401662:	vpclmullqlqdq %xmm4,%xmm9,%xmm15
               :  401668:	vmovdqa %xmm2,%xmm6
               :  40166c:	vmovaps %xmm2,0x58(%rsp)
               :  401672:	vmovdqa %xmm3,%xmm2
               :  401676:	vpclmullqlqdq %xmm8,%xmm10,%xmm9
               :  40167c:	vmovaps %xmm9,0x68(%rsp)
               :  401682:	vmovdqa -0x48(%rsp),%xmm9
               :  401688:	vmovdqa 0x28(%rsp),%xmm1
               :  40168e:	vmovaps %xmm12,0x38(%rsp)
               :  401694:	vpclmullqlqdq %xmm2,%xmm9,%xmm10
               :  40169a:	vmovdqa -0x58(%rsp),%xmm9
               :  4016a0:	vmovaps %xmm3,-0x8(%rsp)
               :  4016a6:	vmovdqa -0x28(%rsp),%xmm11
               :  4016ac:	vpclmullqlqdq %xmm5,%xmm1,%xmm1
               :  4016b2:	vpxor  %xmm15,%xmm1,%xmm1
               :  4016b7:	vpclmullqlqdq %xmm6,%xmm9,%xmm9
               :  4016bd:	vmovaps %xmm9,0x78(%rsp)
               :  4016c3:	vmovdqa -0x68(%rsp),%xmm9
               :  4016c9:	vpxor  0x78(%rsp),%xmm10,%xmm10
               :  4016cf:	vpclmullqlqdq %xmm0,%xmm11,%xmm11
               :  4016d5:	vpxor  0x68(%rsp),%xmm11,%xmm11
               :  4016db:	vpxor  %xmm11,%xmm1,%xmm1
               :  4016e0:	vpxor  %xmm10,%xmm1,%xmm1
               :  4016e5:	vpclmullqlqdq %xmm12,%xmm9,%xmm9
               :  4016eb:	vmovdqa -0x78(%rsp),%xmm12
               :  4016f1:	vmovdqa 0x28(%rsp),%xmm10
               :  4016f7:	vpclmullqlqdq %xmm13,%xmm12,%xmm12
               :  4016fd:	vpxor  %xmm12,%xmm9,%xmm9
               :  401702:	vpxor  %xmm9,%xmm1,%xmm12
               :  401707:	vmovdqa -0x18(%rsp),%xmm9
               :  40170d:	vpclmulhqhqdq %xmm5,%xmm10,%xmm3
               :  401713:	vmovdqa -0x28(%rsp),%xmm10
               :  401719:	vpclmulhqhqdq %xmm4,%xmm9,%xmm7
               :  40171f:	vmovdqa -0x48(%rsp),%xmm9
               :  401725:	vpxor  %xmm7,%xmm3,%xmm3
               :  401729:	vpshufd $0x4e,%xmm13,%xmm7
               :  40172f:	vpclmulhqhqdq %xmm0,%xmm10,%xmm0
               :  401735:	vmovdqa -0x38(%rsp),%xmm10
               :  40173b:	vpxor  %xmm7,%xmm13,%xmm7
               :  40173f:	vpclmulhqhqdq %xmm2,%xmm9,%xmm2
               :  401745:	vmovdqa -0x58(%rsp),%xmm9
               :  40174b:	vpclmulhqhqdq %xmm8,%xmm10,%xmm8
               :  401751:	vpxor  %xmm8,%xmm0,%xmm0
               :  401756:	vpxor  %xmm3,%xmm0,%xmm0
               :  40175a:	vpclmulhqhqdq %xmm6,%xmm9,%xmm6
               :  401760:	vmovdqa -0x68(%rsp),%xmm9
               :  401766:	vpxor  %xmm6,%xmm2,%xmm2
               :  40176a:	vpxor  %xmm2,%xmm0,%xmm0
               :  40176e:	vmovdqa -0x78(%rsp),%xmm10
               :  401774:	vpshufd $0x4e,0x18(%rsp),%xmm6
               :  40177b:	vpxor  0x18(%rsp),%xmm6,%xmm6
               :  401781:	vpshufd $0x4e,-0x8(%rsp),%xmm3
               :  401788:	vpclmulhqhqdq 0x38(%rsp),%xmm9,%xmm1
               :  401790:	vmovdqa 0x58(%rsp),%xmm15
               :  401796:	vpxor  -0x8(%rsp),%xmm3,%xmm3
               :  40179c:	vpclmulhqhqdq %xmm13,%xmm10,%xmm9
               :  4017a2:	vpxor  %xmm9,%xmm1,%xmm2
               :  4017a7:	vpxor  %xmm2,%xmm0,%xmm2
               :  4017ab:	vpshufd $0x4e,%xmm5,%xmm0
               :  4017b0:	vpxor  %xmm5,%xmm0,%xmm5
               :  4017b4:	vpshufd $0x4e,%xmm4,%xmm10
               :  4017b9:	vpxor  %xmm4,%xmm10,%xmm4
               :  4017bd:	vmovdqa 0x88(%rsp),%xmm0
               :  4017c6:	vpshufd $0x4e,0x8(%rsp),%xmm9
               :  4017cd:	vpxor  0x8(%rsp),%xmm9,%xmm9
               :  4017d3:	vpshufd $0x4e,%xmm15,%xmm8
               :  4017d9:	vpxor  %xmm15,%xmm8,%xmm8
               :  4017de:	vpclmullqlqdq %xmm5,%xmm0,%xmm5
               :  4017e4:	vmovdqa 0x48(%rsp),%xmm11
               :  4017ea:	vmovdqa 0x98(%rsp),%xmm0
               :  4017f3:	vpshufd $0x4e,%xmm11,%xmm1
               :  4017f9:	vpxor  %xmm11,%xmm1,%xmm1
               :  4017fe:	vpclmullqlqdq %xmm4,%xmm0,%xmm4
               :  401804:	vpxor  %xmm4,%xmm5,%xmm5
               :  401808:	vmovdqa 0xa8(%rsp),%xmm0
               :  401811:	vpclmullqlqdq %xmm6,%xmm0,%xmm6
               :  401817:	vmovdqa 0xb8(%rsp),%xmm0
               :  401820:	vpclmullqlqdq %xmm9,%xmm0,%xmm9
               :  401826:	vpxor  %xmm9,%xmm6,%xmm6
               :  40182b:	vpxor  %xmm6,%xmm5,%xmm5
               :  40182f:	vmovdqa 0xc8(%rsp),%xmm0
               :  401838:	vpclmullqlqdq %xmm3,%xmm0,%xmm3
               :  40183e:	vmovdqa 0xd8(%rsp),%xmm0
               :  401847:	vpclmullqlqdq %xmm8,%xmm0,%xmm8
               :  40184d:	vpxor  %xmm8,%xmm3,%xmm3
               :  401852:	vpxor  %xmm3,%xmm5,%xmm5
               :  401856:	vmovdqa 0xe8(%rsp),%xmm0
               :  40185f:	vpxor  %xmm2,%xmm12,%xmm3
               :  401863:	vpclmullqlqdq %xmm1,%xmm0,%xmm1
               :  401869:	vmovdqa 0xf8(%rsp),%xmm0
               :  401872:	vpclmullqlqdq %xmm7,%xmm0,%xmm7
               :  401878:	vpxor  %xmm7,%xmm1,%xmm1
               :  40187c:	vpxor  %xmm1,%xmm5,%xmm5
               :  401880:	vpxor  %xmm3,%xmm5,%xmm5
               :  401884:	vpslldq $0x8,%xmm5,%xmm9
               :  401889:	vpxor  %xmm9,%xmm12,%xmm9
               :  40188e:	vpsrld $0x1f,%xmm9,%xmm4
               :  401894:	vpslldq $0x4,%xmm4,%xmm0
               :  401899:	vpslld $0x1,%xmm9,%xmm12
               :  40189f:	vpor   %xmm12,%xmm0,%xmm9
               :  4018a4:	vpsrldq $0x8,%xmm5,%xmm3
               :  4018a9:	vpslld $0x1f,%xmm9,%xmm1
               :  4018af:	vpxor  %xmm3,%xmm2,%xmm2
               :  4018b3:	vpsrldq $0xc,%xmm4,%xmm5
               :  4018b8:	vpslld $0x19,%xmm9,%xmm0
               :  4018be:	vpslld $0x1e,%xmm9,%xmm4
               :  4018c4:	vpxor  %xmm4,%xmm1,%xmm1
               :  4018c8:	vpsrld $0x1f,%xmm2,%xmm3
               :  4018cd:	vpxor  %xmm0,%xmm1,%xmm0
               :  4018d1:	vpsrldq $0x4,%xmm0,%xmm4
               :  4018d6:	vpslldq $0xc,%xmm0,%xmm0
               :  4018db:	vpxor  %xmm0,%xmm9,%xmm0
               :  4018df:	vpslld $0x1,%xmm2,%xmm2
               :  4018e4:	vpsrld $0x2,%xmm0,%xmm15
               :  4018e9:	vpslldq $0x4,%xmm3,%xmm3
               :  4018ee:	vpsrld $0x1,%xmm0,%xmm1
               :  4018f3:	vpor   %xmm2,%xmm3,%xmm2
               :  4018f7:	vpor   %xmm5,%xmm2,%xmm2
               :  4018fb:	vpxor  %xmm0,%xmm2,%xmm2
               :  4018ff:	vpsrld $0x7,%xmm0,%xmm6
               :  401904:	vpxor  %xmm15,%xmm1,%xmm1
               :  401909:	vpxor  %xmm6,%xmm4,%xmm4
               :  40190d:	vpxor  %xmm4,%xmm1,%xmm1
               :  401911:	vpxor  %xmm2,%xmm1,%xmm15
               :  401915:	vmovdqa %xmm15,%xmm1
               :  401919:	cmp    %rcx,%rax
               :  40191c:	jne    4015e0 <AES_GCM_encrypt+0x9d0>
               :  401922:	mov    0x218(%rsp),%eax
               :  401929:	shl    $0x3,%r10d
               :  40192d:	vmovdqa 0x118(%rsp),%xmm10
               :  401936:	vmovdqa 0x28(%rsp),%xmm12
               :  40193c:	vmovaps %xmm13,0x28(%rsp)
               :  401942:	mov    0x218(%rsp),%ecx
               :  401949:	add    $0xf,%eax
               :  40194c:	test   %ecx,%ecx
     3  0.0015 :  40194e:	cmovns 0x218(%rsp),%eax
               :  401956:	sar    $0x4,%eax
               :  401959:	mov    %eax,%r11d
    10  0.0051 :  40195c:	cmp    %r10d,%eax
               :  40195f:	jle    4029f4 <AES_GCM_encrypt+0x1de4>
               :  401965:	vmovdqa 0x188(%rsp),%xmm5
               :  40196e:	lea    -0x1(%r11),%ecx
               :  401972:	movslq %r10d,%rbx
               :  401975:	sub    %r10d,%ecx
               :  401978:	mov    %rbx,%rax
               :  40197b:	lea    0x1(%rbx,%rcx,1),%rcx
               :  401980:	shl    $0x4,%rax
               :  401984:	shl    $0x4,%rcx
               :  401988:	add    %rdx,%rax
               :  40198b:	add    %rdx,%rcx
               :  40198e:	xchg   %ax,%ax
               :  401990:	vmovdqu (%rax),%xmm6
               :  401994:	add    $0x10,%rax
               :  401998:	vpshufb %xmm5,%xmm6,%xmm6
               :  40199d:	vpxor  %xmm6,%xmm15,%xmm0
               :  4019a1:	vpclmulhqlqdq %xmm12,%xmm0,%xmm3
               :  4019a7:	vpclmullqhqdq %xmm12,%xmm0,%xmm2
               :  4019ad:	vpxor  %xmm3,%xmm2,%xmm2
               :  4019b1:	vpslldq $0x8,%xmm2,%xmm15
               :  4019b6:	vpclmullqlqdq %xmm12,%xmm0,%xmm1
               :  4019bc:	vpclmulhqhqdq %xmm12,%xmm0,%xmm0
               :  4019c2:	vpxor  %xmm15,%xmm1,%xmm15
               :  4019c7:	vpsrld $0x1f,%xmm15,%xmm4
               :  4019cd:	vpsrldq $0xc,%xmm4,%xmm8
               :  4019d2:	vpslld $0x1,%xmm15,%xmm15
               :  4019d8:	vpslldq $0x4,%xmm4,%xmm4
               :  4019dd:	vpor   %xmm15,%xmm4,%xmm3
               :  4019e2:	vpsrldq $0x8,%xmm2,%xmm2
               :  4019e7:	vpslld $0x1f,%xmm3,%xmm7
               :  4019ec:	vpxor  %xmm2,%xmm0,%xmm0
               :  4019f0:	vpslld $0x19,%xmm3,%xmm15
               :  4019f5:	vpslld $0x1e,%xmm3,%xmm4
               :  4019fa:	vpsrld $0x1f,%xmm0,%xmm2
               :  4019ff:	vpxor  %xmm4,%xmm7,%xmm4
               :  401a03:	vpxor  %xmm15,%xmm4,%xmm4
               :  401a08:	vpslldq $0xc,%xmm4,%xmm15
               :  401a0d:	vpxor  %xmm15,%xmm3,%xmm15
               :  401a12:	vpslld $0x1,%xmm0,%xmm1
               :  401a17:	vpsrldq $0x4,%xmm4,%xmm7
               :  401a1c:	vpsrld $0x1,%xmm15,%xmm3
               :  401a22:	vpsrld $0x2,%xmm15,%xmm0
               :  401a28:	vpsrld $0x7,%xmm15,%xmm4
               :  401a2e:	vpxor  %xmm0,%xmm3,%xmm0
               :  401a32:	vpslldq $0x4,%xmm2,%xmm2
               :  401a37:	vpor   %xmm1,%xmm2,%xmm2
               :  401a3b:	vpor   %xmm8,%xmm2,%xmm1
               :  401a40:	vpxor  %xmm4,%xmm7,%xmm2
               :  401a44:	vpxor  %xmm15,%xmm1,%xmm1
               :  401a49:	vpxor  %xmm0,%xmm2,%xmm0
               :  401a4d:	vpxor  %xmm0,%xmm1,%xmm15
               :  401a51:	vmovdqa %xmm15,%xmm1
               :  401a55:	cmp    %rcx,%rax
               :  401a58:	jne    401990 <AES_GCM_encrypt+0xd80>
               :  401a5e:	vmovaps %xmm6,0x28(%rsp)
    10  0.0051 :  401a64:	testb  $0xf,0x218(%rsp)
               :  401a6c:	je     401bae <AES_GCM_encrypt+0xf9e>
               :  401a72:	mov    0x218(%rsp),%ecx
               :  401a79:	vpxor  %xmm0,%xmm0,%xmm0
    12  0.0061 :  401a7d:	vmovaps %xmm0,0x1c8(%rsp)
               :  401a86:	mov    0x218(%rsp),%eax
               :  401a8d:	sar    $0x1f,%ecx
               :  401a90:	shr    $0x1c,%ecx
     8  0.0041 :  401a93:	add    %ecx,%eax
               :  401a95:	and    $0xf,%eax
               :  401a98:	sub    %ecx,%eax
               :  401a9a:	test   %eax,%eax
               :  401a9c:	jle    4028d6 <AES_GCM_encrypt+0x1cc6>
    10  0.0051 :  401aa2:	lea    -0x1(%rax),%ecx
               :  401aa5:	mov    %r11d,%eax
               :  401aa8:	lea    0x1c8(%rsp),%r10
               :  401ab0:	shl    $0x4,%eax
     3  0.0015 :  401ab3:	add    $0x1,%rcx
               :  401ab7:	cltq   
               :  401ab9:	mov    %r10,%r11
               :  401abc:	add    %rax,%rdx
     6  0.0031 :  401abf:	mov    %rdx,%rax
               :  401ac2:	cmp    $0x8,%ecx
               :  401ac5:	jae    4028df <AES_GCM_encrypt+0x1ccf>
               :  401acb:	xor    %edx,%edx
               :  401acd:	test   $0x4,%cl
               :  401ad0:	jne    402868 <AES_GCM_encrypt+0x1c58>
               :  401ad6:	test   $0x2,%cl
               :  401ad9:	jne    40284f <AES_GCM_encrypt+0x1c3f>
     6  0.0031 :  401adf:	and    $0x1,%ecx
               :  401ae2:	jne    402842 <AES_GCM_encrypt+0x1c32>
               :  401ae8:	vmovdqa 0x1c8(%rsp),%xmm0
    91  0.0463 :  401af1:	vpshufb 0x188(%rsp),%xmm0,%xmm0
    14  0.0071 :  401afb:	vpxor  %xmm0,%xmm1,%xmm1
     6  0.0031 :  401aff:	vpclmullqhqdq %xmm12,%xmm1,%xmm2
    65  0.0330 :  401b05:	vpclmulhqlqdq %xmm12,%xmm1,%xmm3
    10  0.0051 :  401b0b:	vpxor  %xmm3,%xmm2,%xmm6
    16  0.0081 :  401b0f:	vpslldq $0x8,%xmm6,%xmm4
     8  0.0041 :  401b14:	vmovaps %xmm0,0x28(%rsp)
               :  401b1a:	vpclmullqlqdq %xmm12,%xmm1,%xmm0
     8  0.0041 :  401b20:	vpxor  %xmm4,%xmm0,%xmm0
     7  0.0036 :  401b24:	vpsrld $0x1f,%xmm0,%xmm2
     4  0.0020 :  401b29:	vpclmulhqhqdq %xmm12,%xmm1,%xmm1
               :  401b2f:	vpsrldq $0xc,%xmm2,%xmm7
    13  0.0066 :  401b34:	vpslld $0x1,%xmm0,%xmm0
               :  401b39:	vpslldq $0x4,%xmm2,%xmm2
     3  0.0015 :  401b3e:	vpor   %xmm0,%xmm2,%xmm0
     8  0.0041 :  401b42:	vpsrldq $0x8,%xmm6,%xmm6
               :  401b47:	vpslld $0x1e,%xmm0,%xmm4
     7  0.0036 :  401b4c:	vpxor  %xmm6,%xmm1,%xmm6
               :  401b50:	vpslld $0x1f,%xmm0,%xmm2
     8  0.0041 :  401b55:	vpslld $0x19,%xmm0,%xmm3
     4  0.0020 :  401b5a:	vpxor  %xmm4,%xmm2,%xmm2
     1 5.1e-04 :  401b5e:	vpsrld $0x1f,%xmm6,%xmm1
     2  0.0010 :  401b63:	vpxor  %xmm3,%xmm2,%xmm3
    13  0.0066 :  401b67:	vpsrldq $0x4,%xmm3,%xmm2
    11  0.0056 :  401b6c:	vpslldq $0xc,%xmm3,%xmm3
     8  0.0041 :  401b71:	vpxor  %xmm3,%xmm0,%xmm0
     4  0.0020 :  401b75:	vpslld $0x1,%xmm6,%xmm6
               :  401b7a:	vpsrld $0x1,%xmm0,%xmm3
    11  0.0056 :  401b7f:	vpsrld $0x2,%xmm0,%xmm4
     4  0.0020 :  401b84:	vpsrld $0x7,%xmm0,%xmm5
     3  0.0015 :  401b89:	vpslldq $0x4,%xmm1,%xmm1
               :  401b8e:	vpxor  %xmm5,%xmm2,%xmm2
    13  0.0066 :  401b92:	vpor   %xmm6,%xmm1,%xmm1
               :  401b96:	vpor   %xmm7,%xmm1,%xmm1
               :  401b9a:	vpxor  %xmm0,%xmm1,%xmm0
     1 5.1e-04 :  401b9e:	vpxor  %xmm4,%xmm3,%xmm1
     7  0.0036 :  401ba2:	vpxor  %xmm1,%xmm2,%xmm2
               :  401ba6:	vpxor  %xmm2,%xmm0,%xmm1
     9  0.0046 :  401baa:	vmovdqa %xmm1,%xmm15
               :  401bae:	vmovdqa 0x108(%rsp),%xmm5
               :  401bb7:	mov    0x1c0(%rsp),%ebx
               :  401bbe:	vpshufb 0x1e49(%rip),%xmm5,%xmm2        # 403a10 <_IO_stdin_used+0x20>
     6  0.0031 :  401bc7:	vpaddd 0x1e51(%rip),%xmm2,%xmm0        # 403a20 <_IO_stdin_used+0x30>
               :  401bcf:	vmovaps %xmm0,0x68(%rsp)
               :  401bd5:	vpaddd 0x1e53(%rip),%xmm2,%xmm0        # 403a30 <_IO_stdin_used+0x40>
     7  0.0036 :  401bdd:	mov    %ebx,%eax
               :  401bdf:	vmovaps %xmm0,0x18(%rsp)
               :  401be5:	add    $0x7f,%eax
               :  401be8:	test   %ebx,%ebx
     8  0.0041 :  401bea:	vpaddd 0x1e4e(%rip),%xmm2,%xmm0        # 403a40 <_IO_stdin_used+0x50>
     1 5.1e-04 :  401bf2:	cmovns %ebx,%eax
               :  401bf5:	vmovaps %xmm0,0x8(%rsp)
    13  0.0066 :  401bfb:	vpaddd 0x1e4d(%rip),%xmm2,%xmm0        # 403a50 <_IO_stdin_used+0x60>
               :  401c03:	sar    $0x7,%eax
               :  401c06:	vmovaps %xmm0,-0x8(%rsp)
     3  0.0015 :  401c0c:	vpaddd 0x1e4c(%rip),%xmm2,%xmm0        # 403a60 <_IO_stdin_used+0x70>
     4  0.0020 :  401c14:	mov    %eax,0x1c4(%rsp)
               :  401c1b:	vmovaps %xmm0,0xb8(%rsp)
               :  401c24:	vpaddd 0x1e44(%rip),%xmm2,%xmm0        # 403a70 <_IO_stdin_used+0x80>
     2  0.0010 :  401c2c:	vmovaps %xmm0,0xa8(%rsp)
     4  0.0020 :  401c35:	vpaddd 0x1e43(%rip),%xmm2,%xmm0        # 403a80 <_IO_stdin_used+0x90>
               :  401c3d:	vmovaps %xmm0,0x98(%rsp)
               :  401c46:	vpaddd 0x1e42(%rip),%xmm2,%xmm0        # 403a90 <_IO_stdin_used+0xa0>
               :  401c4e:	vmovaps %xmm0,0x88(%rsp)
     4  0.0020 :  401c57:	test   %eax,%eax
               :  401c59:	jle    4029fc <AES_GCM_encrypt+0x1dec>
               :  401c5f:	vpshufd $0x4e,%xmm12,%xmm0
               :  401c65:	vpxor  %xmm0,%xmm12,%xmm7
               :  401c69:	vmovaps %xmm7,0x108(%rsp)
     6  0.0031 :  401c72:	vmovdqa -0x18(%rsp),%xmm7
               :  401c78:	sub    $0x1,%eax
               :  401c7b:	mov    0x1a0(%rsp),%r14
     2  0.0010 :  401c83:	vmovaps %xmm12,0x78(%rsp)
     4  0.0020 :  401c89:	vmovdqa %xmm15,%xmm12
               :  401c8e:	vpshufd $0x4e,%xmm7,%xmm0
               :  401c93:	vpxor  %xmm7,%xmm0,%xmm5
     3  0.0015 :  401c97:	vmovdqa -0x28(%rsp),%xmm7
     4  0.0020 :  401c9d:	vmovaps %xmm5,0x118(%rsp)
               :  401ca6:	vmovdqa 0x188(%rsp),%xmm13
               :  401caf:	add    $0x1,%rax
     1 5.1e-04 :  401cb3:	vpshufd $0x4e,%xmm7,%xmm0
    13  0.0066 :  401cb8:	vpxor  %xmm7,%xmm0,%xmm7
               :  401cbc:	shl    $0x7,%rax
               :  401cc0:	vmovaps %xmm7,0x128(%rsp)
     3  0.0015 :  401cc9:	vmovdqa -0x38(%rsp),%xmm7
     9  0.0046 :  401ccf:	mov    %rax,0x198(%rsp)
               :  401cd7:	lea    -0x3(%r9),%eax
               :  401cdb:	shl    $0x4,%r14
               :  401cdf:	lea    -0x10(%r8,%r14,1),%r15
     8  0.0041 :  401ce4:	shr    %eax
               :  401ce6:	add    %r8,%r14
               :  401ce9:	vpshufd $0x4e,%xmm7,%xmm0
               :  401cee:	vpxor  %xmm7,%xmm0,%xmm5
     8  0.0041 :  401cf2:	shl    $0x5,%rax
               :  401cf6:	vmovaps %xmm5,0x138(%rsp)
               :  401cff:	vmovdqa -0x48(%rsp),%xmm5
     1 5.1e-04 :  401d05:	lea    0x30(%r8,%rax,1),%rdx
     8  0.0041 :  401d0a:	xor    %eax,%eax
               :  401d0c:	vpshufd $0x4e,%xmm5,%xmm0
               :  401d11:	vpxor  %xmm5,%xmm0,%xmm7
               :  401d15:	vmovaps %xmm7,0x148(%rsp)
     9  0.0046 :  401d1e:	vmovdqa -0x58(%rsp),%xmm7
               :  401d24:	vpshufd $0x4e,%xmm7,%xmm0
               :  401d29:	vpxor  %xmm7,%xmm0,%xmm5
     2  0.0010 :  401d2d:	vmovaps %xmm5,0x158(%rsp)
     9  0.0046 :  401d36:	vmovdqa -0x68(%rsp),%xmm5
               :  401d3c:	vpshufd $0x4e,%xmm5,%xmm0
               :  401d41:	vpxor  %xmm5,%xmm0,%xmm7
               :  401d45:	vmovaps %xmm7,0x168(%rsp)
     7  0.0036 :  401d4e:	vmovdqa -0x78(%rsp),%xmm7
               :  401d54:	vpshufd $0x4e,%xmm7,%xmm0
               :  401d59:	vpxor  %xmm7,%xmm0,%xmm5
     1 5.1e-04 :  401d5d:	vmovaps %xmm5,0x178(%rsp)
     6  0.0031 :  401d66:	nopw   %cs:0x0(%rax,%rax,1)
    45  0.0229 :  401d70:	vmovdqa 0x68(%rsp),%xmm0
               :  401d76:	vmovdqa 0x18(%rsp),%xmm7
     1 5.1e-04 :  401d7c:	vpshufb 0x1c8b(%rip),%xmm0,%xmm2        # 403a10 <_IO_stdin_used+0x20>
    58  0.0295 :  401d85:	vmovdqa 0x8(%rsp),%xmm6
               :  401d8b:	vpaddd 0x1cfd(%rip),%xmm0,%xmm0        # 403a90 <_IO_stdin_used+0xa0>
     1 5.1e-04 :  401d93:	vpxor  %xmm2,%xmm10,%xmm2
     8  0.0041 :  401d97:	vmovdqa 0xb8(%rsp),%xmm9
    48  0.0244 :  401da0:	vpshufb 0x1c67(%rip),%xmm7,%xmm8        # 403a10 <_IO_stdin_used+0x20>
     1 5.1e-04 :  401da9:	vpxor  %xmm8,%xmm10,%xmm8
    10  0.0051 :  401dae:	vpshufb 0x1c59(%rip),%xmm6,%xmm7        # 403a10 <_IO_stdin_used+0x20>
    53  0.0269 :  401db7:	vmovaps %xmm0,0x68(%rsp)
     1 5.1e-04 :  401dbd:	vmovdqa 0x18(%rsp),%xmm0
    10  0.0051 :  401dc3:	vpaddd 0x1cc5(%rip),%xmm0,%xmm0        # 403a90 <_IO_stdin_used+0xa0>
    41  0.0208 :  401dcb:	vmovdqa -0x8(%rsp),%xmm6
               :  401dd1:	vpxor  %xmm7,%xmm10,%xmm7
     2  0.0010 :  401dd5:	vpshufb 0x1c32(%rip),%xmm9,%xmm5        # 403a10 <_IO_stdin_used+0x20>
    54  0.0275 :  401dde:	vpxor  %xmm5,%xmm10,%xmm5
               :  401de2:	vmovdqa 0xa8(%rsp),%xmm15
               :  401deb:	vmovaps %xmm0,0x18(%rsp)
     8  0.0041 :  401df1:	vpshufb 0x1c16(%rip),%xmm6,%xmm6        # 403a10 <_IO_stdin_used+0x20>
    57  0.0290 :  401dfa:	vmovdqa 0x8(%rsp),%xmm0
               :  401e00:	vpaddd 0x1c88(%rip),%xmm0,%xmm0        # 403a90 <_IO_stdin_used+0xa0>
     4  0.0020 :  401e08:	vpxor  %xmm6,%xmm10,%xmm6
    58  0.0295 :  401e0c:	vmovdqa 0x98(%rsp),%xmm11
               :  401e15:	vpshufb 0x1bf2(%rip),%xmm15,%xmm4        # 403a10 <_IO_stdin_used+0x20>
     6  0.0031 :  401e1e:	vpxor  %xmm4,%xmm10,%xmm4
    59  0.0300 :  401e22:	vmovdqa 0x88(%rsp),%xmm14
               :  401e2b:	vmovaps %xmm0,0x8(%rsp)
     2  0.0010 :  401e31:	vpshufb 0x1bd6(%rip),%xmm11,%xmm3        # 403a10 <_IO_stdin_used+0x20>
    50  0.0254 :  401e3a:	vmovdqa -0x8(%rsp),%xmm0
               :  401e40:	vpaddd 0x1c48(%rip),%xmm0,%xmm0        # 403a90 <_IO_stdin_used+0xa0>
     2  0.0010 :  401e48:	vpxor  %xmm3,%xmm10,%xmm3
     7  0.0036 :  401e4c:	vpshufb 0x1bbb(%rip),%xmm14,%xmm1        # 403a10 <_IO_stdin_used+0x20>
    62  0.0315 :  401e55:	vpxor  %xmm1,%xmm10,%xmm1
     4  0.0020 :  401e59:	vmovaps %xmm0,-0x8(%rsp)
     8  0.0041 :  401e5f:	vmovdqa 0x1c29(%rip),%xmm0        # 403a90 <_IO_stdin_used+0xa0>
    62  0.0315 :  401e67:	vpaddd %xmm9,%xmm0,%xmm0
               :  401e6c:	vmovaps %xmm0,0xb8(%rsp)
     2  0.0010 :  401e75:	vmovdqa 0x1c13(%rip),%xmm0        # 403a90 <_IO_stdin_used+0xa0>
     7  0.0036 :  401e7d:	vpaddd %xmm15,%xmm0,%xmm0
    48  0.0244 :  401e82:	vmovaps %xmm0,0xa8(%rsp)
     1 5.1e-04 :  401e8b:	vmovdqa 0x1bfd(%rip),%xmm0        # 403a90 <_IO_stdin_used+0xa0>
               :  401e93:	vpaddd %xmm11,%xmm0,%xmm0
    10  0.0051 :  401e98:	vmovaps %xmm0,0x98(%rsp)
    37  0.0188 :  401ea1:	vmovdqa 0x1be7(%rip),%xmm0        # 403a90 <_IO_stdin_used+0xa0>
               :  401ea9:	vpaddd %xmm14,%xmm0,%xmm0
     6  0.0031 :  401eae:	vmovaps %xmm0,0x88(%rsp)
     4  0.0020 :  401eb7:	cmp    $0x2,%r9d
               :  401ebb:	jle    401f2a <AES_GCM_encrypt+0x131a>
    51  0.0259 :  401ebd:	lea    0x10(%r8),%rcx
               :  401ec1:	nopl   0x0(%rax)
     3  0.0015 :  401ec8:	vmovdqa (%rcx),%xmm9
    21  0.0107 :  401ecc:	add    $0x20,%rcx
   139  0.0707 :  401ed0:	vmovdqa -0x10(%rcx),%xmm0
    59  0.0300 :  401ed5:	vaesenc %xmm9,%xmm2,%xmm2
    63  0.0320 :  401eda:	vaesenc %xmm9,%xmm8,%xmm8
   333  0.1693 :  401edf:	vaesenc %xmm9,%xmm7,%xmm7
   255  0.1296 :  401ee4:	vaesenc %xmm9,%xmm6,%xmm6
   105  0.0534 :  401ee9:	vaesenc %xmm9,%xmm5,%xmm5
   274  0.1393 :  401eee:	vaesenc %xmm9,%xmm4,%xmm4
   328  0.1668 :  401ef3:	vaesenc %xmm9,%xmm3,%xmm3
   257  0.1307 :  401ef8:	vaesenc %xmm9,%xmm1,%xmm1
   131  0.0666 :  401efd:	vaesenc %xmm0,%xmm2,%xmm2
   257  0.1307 :  401f02:	vaesenc %xmm0,%xmm8,%xmm8
   344  0.1749 :  401f07:	vaesenc %xmm0,%xmm7,%xmm7
   268  0.1362 :  401f0c:	vaesenc %xmm0,%xmm6,%xmm6
   103  0.0524 :  401f11:	vaesenc %xmm0,%xmm5,%xmm5
   254  0.1291 :  401f16:	vaesenc %xmm0,%xmm4,%xmm4
   294  0.1495 :  401f1b:	vaesenc %xmm0,%xmm3,%xmm3
   287  0.1459 :  401f20:	vaesenc %xmm0,%xmm1,%xmm1
    88  0.0447 :  401f25:	cmp    %rdx,%rcx
               :  401f28:	jne    401ec8 <AES_GCM_encrypt+0x12b8>
     1 5.1e-04 :  401f2a:	vmovdqa (%r15),%xmm0
     8  0.0041 :  401f2f:	vmovdqu 0x10(%rdi,%rax,1),%xmm15
    31  0.0158 :  401f35:	vaesenc %xmm0,%xmm2,%xmm9
    40  0.0203 :  401f3a:	vaesenc %xmm0,%xmm8,%xmm8
    77  0.0391 :  401f3f:	vmovdqu 0x40(%rdi,%rax,1),%xmm2
    97  0.0493 :  401f45:	vaesenc %xmm0,%xmm7,%xmm7
    79  0.0402 :  401f4a:	vaesenc %xmm0,%xmm6,%xmm6
    46  0.0234 :  401f4f:	vaesenc %xmm0,%xmm5,%xmm5
    80  0.0407 :  401f54:	vaesenc %xmm0,%xmm4,%xmm4
    78  0.0397 :  401f59:	vaesenc %xmm0,%xmm3,%xmm3
    27  0.0137 :  401f5e:	vaesenc %xmm0,%xmm1,%xmm0
    49  0.0249 :  401f63:	vmovdqa (%r14),%xmm1
               :  401f68:	vmovdqu 0x20(%rdi,%rax,1),%xmm14
     3  0.0015 :  401f6e:	vmovdqu 0x30(%rdi,%rax,1),%xmm11
     4  0.0020 :  401f74:	vaesenclast %xmm1,%xmm6,%xmm6
   161  0.0819 :  401f79:	vmovaps %xmm2,0x28(%rsp)
               :  401f7f:	vaesenclast %xmm1,%xmm4,%xmm4
   156  0.0793 :  401f84:	vmovdqu 0x70(%rdi,%rax,1),%xmm2
    23  0.0117 :  401f8a:	vaesenclast %xmm1,%xmm3,%xmm3
    65  0.0330 :  401f8f:	vaesenclast %xmm1,%xmm9,%xmm9
               :  401f94:	vaesenclast %xmm1,%xmm8,%xmm8
    18  0.0092 :  401f99:	vmovdqu 0x50(%rdi,%rax,1),%xmm10
     1 5.1e-04 :  401f9f:	vaesenclast %xmm1,%xmm7,%xmm7
    24  0.0122 :  401fa4:	vaesenclast %xmm1,%xmm5,%xmm5
    14  0.0071 :  401fa9:	vaesenclast %xmm1,%xmm0,%xmm1
    50  0.0254 :  401fae:	vpxor  %xmm11,%xmm6,%xmm11
     2  0.0010 :  401fb3:	vpxor  %xmm15,%xmm8,%xmm8
    11  0.0056 :  401fb8:	vpxor  %xmm14,%xmm7,%xmm7
    13  0.0066 :  401fbd:	vpxor  %xmm2,%xmm1,%xmm1
    32  0.0163 :  401fc1:	vmovdqu 0x60(%rdi,%rax,1),%xmm0
    12  0.0061 :  401fc7:	vpxor  (%rdi,%rax,1),%xmm9,%xmm9
    20  0.0102 :  401fcc:	vpxor  %xmm10,%xmm4,%xmm10
    35  0.0178 :  401fd1:	vmovups %xmm9,(%rsi,%rax,1)
     6  0.0031 :  401fd6:	vmovups %xmm8,0x10(%rsi,%rax,1)
     8  0.0041 :  401fdc:	vpshufb %xmm13,%xmm11,%xmm4
    15  0.0076 :  401fe1:	vpshufb %xmm13,%xmm9,%xmm9
    27  0.0137 :  401fe6:	vpxor  %xmm9,%xmm12,%xmm14
     1 5.1e-04 :  401feb:	vmovups %xmm7,0x20(%rsi,%rax,1)
     7  0.0036 :  401ff1:	vpxor  %xmm0,%xmm3,%xmm0
    65  0.0330 :  401ff5:	vpshufb %xmm13,%xmm7,%xmm7
    30  0.0153 :  401ffa:	vmovdqa %xmm7,%xmm6
               :  401ffe:	vmovups %xmm11,0x30(%rsi,%rax,1)
    18  0.0092 :  402004:	vpshufb %xmm13,%xmm8,%xmm15
    33  0.0168 :  402009:	vpshufb %xmm13,%xmm10,%xmm3
    25  0.0127 :  40200e:	vpxor  0x28(%rsp),%xmm5,%xmm5
               :  402014:	vmovups %xmm10,0x50(%rsi,%rax,1)
     8  0.0041 :  40201a:	vmovups %xmm5,0x40(%rsi,%rax,1)
    39  0.0198 :  402020:	vpshufb %xmm13,%xmm5,%xmm5
    21  0.0107 :  402025:	vmovups %xmm0,0x60(%rsi,%rax,1)
     1 5.1e-04 :  40202b:	vpshufb %xmm13,%xmm0,%xmm0
    53  0.0269 :  402030:	vmovups %xmm1,0x70(%rsi,%rax,1)
     2  0.0010 :  402036:	vmovdqa 0x78(%rsp),%xmm11
     1 5.1e-04 :  40203c:	vpshufb %xmm13,%xmm1,%xmm1
    66  0.0336 :  402041:	sub    $0xffffffffffffff80,%rax
     3  0.0015 :  402045:	vmovdqa -0x18(%rsp),%xmm9
               :  40204b:	vmovaps %xmm4,0x38(%rsp)
     3  0.0015 :  402051:	vmovdqa -0x38(%rsp),%xmm12
    65  0.0330 :  402057:	vmovaps %xmm5,0x48(%rsp)
     2  0.0010 :  40205d:	vmovaps %xmm7,0xc8(%rsp)
               :  402066:	vmovdqa %xmm5,%xmm7
     6  0.0031 :  40206a:	vmovdqa %xmm3,%xmm5
    55  0.0280 :  40206e:	vpclmullqlqdq %xmm7,%xmm12,%xmm12
   189  0.0961 :  402074:	vmovaps %xmm3,0x58(%rsp)
               :  40207a:	vpclmullqlqdq %xmm1,%xmm11,%xmm3
   107  0.0544 :  402080:	vpclmullqlqdq %xmm0,%xmm9,%xmm11
   109  0.0554 :  402086:	vmovaps %xmm12,0xe8(%rsp)
     2  0.0010 :  40208f:	vmovdqa -0x48(%rsp),%xmm12
               :  402095:	vmovaps %xmm11,0xd8(%rsp)
    53  0.0269 :  40209e:	vmovdqa -0x28(%rsp),%xmm11
               :  4020a4:	vmovaps %xmm15,0x28(%rsp)
               :  4020aa:	vmovdqa -0x58(%rsp),%xmm9
               :  4020b0:	vpclmullqlqdq %xmm4,%xmm12,%xmm10
    45  0.0229 :  4020b6:	vpxor  0xd8(%rsp),%xmm3,%xmm3
   296  0.1505 :  4020bf:	vpclmullqlqdq %xmm5,%xmm11,%xmm11
               :  4020c5:	vpxor  0xe8(%rsp),%xmm11,%xmm11
    69  0.0351 :  4020ce:	vpxor  %xmm11,%xmm3,%xmm3
     1 5.1e-04 :  4020d3:	vpclmullqlqdq %xmm6,%xmm9,%xmm12
    67  0.0341 :  4020d9:	vmovaps %xmm12,0xf8(%rsp)
     1 5.1e-04 :  4020e2:	vmovdqa -0x68(%rsp),%xmm12
               :  4020e8:	vpxor  0xf8(%rsp),%xmm10,%xmm10
     1 5.1e-04 :  4020f1:	vpxor  %xmm10,%xmm3,%xmm3
    61  0.0310 :  4020f6:	vmovdqa 0x78(%rsp),%xmm10
               :  4020fc:	vpclmullqlqdq %xmm15,%xmm12,%xmm9
    74  0.0376 :  402102:	vmovdqa -0x78(%rsp),%xmm12
     1 5.1e-04 :  402108:	vpclmulhqhqdq %xmm1,%xmm10,%xmm2
    63  0.0320 :  40210e:	vmovdqa -0x28(%rsp),%xmm10
               :  402114:	vpclmullqlqdq %xmm14,%xmm12,%xmm12
    52  0.0264 :  40211a:	vpxor  %xmm12,%xmm9,%xmm9
               :  40211f:	vpxor  %xmm9,%xmm3,%xmm11
               :  402124:	vmovdqa -0x18(%rsp),%xmm9
               :  40212a:	vmovdqa 0xc8(%rsp),%xmm12
    70  0.0356 :  402133:	vpclmulhqhqdq %xmm5,%xmm10,%xmm5
               :  402139:	vmovdqa -0x38(%rsp),%xmm10
    71  0.0361 :  40213f:	vpclmulhqhqdq %xmm0,%xmm9,%xmm8
               :  402145:	vpxor  %xmm8,%xmm2,%xmm2
    62  0.0315 :  40214a:	vmovdqa -0x58(%rsp),%xmm9
               :  402150:	vpshufd $0x4e,%xmm12,%xmm8
               :  402156:	vpxor  %xmm12,%xmm8,%xmm8
               :  40215b:	vpclmulhqhqdq %xmm7,%xmm10,%xmm7
    58  0.0295 :  402161:	vmovdqa -0x48(%rsp),%xmm10
     2  0.0010 :  402167:	vpxor  %xmm7,%xmm5,%xmm5
    66  0.0336 :  40216b:	vpxor  %xmm5,%xmm2,%xmm2
               :  40216f:	vpclmulhqhqdq %xmm6,%xmm9,%xmm6
    71  0.0361 :  402175:	vpshufd $0x4e,0x38(%rsp),%xmm5
               :  40217c:	vpxor  0x38(%rsp),%xmm5,%xmm5
               :  402182:	vpshufd $0x4e,%xmm14,%xmm7
    77  0.0391 :  402188:	vpclmulhqhqdq %xmm4,%xmm10,%xmm4
     1 5.1e-04 :  40218e:	vmovdqa -0x68(%rsp),%xmm10
    56  0.0285 :  402194:	vpxor  %xmm6,%xmm4,%xmm4
               :  402198:	vpshufd $0x4e,%xmm1,%xmm6
               :  40219d:	vpxor  %xmm1,%xmm6,%xmm1
               :  4021a1:	vpxor  %xmm4,%xmm2,%xmm2
    60  0.0305 :  4021a5:	vpxor  %xmm7,%xmm14,%xmm7
               :  4021a9:	vmovdqa 0x108(%rsp),%xmm6
               :  4021b2:	vpclmulhqhqdq %xmm15,%xmm10,%xmm3
    68  0.0346 :  4021b8:	vmovdqa -0x78(%rsp),%xmm10
               :  4021be:	vpclmullqlqdq %xmm1,%xmm6,%xmm1
    70  0.0356 :  4021c4:	vmovdqa 0x118(%rsp),%xmm6
               :  4021cd:	vpclmulhqhqdq %xmm14,%xmm10,%xmm9
    67  0.0341 :  4021d3:	vpxor  %xmm9,%xmm3,%xmm4
               :  4021d8:	vpshufd $0x4e,%xmm0,%xmm9
               :  4021dd:	vpxor  %xmm0,%xmm9,%xmm0
    63  0.0320 :  4021e1:	vpclmullqlqdq %xmm0,%xmm6,%xmm0
     1 5.1e-04 :  4021e7:	vpxor  %xmm4,%xmm2,%xmm4
    56  0.0285 :  4021eb:	vpshufd $0x4e,0x58(%rsp),%xmm2
     1 5.1e-04 :  4021f2:	vmovdqa 0x128(%rsp),%xmm6
     3  0.0015 :  4021fb:	vpxor  0x58(%rsp),%xmm2,%xmm2
    55  0.0280 :  402201:	vpshufd $0x4e,0x48(%rsp),%xmm10
               :  402208:	vpxor  0x48(%rsp),%xmm10,%xmm10
     6  0.0031 :  40220e:	vpxor  %xmm0,%xmm1,%xmm1
    70  0.0356 :  402212:	vpclmullqlqdq %xmm2,%xmm6,%xmm2
     1 5.1e-04 :  402218:	vpshufd $0x4e,%xmm15,%xmm3
    50  0.0254 :  40221e:	vpxor  %xmm15,%xmm3,%xmm3
               :  402223:	vmovdqa 0x138(%rsp),%xmm6
               :  40222c:	vpclmullqlqdq %xmm10,%xmm6,%xmm10
    67  0.0341 :  402232:	vpxor  %xmm10,%xmm2,%xmm2
               :  402237:	vpxor  %xmm1,%xmm2,%xmm2
    47  0.0239 :  40223b:	vmovdqa 0x148(%rsp),%xmm6
     3  0.0015 :  402244:	vpxor  %xmm4,%xmm11,%xmm1
     1 5.1e-04 :  402248:	vpclmullqlqdq %xmm5,%xmm6,%xmm5
    62  0.0315 :  40224e:	vmovdqa 0x158(%rsp),%xmm6
     1 5.1e-04 :  402257:	vpclmullqlqdq %xmm8,%xmm6,%xmm8
    63  0.0320 :  40225d:	vpxor  %xmm8,%xmm5,%xmm5
    60  0.0305 :  402262:	vpxor  %xmm5,%xmm2,%xmm2
    49  0.0249 :  402266:	vmovdqa 0x168(%rsp),%xmm6
               :  40226f:	vpclmullqlqdq %xmm3,%xmm6,%xmm3
    60  0.0305 :  402275:	vmovdqa 0x178(%rsp),%xmm6
               :  40227e:	vpclmullqlqdq %xmm7,%xmm6,%xmm7
    73  0.0371 :  402284:	vpxor  %xmm7,%xmm3,%xmm3
    75  0.0381 :  402288:	vpxor  %xmm3,%xmm2,%xmm2
    52  0.0264 :  40228c:	vpxor  %xmm1,%xmm2,%xmm2
    64  0.0325 :  402290:	vpslldq $0x8,%xmm2,%xmm3
    66  0.0336 :  402295:	vpsrldq $0x8,%xmm2,%xmm1
    78  0.0397 :  40229a:	vpxor  %xmm3,%xmm11,%xmm3
    17  0.0086 :  40229e:	vpsrld $0x1f,%xmm3,%xmm2
    24  0.0122 :  4022a3:	vpxor  %xmm1,%xmm4,%xmm4
    23  0.0117 :  4022a7:	vpslldq $0x4,%xmm2,%xmm0
    26  0.0132 :  4022ac:	vpslld $0x1,%xmm3,%xmm11
               :  4022b1:	vpor   %xmm11,%xmm0,%xmm3
    67  0.0341 :  4022b6:	vpsrldq $0xc,%xmm2,%xmm6
     1 5.1e-04 :  4022bb:	vpslld $0x1e,%xmm3,%xmm5
   109  0.0554 :  4022c0:	vpslld $0x1f,%xmm3,%xmm2
    11  0.0056 :  4022c5:	vpslld $0x19,%xmm3,%xmm0
    65  0.0330 :  4022ca:	vpxor  %xmm5,%xmm2,%xmm2
               :  4022ce:	vpsrld $0x1f,%xmm4,%xmm1
               :  4022d3:	vpxor  %xmm0,%xmm2,%xmm0
    43  0.0219 :  4022d7:	vpsrldq $0x4,%xmm0,%xmm5
    71  0.0361 :  4022dc:	vpslldq $0xc,%xmm0,%xmm0
    48  0.0244 :  4022e1:	vpxor  %xmm0,%xmm3,%xmm0
    45  0.0229 :  4022e5:	vpslldq $0x4,%xmm1,%xmm1
               :  4022ea:	vpslld $0x1,%xmm4,%xmm4
    12  0.0061 :  4022ef:	vpsrld $0x1,%xmm0,%xmm2
    52  0.0264 :  4022f4:	vpor   %xmm4,%xmm1,%xmm4
               :  4022f8:	vpor   %xmm6,%xmm4,%xmm4
               :  4022fc:	vpxor  %xmm0,%xmm4,%xmm4
     9  0.0046 :  402300:	vpsrld $0x2,%xmm0,%xmm7
    81  0.0412 :  402305:	vpsrld $0x7,%xmm0,%xmm3
    27  0.0137 :  40230a:	vpxor  %xmm7,%xmm2,%xmm2
    41  0.0208 :  40230e:	vpxor  %xmm3,%xmm5,%xmm5
    29  0.0147 :  402312:	vpxor  %xmm5,%xmm2,%xmm2
    62  0.0315 :  402316:	vpxor  %xmm4,%xmm2,%xmm12
    62  0.0315 :  40231a:	vmovdqa %xmm12,%xmm1
               :  40231e:	cmp    0x198(%rsp),%rax
               :  402326:	je     402332 <AES_GCM_encrypt+0x1722>
               :  402328:	vmovdqa (%r8),%xmm10
               :  40232d:	jmpq   401d70 <AES_GCM_encrypt+0x1160>
               :  402332:	mov    0x1c4(%rsp),%eax
               :  402339:	vmovdqa %xmm12,%xmm15
     9  0.0046 :  40233e:	vmovaps %xmm14,0x28(%rsp)
               :  402344:	mov    0x1c0(%rsp),%ebx
               :  40234b:	vmovdqa 0x78(%rsp),%xmm12
               :  402351:	shl    $0x3,%eax
     9  0.0046 :  402354:	lea    0xf(%rbx),%r12d
               :  402358:	test   %ebx,%ebx
               :  40235a:	cmovns %ebx,%r12d
    10  0.0051 :  40235e:	sar    $0x4,%r12d
               :  402362:	cmp    %eax,%r12d
               :  402365:	jle    402a03 <AES_GCM_encrypt+0x1df3>
               :  40236b:	mov    0x1a0(%rsp),%rbx
               :  402373:	lea    -0x1(%r12),%edx
               :  402378:	movslq %eax,%r11
               :  40237b:	vmovdqa %xmm15,%xmm3
               :  40237f:	sub    %eax,%edx
               :  402381:	mov    %r11,%r10
               :  402384:	vmovdqa 0x68(%rsp),%xmm4
               :  40238a:	lea    -0x3(%r9),%eax
               :  40238e:	shl    $0x4,%r10
               :  402392:	vmovdqa 0x188(%rsp),%xmm5
               :  40239b:	lea    0x1(%r11,%rdx,1),%r11
               :  4023a0:	shr    %eax
               :  4023a2:	shl    $0x4,%rbx
               :  4023a6:	shl    $0x4,%r11
               :  4023aa:	lea    -0x10(%r8,%rbx,1),%rbp
               :  4023af:	shl    $0x5,%rax
               :  4023b3:	add    %r8,%rbx
               :  4023b6:	lea    (%rdi,%r10,1),%rcx
               :  4023ba:	add    %rdi,%r11
               :  4023bd:	add    %rsi,%r10
               :  4023c0:	lea    0x30(%r8,%rax,1),%rdx
               :  4023c5:	nopl   (%rax)
               :  4023c8:	vpshufb 0x163f(%rip),%xmm4,%xmm0        # 403a10 <_IO_stdin_used+0x20>
               :  4023d1:	vpxor  (%r8),%xmm0,%xmm0
               :  4023d6:	vpaddd 0x1642(%rip),%xmm4,%xmm4        # 403a20 <_IO_stdin_used+0x30>
               :  4023de:	cmp    $0x2,%r9d
               :  4023e2:	jle    402404 <AES_GCM_encrypt+0x17f4>
               :  4023e4:	lea    0x10(%r8),%rax
               :  4023e8:	nopl   0x0(%rax,%rax,1)
               :  4023f0:	vaesenc (%rax),%xmm0,%xmm0
               :  4023f5:	add    $0x20,%rax
               :  4023f9:	vaesenc -0x10(%rax),%xmm0,%xmm0
               :  4023ff:	cmp    %rdx,%rax
               :  402402:	jne    4023f0 <AES_GCM_encrypt+0x17e0>
               :  402404:	vaesenc 0x0(%rbp),%xmm0,%xmm0
               :  40240a:	vaesenclast (%rbx),%xmm0,%xmm0
               :  40240f:	vpxor  (%rcx),%xmm0,%xmm0
               :  402413:	vmovups %xmm0,(%r10)
               :  402418:	vpshufb %xmm5,%xmm0,%xmm0
               :  40241d:	vpxor  %xmm0,%xmm3,%xmm3
               :  402421:	vpclmullqhqdq %xmm12,%xmm3,%xmm2
               :  402427:	vpclmulhqlqdq %xmm12,%xmm3,%xmm6
               :  40242d:	vpxor  %xmm6,%xmm2,%xmm6
               :  402431:	vpslldq $0x8,%xmm6,%xmm2
               :  402436:	add    $0x10,%rcx
               :  40243a:	add    $0x10,%r10
               :  40243e:	vpclmullqlqdq %xmm12,%xmm3,%xmm1
               :  402444:	vpclmulhqhqdq %xmm12,%xmm3,%xmm7
               :  40244a:	vpxor  %xmm2,%xmm1,%xmm2
               :  40244e:	vpsrld $0x1f,%xmm2,%xmm3
               :  402453:	vpsrldq $0xc,%xmm3,%xmm9
               :  402458:	vpslld $0x1,%xmm2,%xmm2
               :  40245d:	vpslldq $0x4,%xmm3,%xmm3
               :  402462:	vpor   %xmm2,%xmm3,%xmm2
               :  402466:	vpsrldq $0x8,%xmm6,%xmm6
               :  40246b:	vpslld $0x1f,%xmm2,%xmm8
               :  402470:	vpxor  %xmm6,%xmm7,%xmm6
               :  402474:	vpslld $0x19,%xmm2,%xmm1
               :  402479:	vpslld $0x1e,%xmm2,%xmm3
               :  40247e:	vpsrld $0x1f,%xmm6,%xmm7
               :  402483:	vpxor  %xmm3,%xmm8,%xmm3
               :  402487:	vpxor  %xmm1,%xmm3,%xmm3
               :  40248b:	vpsrldq $0x4,%xmm3,%xmm8
               :  402490:	vpslldq $0xc,%xmm3,%xmm3
               :  402495:	vpxor  %xmm3,%xmm2,%xmm1
               :  402499:	vpslld $0x1,%xmm6,%xmm6
               :  40249e:	vpsrld $0x1,%xmm1,%xmm3
               :  4024a3:	vpsrld $0x2,%xmm1,%xmm10
               :  4024a8:	vpsrld $0x7,%xmm1,%xmm2
               :  4024ad:	vpxor  %xmm10,%xmm3,%xmm3
               :  4024b2:	vpslldq $0x4,%xmm7,%xmm7
               :  4024b7:	vpxor  %xmm2,%xmm8,%xmm2
               :  4024bb:	vpxor  %xmm2,%xmm3,%xmm2
               :  4024bf:	vpor   %xmm6,%xmm7,%xmm6
               :  4024c3:	vpor   %xmm9,%xmm6,%xmm6
               :  4024c8:	vpxor  %xmm1,%xmm6,%xmm1
               :  4024cc:	vpxor  %xmm2,%xmm1,%xmm1
               :  4024d0:	vmovdqa %xmm1,%xmm3
               :  4024d4:	cmp    %r11,%rcx
               :  4024d7:	jne    4023c8 <AES_GCM_encrypt+0x17b8>
               :  4024dd:	vmovaps %xmm4,0x68(%rsp)
               :  4024e3:	vmovaps %xmm0,0x28(%rsp)
    13  0.0066 :  4024e9:	testb  $0xf,0x1c0(%rsp)
               :  4024f1:	je     4026d0 <AES_GCM_encrypt+0x1ac0>
               :  4024f7:	vmovdqa 0x68(%rsp),%xmm5
               :  4024fd:	vpshufb 0x150a(%rip),%xmm5,%xmm0        # 403a10 <_IO_stdin_used+0x20>
               :  402506:	vpxor  (%r8),%xmm0,%xmm0
               :  40250b:	cmp    $0x2,%r9d
               :  40250f:	jle    40253c <AES_GCM_encrypt+0x192c>
               :  402511:	lea    -0x3(%r9),%eax
               :  402515:	lea    0x10(%r8),%rdx
               :  402519:	shr    %eax
               :  40251b:	shl    $0x5,%rax
               :  40251f:	lea    0x30(%r8,%rax,1),%rax
               :  402524:	nopl   0x0(%rax)
               :  402528:	vaesenc (%rdx),%xmm0,%xmm0
               :  40252d:	add    $0x20,%rdx
               :  402531:	vaesenc -0x10(%rdx),%xmm0,%xmm0
               :  402537:	cmp    %rdx,%rax
               :  40253a:	jne    402528 <AES_GCM_encrypt+0x1918>
               :  40253c:	mov    0x1a0(%rsp),%rax
               :  402544:	shl    $0x4,%rax
               :  402548:	vaesenc -0x10(%r8,%rax,1),%xmm0,%xmm0
               :  40254f:	vaesenclast (%r8,%rax,1),%xmm0,%xmm0
               :  402555:	movslq %r12d,%rax
               :  402558:	shl    $0x4,%rax
               :  40255c:	vpxor  (%rdi,%rax,1),%xmm0,%xmm0
               :  402561:	mov    0x1c0(%rsp),%eax
               :  402568:	vmovaps %xmm0,0x1c8(%rsp)
               :  402571:	mov    %eax,%edx
               :  402573:	sar    $0x1f,%edx
               :  402576:	shr    $0x1c,%edx
               :  402579:	add    %edx,%eax
               :  40257b:	and    $0xf,%eax
               :  40257e:	sub    %edx,%eax
               :  402580:	test   %eax,%eax
               :  402582:	jle    402a2f <AES_GCM_encrypt+0x1e1f>
               :  402588:	lea    0x1c8(%rsp),%r10
               :  402590:	mov    %r12d,%edx
               :  402593:	shl    $0x4,%edx
               :  402596:	movslq %edx,%rdx
               :  402599:	add    %rdx,%rsi
               :  40259c:	lea    -0x1(%rax),%edx
               :  40259f:	add    $0x1,%rdx
               :  4025a3:	cmp    $0x8,%edx
               :  4025a6:	jb     4027d4 <AES_GCM_encrypt+0x1bc4>
               :  4025ac:	mov    %edx,%ecx
               :  4025ae:	sub    $0x1,%edx
               :  4025b1:	mov    -0x8(%r10,%rcx,1),%rdi
               :  4025b6:	mov    %rdi,-0x8(%rsi,%rcx,1)
               :  4025bb:	cmp    $0x8,%edx
               :  4025be:	jb     4025d6 <AES_GCM_encrypt+0x19c6>
               :  4025c0:	and    $0xfffffff8,%edx
               :  4025c3:	xor    %ecx,%ecx
               :  4025c5:	mov    %ecx,%edi
               :  4025c7:	add    $0x8,%ecx
               :  4025ca:	mov    (%r10,%rdi,1),%r8
               :  4025ce:	mov    %r8,(%rsi,%rdi,1)
               :  4025d2:	cmp    %edx,%ecx
               :  4025d4:	jb     4025c5 <AES_GCM_encrypt+0x19b5>
               :  4025d6:	mov    $0xf,%edx
               :  4025db:	mov    $0x1,%ecx
               :  4025e0:	sub    %eax,%edx
               :  4025e2:	add    $0x1,%rdx
               :  4025e6:	cmp    $0xf,%eax
               :  4025e9:	cltq   
               :  4025eb:	cmovg  %rcx,%rdx
               :  4025ef:	add    %rax,%r10
               :  4025f2:	mov    %edx,%eax
               :  4025f4:	cmp    $0x8,%edx
               :  4025f7:	jae    402810 <AES_GCM_encrypt+0x1c00>
               :  4025fd:	and    $0x4,%edx
               :  402600:	jne    402a5c <AES_GCM_encrypt+0x1e4c>
               :  402606:	test   %eax,%eax
               :  402608:	jne    4028bd <AES_GCM_encrypt+0x1cad>
               :  40260e:	vmovdqa 0x1c8(%rsp),%xmm0
               :  402617:	vpshufb 0x188(%rsp),%xmm0,%xmm0
               :  402621:	vpxor  %xmm0,%xmm1,%xmm1
               :  402625:	vmovaps %xmm0,0x28(%rsp)
               :  40262b:	vpclmulhqlqdq %xmm12,%xmm1,%xmm3
               :  402631:	vpclmullqhqdq %xmm12,%xmm1,%xmm0
               :  402637:	vpxor  %xmm3,%xmm0,%xmm0
               :  40263b:	vpslldq $0x8,%xmm0,%xmm3
               :  402640:	vpclmullqlqdq %xmm12,%xmm1,%xmm2
               :  402646:	vpxor  %xmm3,%xmm2,%xmm2
               :  40264a:	vpsrld $0x1f,%xmm2,%xmm3
               :  40264f:	vpclmulhqhqdq %xmm12,%xmm1,%xmm1
               :  402655:	vpslld $0x1,%xmm2,%xmm2
               :  40265a:	vpsrldq $0xc,%xmm3,%xmm5
               :  40265f:	vpsrldq $0x8,%xmm0,%xmm0
               :  402664:	vpslldq $0x4,%xmm3,%xmm3
               :  402669:	vpxor  %xmm0,%xmm1,%xmm0
               :  40266d:	vpor   %xmm2,%xmm3,%xmm1
               :  402671:	vpslld $0x1f,%xmm1,%xmm3
               :  402676:	vpslld $0x19,%xmm1,%xmm6
               :  40267b:	vpslld $0x1e,%xmm1,%xmm2
               :  402680:	vpsrld $0x1f,%xmm0,%xmm4
               :  402685:	vpxor  %xmm2,%xmm3,%xmm2
               :  402689:	vpxor  %xmm6,%xmm2,%xmm2
               :  40268d:	vpsrldq $0x4,%xmm2,%xmm3
               :  402692:	vpslldq $0xc,%xmm2,%xmm2
               :  402697:	vpxor  %xmm2,%xmm1,%xmm2
               :  40269b:	vpslld $0x1,%xmm0,%xmm0
               :  4026a0:	vpsrld $0x1,%xmm2,%xmm1
               :  4026a5:	vpsrld $0x2,%xmm2,%xmm7
               :  4026aa:	vpsrld $0x7,%xmm2,%xmm6
               :  4026af:	vpxor  %xmm7,%xmm1,%xmm1
               :  4026b3:	vpslldq $0x4,%xmm4,%xmm4
               :  4026b8:	vpxor  %xmm6,%xmm3,%xmm3
               :  4026bc:	vpxor  %xmm3,%xmm1,%xmm1
               :  4026c0:	vpor   %xmm0,%xmm4,%xmm0
               :  4026c4:	vpor   %xmm5,%xmm0,%xmm0
               :  4026c8:	vpxor  %xmm2,%xmm0,%xmm2
               :  4026cc:	vpxor  %xmm2,%xmm1,%xmm1
    12  0.0061 :  4026d0:	mov    0x1c0(%rsp),%eax
               :  4026d7:	vmovdqa 0x28(%rsp),%xmm7
               :  4026dd:	shl    $0x3,%eax
               :  4026e0:	cltq   
     6  0.0031 :  4026e2:	vpinsrq $0x0,%rax,%xmm7,%xmm0
               :  4026e8:	mov    0x218(%rsp),%eax
               :  4026ef:	shl    $0x3,%eax
     9  0.0046 :  4026f2:	cltq   
               :  4026f4:	vpinsrq $0x1,%rax,%xmm0,%xmm0
               :  4026fa:	vpxor  %xmm1,%xmm0,%xmm1
    17  0.0086 :  4026fe:	vpclmulhqlqdq %xmm12,%xmm1,%xmm3
    12  0.0061 :  402704:	vpclmullqhqdq %xmm12,%xmm1,%xmm0
    18  0.0092 :  40270a:	vpxor  %xmm3,%xmm0,%xmm0
    30  0.0153 :  40270e:	vpslldq $0x8,%xmm0,%xmm3
    12  0.0061 :  402713:	vpclmullqlqdq %xmm12,%xmm1,%xmm2
     5  0.0025 :  402719:	mov    0x1b8(%rsp),%rax
     7  0.0036 :  402721:	vpxor  %xmm3,%xmm2,%xmm3
     8  0.0041 :  402725:	vpsrldq $0x8,%xmm0,%xmm0
               :  40272a:	vpclmulhqhqdq %xmm12,%xmm1,%xmm1
    12  0.0061 :  402730:	vpsrld $0x1f,%xmm3,%xmm2
               :  402735:	vpxor  %xmm0,%xmm1,%xmm0
     2  0.0010 :  402739:	vpsrldq $0xc,%xmm2,%xmm4
     6  0.0031 :  40273e:	vpslld $0x1,%xmm3,%xmm1
               :  402743:	vpslldq $0x4,%xmm2,%xmm2
     8  0.0041 :  402748:	vpor   %xmm1,%xmm2,%xmm1
     7  0.0036 :  40274c:	vpslld $0x1f,%xmm1,%xmm3
     8  0.0041 :  402751:	vpslld $0x19,%xmm1,%xmm6
     6  0.0031 :  402756:	vpslld $0x1e,%xmm1,%xmm2
    13  0.0066 :  40275b:	vpsrld $0x1f,%xmm0,%xmm5
               :  402760:	vpxor  %xmm2,%xmm3,%xmm2
     4  0.0020 :  402764:	vpxor  %xmm6,%xmm2,%xmm2
     5  0.0025 :  402768:	vpsrldq $0x4,%xmm2,%xmm3
     9  0.0046 :  40276d:	vpslldq $0xc,%xmm2,%xmm2
     1 5.1e-04 :  402772:	vpxor  %xmm2,%xmm1,%xmm1
     3  0.0015 :  402776:	vpslld $0x1,%xmm0,%xmm0
               :  40277b:	vpsrld $0x1,%xmm1,%xmm2
     4  0.0020 :  402780:	vpsrld $0x2,%xmm1,%xmm6
     6  0.0031 :  402785:	vpsrld $0x7,%xmm1,%xmm7
     5  0.0025 :  40278a:	vpxor  %xmm6,%xmm2,%xmm2
               :  40278e:	vpslldq $0x4,%xmm5,%xmm5
               :  402793:	vpor   %xmm0,%xmm5,%xmm0
               :  402797:	vpor   %xmm4,%xmm0,%xmm0
    15  0.0076 :  40279b:	vpxor  %xmm1,%xmm0,%xmm1
               :  40279f:	vpxor  %xmm7,%xmm3,%xmm0
               :  4027a3:	vpxor  %xmm2,%xmm0,%xmm0
     8  0.0041 :  4027a7:	vpxor  %xmm0,%xmm1,%xmm0
    11  0.0056 :  4027ab:	vpshufb 0x188(%rsp),%xmm0,%xmm0
     8  0.0041 :  4027b5:	vpxor  0x1a8(%rsp),%xmm0,%xmm0
     3  0.0015 :  4027be:	vmovups %xmm0,(%rax)
     7  0.0036 :  4027c2:	add    $0x1e0,%rsp
               :  4027c9:	pop    %rbx
               :  4027ca:	pop    %rbp
               :  4027cb:	pop    %r12
    10  0.0051 :  4027cd:	pop    %r13
               :  4027cf:	pop    %r14
               :  4027d1:	pop    %r15
               :  4027d3:	retq   
               :  4027d4:	test   $0x4,%dl
               :  4027d7:	jne    402a47 <AES_GCM_encrypt+0x1e37>
               :  4027dd:	test   %edx,%edx
               :  4027df:	je     4025d6 <AES_GCM_encrypt+0x19c6>
               :  4027e5:	movzbl (%r10),%ecx
               :  4027e9:	mov    %cl,(%rsi)
               :  4027eb:	test   $0x2,%dl
               :  4027ee:	je     4025d6 <AES_GCM_encrypt+0x19c6>
               :  4027f4:	mov    %edx,%edx
               :  4027f6:	movzwl -0x2(%r10,%rdx,1),%ecx
               :  4027fc:	mov    %cx,-0x2(%rsi,%rdx,1)
               :  402801:	jmpq   4025d6 <AES_GCM_encrypt+0x19c6>
               :  402806:	nopw   %cs:0x0(%rax,%rax,1)
               :  402810:	mov    %edx,%eax
               :  402812:	movq   $0x0,-0x8(%r10,%rax,1)
               :  40281b:	lea    -0x1(%rdx),%eax
               :  40281e:	cmp    $0x8,%eax
               :  402821:	jb     40260e <AES_GCM_encrypt+0x19fe>
               :  402827:	and    $0xfffffff8,%eax
               :  40282a:	xor    %edx,%edx
               :  40282c:	mov    %edx,%ecx
               :  40282e:	add    $0x8,%edx
               :  402831:	movq   $0x0,(%r10,%rcx,1)
               :  402839:	cmp    %eax,%edx
               :  40283b:	jb     40282c <AES_GCM_encrypt+0x1c1c>
               :  40283d:	jmpq   40260e <AES_GCM_encrypt+0x19fe>
               :  402842:	movzbl (%rax,%rdx,1),%eax
               :  402846:	mov    %al,(%r11,%rdx,1)
               :  40284a:	jmpq   401ae8 <AES_GCM_encrypt+0xed8>
               :  40284f:	movzwl (%rax,%rdx,1),%r10d
               :  402854:	mov    %r10w,(%r11,%rdx,1)
               :  402859:	add    $0x2,%rdx
               :  40285d:	and    $0x1,%ecx
               :  402860:	je     401ae8 <AES_GCM_encrypt+0xed8>
               :  402866:	jmp    402842 <AES_GCM_encrypt+0x1c32>
    11  0.0056 :  402868:	mov    (%rax),%edx
               :  40286a:	mov    %edx,(%r11)
               :  40286d:	mov    $0x4,%edx
               :  402872:	test   $0x2,%cl
               :  402875:	je     401adf <AES_GCM_encrypt+0xecf>
               :  40287b:	jmp    40284f <AES_GCM_encrypt+0x1c3f>
               :  40287d:	mov    (%rbx),%ecx
               :  40287f:	mov    %ecx,0x0(%rbp)
               :  402882:	mov    $0x4,%ecx
               :  402887:	test   $0x2,%r11b
               :  40288b:	je     400e2d <AES_GCM_encrypt+0x21d>
               :  402891:	jmp    4028a2 <AES_GCM_encrypt+0x1c92>
               :  402893:	movzbl (%rbx,%rcx,1),%r10d
               :  402898:	mov    %r10b,0x0(%rbp,%rcx,1)
               :  40289d:	jmpq   400e37 <AES_GCM_encrypt+0x227>
               :  4028a2:	movzwl (%rbx,%rcx,1),%r10d
               :  4028a7:	mov    %r10w,0x0(%rbp,%rcx,1)
               :  4028ad:	add    $0x2,%rcx
               :  4028b1:	and    $0x1,%r11d
               :  4028b5:	je     400e37 <AES_GCM_encrypt+0x227>
               :  4028bb:	jmp    402893 <AES_GCM_encrypt+0x1c83>
               :  4028bd:	movb   $0x0,(%r10)
               :  4028c1:	test   $0x2,%al
               :  4028c3:	je     40260e <AES_GCM_encrypt+0x19fe>
               :  4028c9:	xor    %edx,%edx
               :  4028cb:	mov    %dx,-0x2(%r10,%rax,1)
               :  4028d1:	jmpq   40260e <AES_GCM_encrypt+0x19fe>
               :  4028d6:	vpxor  %xmm0,%xmm0,%xmm0
               :  4028da:	jmpq   401af1 <AES_GCM_encrypt+0xee1>
               :  4028df:	mov    %ecx,%ebx
               :  4028e1:	xor    %eax,%eax
     6  0.0031 :  4028e3:	and    $0xfffffff8,%ebx
               :  4028e6:	mov    %eax,%r11d
               :  4028e9:	add    $0x8,%eax
               :  4028ec:	mov    (%rdx,%r11,1),%rbp
    13  0.0066 :  4028f0:	mov    %rbp,(%r10,%r11,1)
               :  4028f4:	cmp    %ebx,%eax
               :  4028f6:	jb     4028e6 <AES_GCM_encrypt+0x1cd6>
               :  4028f8:	lea    (%r10,%rax,1),%r11
               :  4028fc:	add    %rdx,%rax
    10  0.0051 :  4028ff:	jmpq   401acb <AES_GCM_encrypt+0xebb>
               :  402904:	mov    %r11d,%r12d
               :  402907:	xor    %ebx,%ebx
               :  402909:	and    $0xfffffff8,%r12d
               :  40290d:	mov    %ebx,%ebp
               :  40290f:	add    $0x8,%ebx
               :  402912:	mov    (%rcx,%rbp,1),%r13
               :  402916:	mov    %r13,(%r10,%rbp,1)
               :  40291a:	cmp    %r12d,%ebx
               :  40291d:	jb     40290d <AES_GCM_encrypt+0x1cfd>
               :  40291f:	lea    (%r10,%rbx,1),%rbp
               :  402923:	add    %rcx,%rbx
               :  402926:	jmpq   400e17 <AES_GCM_encrypt+0x207>
     6  0.0031 :  40292b:	vmovdqu (%rcx),%xmm0
               :  40292f:	mov    $0x1000000,%eax
               :  402934:	vmovdqa (%r8),%xmm10
               :  402939:	vpinsrd $0x3,%eax,%xmm0,%xmm0
     7  0.0036 :  40293f:	vmovaps %xmm0,0x108(%rsp)
               :  402948:	vmovdqa %xmm10,%xmm2
               :  40294c:	vpxor  %xmm0,%xmm10,%xmm0
     7  0.0036 :  402950:	cmp    $0x2,%r9d
               :  402954:	jle    402996 <AES_GCM_encrypt+0x1d86>
               :  402956:	lea    -0x3(%r9),%ecx
               :  40295a:	lea    0x10(%r8),%rax
               :  40295e:	shr    %ecx
     9  0.0046 :  402960:	shl    $0x5,%rcx
               :  402964:	lea    0x30(%r8,%rcx,1),%rcx
               :  402969:	nopl   0x0(%rax)
               :  402970:	vmovdqa (%rax),%xmm1
    12  0.0061 :  402974:	add    $0x20,%rax
    16  0.0081 :  402978:	vaesenc %xmm1,%xmm2,%xmm2
   134  0.0681 :  40297d:	vaesenc %xmm1,%xmm0,%xmm0
    17  0.0086 :  402982:	vmovdqa -0x10(%rax),%xmm1
     5  0.0025 :  402987:	vaesenc %xmm1,%xmm2,%xmm2
   188  0.0956 :  40298c:	vaesenc %xmm1,%xmm0,%xmm0
    16  0.0081 :  402991:	cmp    %rcx,%rax
               :  402994:	jne    402970 <AES_GCM_encrypt+0x1d60>
               :  402996:	vmovdqa 0x1062(%rip),%xmm5        # 403a00 <_IO_stdin_used+0x10>
               :  40299e:	movslq %r9d,%rax
     5  0.0025 :  4029a1:	mov    %rax,0x1a0(%rsp)
     4  0.0020 :  4029a9:	shl    $0x4,%rax
               :  4029ad:	vmovaps %xmm5,0x188(%rsp)
               :  4029b6:	vmovdqa -0x10(%r8,%rax,1),%xmm1
     6  0.0031 :  4029bd:	vaesenc %xmm1,%xmm2,%xmm7
    55  0.0280 :  4029c2:	vmovdqa (%r8,%rax,1),%xmm2
               :  4029c8:	vaesenc %xmm1,%xmm0,%xmm0
     4  0.0020 :  4029cd:	vmovaps %xmm7,0x28(%rsp)
     6  0.0031 :  4029d3:	vaesenclast %xmm2,%xmm7,%xmm1
    37  0.0188 :  4029d8:	vaesenclast %xmm2,%xmm0,%xmm7
               :  4029dd:	vpshufb %xmm5,%xmm1,%xmm0
     8  0.0041 :  4029e2:	vmovaps %xmm7,0x1a8(%rsp)
               :  4029eb:	vmovdqa %xmm0,%xmm12
               :  4029ef:	jmpq   401020 <AES_GCM_encrypt+0x410>
               :  4029f4:	mov    %r10d,%r11d
               :  4029f7:	jmpq   401a64 <AES_GCM_encrypt+0xe54>
               :  4029fc:	xor    %eax,%eax
               :  4029fe:	jmpq   402354 <AES_GCM_encrypt+0x1744>
               :  402a03:	mov    %eax,%r12d
               :  402a06:	jmpq   4024e9 <AES_GCM_encrypt+0x18d9>
               :  402a0b:	vpxor  %xmm1,%xmm1,%xmm1
               :  402a0f:	xor    %r10d,%r10d
               :  402a12:	vmovdqa %xmm1,%xmm15
    11  0.0056 :  402a16:	jmpq   401942 <AES_GCM_encrypt+0xd32>
               :  402a1b:	vpxor  %xmm0,%xmm0,%xmm0
               :  402a1f:	xor    %ebx,%ebx
               :  402a21:	jmpq   400dc7 <AES_GCM_encrypt+0x1b7>
               :  402a26:	vmovdqa %xmm10,%xmm7
               :  402a2a:	jmpq   400c96 <AES_GCM_encrypt+0x86>
               :  402a2f:	lea    0x1c8(%rsp),%r10
               :  402a37:	xor    %eax,%eax
               :  402a39:	jmpq   4025d6 <AES_GCM_encrypt+0x19c6>
               :  402a3e:	vpxor  %xmm1,%xmm1,%xmm1
               :  402a42:	jmpq   400e40 <AES_GCM_encrypt+0x230>
               :  402a47:	mov    (%r10),%ecx
               :  402a4a:	mov    %edx,%edx
               :  402a4c:	mov    %ecx,(%rsi)
               :  402a4e:	mov    -0x4(%r10,%rdx,1),%ecx
               :  402a53:	mov    %ecx,-0x4(%rsi,%rdx,1)
               :  402a57:	jmpq   4025d6 <AES_GCM_encrypt+0x19c6>
               :  402a5c:	movl   $0x0,(%r10)
               :  402a63:	movl   $0x0,-0x4(%r10,%rax,1)
               :  402a6c:	jmpq   40260e <AES_GCM_encrypt+0x19fe>
               :  402a71:	nopw   %cs:0x0(%rax,%rax,1)
               :  402a7b:	nopl   0x0(%rax,%rax,1)
/* 
 * Command line: opannotate -e main --assembly ./aes_gcm 
 * 
 * Interpretation of command line:
 * Output annotated assembly listing with samples
 * 
 * CPU: Intel Haswell microarchitecture, speed 2.601e+06 MHz (estimated)
 * Counted CPU_CLK_UNHALTED events (Clock cycles when not halted) with a unit mask of 0x00 (No unit mask) count 100000
 */
/* 
 * Command line: opannotate -e main --assembly ./aes_gcm 
 * 
 * Interpretation of command line:
 * Output annotated assembly listing with samples
 * 
 * CPU: Intel Haswell microarchitecture, speed 2.601e+06 MHz (estimated)
 * Counted CPU_CLK_UNHALTED events (Clock cycles when not halted) with a unit mask of 0x00 (No unit mask) count 100000
 */
               :
               :/usr/lib64/ld-2.17.so:     file format elf64-x86-64
               :
               :
               :Disassembly of section .text:
               :
0000000000009630 <do_lookup_x>: /* do_lookup_x total:      1 5.1e-04 */
               :    9630:	push   %r15
               :    9632:	mov    %rdx,%r11
               :    9635:	push   %r14
               :    9637:	push   %r13
               :    9639:	mov    %rsi,%r13
               :    963c:	push   %r12
               :    963e:	push   %rbp
               :    963f:	push   %rbx
               :    9640:	sub    $0x88,%rsp
               :    9647:	mov    0x8(%r9),%r12d
               :    964b:	mov    0xc8(%rsp),%rax
               :    9653:	mov    %r8,0x20(%rsp)
               :    9658:	mov    0xc0(%rsp),%rbp
               :    9660:	mov    0xd8(%rsp),%r15
               :    9668:	mov    %rdi,0x58(%rsp)
               :    966d:	mov    %rcx,0x68(%rsp)
               :    9672:	mov    %rax,0x48(%rsp)
               :    9677:	mov    0xd0(%rsp),%eax
               :    967e:	mov    %eax,0x74(%rsp)
               :    9682:	mov    0xe0(%rsp),%eax
               :    9689:	mov    %eax,0x7c(%rsp)
               :    968d:	lea    0x40(%rsp),%rax
               :    9692:	mov    (%r9),%r14
               :    9695:	mov    %esi,%r8d
               :    9698:	mov    %rsi,%r9
               :    969b:	and    $0x3f,%r8d
               :    969f:	shr    $0x6,%r9
               :    96a3:	mov    %rax,0x8(%rsp)
               :    96a8:	nopl   0x0(%rax,%rax,1)
               :    96b0:	mov    (%r14,%rbp,8),%rax
               :    96b4:	movl   $0x0,0x70(%rsp)
               :    96bc:	movq   $0x0,0x40(%rsp)
               :    96c5:	mov    0x28(%rax),%rdi
               :    96c9:	cmp    %r15,%rdi
               :    96cc:	mov    %rdi,0x50(%rsp)
               :    96d1:	je     97c0 <do_lookup_x+0x190>
               :    96d7:	testb  $0x2,0x7c(%rsp)
               :    96dc:	je     96eb <do_lookup_x+0xbb>
               :    96de:	testb  $0x3,0x314(%rdi)
               :    96e5:	je     97c0 <do_lookup_x+0x190>
               :    96eb:	testb  $0x20,0x315(%rdi)
               :    96f2:	jne    97c0 <do_lookup_x+0x190>
               :    96f8:	testb  $0x8,0x217521(%rip)        # 220c20 <_rtld_global_ro>
               :    96ff:	jne    9c5d <do_lookup_x+0x62d>
               :    9705:	mov    0x2ec(%rdi),%edx
               :    970b:	test   %edx,%edx
               :    970d:	je     97c0 <do_lookup_x+0x190>
               :    9713:	mov    0x70(%rdi),%rax
               :    9717:	mov    0x8(%rax),%rbx
               :    971b:	mov    0x68(%rdi),%rax
               :    971f:	mov    0x8(%rax),%rax
               :    9723:	mov    %rax,0x60(%rsp)
               :    9728:	mov    0x2f8(%rdi),%rax
               :    972f:	test   %rax,%rax
               :    9732:	je     9d5c <do_lookup_x+0x72c>
               :    9738:	mov    %r9d,%ecx
               :    973b:	and    0x2f0(%rdi),%ecx
               :    9741:	mov    (%rax,%rcx,8),%rsi
               :    9745:	mov    0x2f4(%rdi),%ecx
               :    974b:	mov    %r13,%rax
               :    974e:	shr    %cl,%rax
               :    9751:	mov    %rax,%rcx
               :    9754:	mov    %rsi,%rax
               :    9757:	shr    %cl,%rax
               :    975a:	mov    %r8d,%ecx
               :    975d:	shr    %cl,%rsi
               :    9760:	and    %rsi,%rax
               :    9763:	test   $0x1,%al
               :    9765:	jne    9caf <do_lookup_x+0x67f>
               :    976b:	movl   $0x0,0x78(%rsp)
               :    9773:	cmpl   $0x1,0x70(%rsp)
               :    9778:	je     97d8 <do_lookup_x+0x1a8>
               :    977a:	mov    0x48(%rsp),%rax
               :    977f:	test   %rax,%rax
               :    9782:	je     97c0 <do_lookup_x+0x190>
               :    9784:	mov    0x10(%rax),%rdi
               :    9788:	test   %rdi,%rdi
               :    978b:	je     97c0 <do_lookup_x+0x190>
               :    978d:	mov    0x50(%rsp),%rsi
               :    9792:	mov    %r8d,0x28(%rsp)
               :    9797:	mov    %r11,0x18(%rsp)
               :    979c:	mov    %r9,0x10(%rsp)
               :    97a1:	callq  104e0 <_dl_name_match_p>
               :    97a6:	test   %eax,%eax
               :    97a8:	mov    0x10(%rsp),%r9
               :    97ad:	mov    0x18(%rsp),%r11
               :    97b2:	mov    0x28(%rsp),%r8d
               :    97b7:	jne    9e11 <do_lookup_x+0x7e1>
               :    97bd:	nopl   (%rax)
               :    97c0:	add    $0x1,%rbp
               :    97c4:	cmp    %rbp,%r12
               :    97c7:	ja     96b0 <do_lookup_x+0x80>
               :    97cd:	xor    %eax,%eax
               :    97cf:	jmp    9844 <do_lookup_x+0x214>
               :    97d1:	nopl   0x0(%rax)
               :    97d8:	mov    0x40(%rsp),%rax
               :    97dd:	test   %rax,%rax
               :    97e0:	je     977a <do_lookup_x+0x14a>
               :    97e2:	movzbl 0x4(%rax),%edx
               :    97e6:	shr    $0x4,%dl
               :    97e9:	cmp    $0x2,%dl
               :    97ec:	je     9818 <do_lookup_x+0x1e8>
               :    97ee:	cmp    $0xa,%dl
               :    97f1:	je     9860 <do_lookup_x+0x230>
               :    97f3:	cmp    $0x1,%dl
               :    97f6:	je     9826 <do_lookup_x+0x1f6>
               :    97f8:	mov    0x78(%rsp),%eax
               :    97fc:	test   %eax,%eax
               :    97fe:	je     977a <do_lookup_x+0x14a>
               :    9804:	add    $0x1,%rbp
               :    9808:	cmp    %rbp,%r12
               :    980b:	ja     96b0 <do_lookup_x+0x80>
               :    9811:	jmp    97cd <do_lookup_x+0x19d>
               :    9813:	nopl   0x0(%rax,%rax,1)
               :    9818:	mov    0x21744e(%rip),%edx        # 220c6c <_rtld_global_ro+0x4c>
               :    981e:	test   %edx,%edx
               :    9820:	jne    9df1 <do_lookup_x+0x7c1>
               :    9826:	mov    %rax,0x18(%rsp)
               :    982b:	mov    %rax,%rsi
               :    982e:	mov    0x20(%rsp),%rbx
               :    9833:	mov    0x50(%rsp),%rax
               :    9838:	mov    %rsi,(%rbx)
               :    983b:	mov    %rax,0x8(%rbx)
               :    983f:	mov    $0x1,%eax
               :    9844:	add    $0x88,%rsp
               :    984b:	pop    %rbx
               :    984c:	pop    %rbp
               :    984d:	pop    %r12
               :    984f:	pop    %r13
               :    9851:	pop    %r14
               :    9853:	pop    %r15
               :    9855:	retq   
               :    9856:	nopw   %cs:0x0(%rax,%rax,1)
               :    9860:	mov    %rax,0x18(%rsp)
               :    9865:	mov    0x50(%rsp),%rax
               :    986a:	lea    0x21778f(%rip),%rdx        # 221000 <_rtld_global>
               :    9871:	mov    0x30(%rax),%rax
               :    9875:	lea    (%rax,%rax,8),%rax
               :    9879:	shl    $0x4,%rax
               :    987d:	lea    0x20(%rdx,%rax,1),%rax
               :    9882:	mov    %rax,%rbx
               :    9885:	mov    %rax,0x30(%rsp)
               :    988a:	mov    %rax,%rdi
               :    988d:	callq  *0x21866d(%rip)        # 221f00 <_rtld_global+0xf00>
               :    9893:	mov    %rbx,%rax
               :    9896:	mov    0x28(%rbx),%rbx
               :    989a:	mov    0x30(%rax),%r12
               :    989e:	test   %rbx,%rbx
               :    98a1:	mov    %rbx,0x28(%rsp)
               :    98a6:	je     9c04 <do_lookup_x+0x5d4>
               :    98ac:	mov    %r13,%rax
               :    98af:	xor    %edx,%edx
               :    98b1:	div    %r12
               :    98b4:	lea    -0x2(%r12),%rax
               :    98b9:	mov    %rax,%rbx
               :    98bc:	mov    %rax,0x38(%rsp)
               :    98c1:	mov    %r13,%rax
               :    98c4:	mov    %rdx,%rsi
               :    98c7:	xor    %edx,%edx
               :    98c9:	div    %rbx
               :    98cc:	mov    0x58(%rsp),%rax
               :    98d1:	mov    %rax,0x10(%rsp)
               :    98d6:	lea    0x1(%rdx),%rbp
               :    98da:	mov    %rbp,%r14
               :    98dd:	shl    $0x5,%r14
               :    98e1:	mov    %r14,%rcx
               :    98e4:	mov    %r12,%r14
               :    98e7:	mov    %rbp,%r12
               :    98ea:	mov    %rsi,%r15
               :    98ed:	lea    (%r12,%rsi,1),%rbx
               :    98f1:	shl    $0x5,%r15
               :    98f5:	add    0x28(%rsp),%r15
               :    98fa:	jmp    991c <do_lookup_x+0x2ec>
               :    98fc:	nopl   0x0(%rax)
               :    9900:	mov    0x8(%r15),%rbp
               :    9904:	test   %rbp,%rbp
               :    9907:	je     9980 <do_lookup_x+0x350>
               :    9909:	add    %rcx,%r15
               :    990c:	cmp    %rbx,%r14
               :    990f:	lea    (%rbx,%r12,1),%rax
               :    9913:	jbe    9a48 <do_lookup_x+0x418>
               :    9919:	mov    %rax,%rbx
               :    991c:	mov    (%r15),%eax
               :    991f:	cmp    %r13,%rax
               :    9922:	jne    9900 <do_lookup_x+0x2d0>
               :    9924:	mov    0x8(%r15),%rbp
               :    9928:	mov    0x10(%rsp),%rsi
               :    992d:	mov    %rcx,0x8(%rsp)
               :    9932:	mov    %rbp,%rdi
               :    9935:	callq  19180 <strcmp>
               :    993a:	test   %eax,%eax
               :    993c:	mov    0x8(%rsp),%rcx
               :    9941:	jne    9904 <do_lookup_x+0x2d4>
               :    9943:	testb  $0x2,0x7c(%rsp)
               :    9948:	jne    9bf5 <do_lookup_x+0x5c5>
               :    994e:	mov    0x10(%r15),%rbx
               :    9952:	mov    0x18(%r15),%rax
               :    9956:	mov    0x20(%rsp),%rsi
               :    995b:	mov    0x30(%rsp),%rdi
               :    9960:	mov    %rax,0x8(%rsi)
               :    9964:	mov    %rbx,(%rsi)
               :    9967:	callq  *0x21859b(%rip)        # 221f08 <_rtld_global+0xf08>
               :    996d:	mov    $0x1,%eax
               :    9972:	jmpq   9844 <do_lookup_x+0x214>
               :    9977:	nopw   0x0(%rax,%rax,1)
               :    9980:	mov    0x30(%rsp),%rax
               :    9985:	lea    (%r14,%r14,2),%rdx
               :    9989:	mov    %r14,%r12
               :    998c:	mov    0x38(%rax),%rax
               :    9990:	mov    %rax,0x8(%rsp)
               :    9995:	shl    $0x2,%rax
               :    9999:	cmp    %rax,%rdx
               :    999c:	jbe    9af5 <do_lookup_x+0x4c5>
               :    99a2:	mov    0x18(%rsp),%rax
               :    99a7:	mov    (%rax),%r8d
               :    99aa:	add    0x60(%rsp),%r8
               :    99af:	testb  $0x2,0x7c(%rsp)
               :    99b4:	je     9a58 <do_lookup_x+0x428>
               :    99ba:	mov    %r13d,%edi
               :    99bd:	xor    %edx,%edx
               :    99bf:	mov    0x68(%rsp),%r9
               :    99c4:	mov    %rdi,%rax
               :    99c7:	mov    0x28(%rsp),%rcx
               :    99cc:	div    %r12
               :    99cf:	mov    %rdi,%rax
               :    99d2:	mov    %rdx,%rsi
               :    99d5:	xor    %edx,%edx
               :    99d7:	divq   0x38(%rsp)
               :    99dc:	lea    0x1(%rdx),%rdi
               :    99e0:	mov    %rdi,%r10
               :    99e3:	shl    $0x5,%r10
               :    99e7:	mov    %rsi,%rax
               :    99ea:	shl    $0x5,%rax
               :    99ee:	lea    0x8(%rcx,%rax,1),%rax
               :    99f3:	jmp    9a07 <do_lookup_x+0x3d7>
               :    99f5:	nopl   (%rax)
               :    99f8:	add    %rdi,%rsi
               :    99fb:	add    %r10,%rax
               :    99fe:	cmp    %rsi,%r12
               :    9a01:	jbe    9ae8 <do_lookup_x+0x4b8>
               :    9a07:	cmpq   $0x0,(%rax)
               :    9a0b:	lea    -0x8(%rax),%rdx
               :    9a0f:	jne    99f8 <do_lookup_x+0x3c8>
               :    9a11:	mov    %r13d,-0x8(%rax)
               :    9a15:	mov    %r8,(%rax)
               :    9a18:	mov    %r9,0x8(%rax)
               :    9a1c:	mov    0xe8(%rsp),%rax
               :    9a24:	mov    %rax,0x18(%rdx)
               :    9a28:	mov    0x30(%rsp),%rax
               :    9a2d:	addq   $0x1,0x38(%rax)
               :    9a32:	mov    %rax,%rdi
               :    9a35:	callq  *0x2184cd(%rip)        # 221f08 <_rtld_global+0xf08>
               :    9a3b:	mov    0x18(%rsp),%rsi
               :    9a40:	jmpq   982e <do_lookup_x+0x1fe>
               :    9a45:	nopl   (%rax)
               :    9a48:	mov    %rbx,%rsi
               :    9a4b:	sub    %r14,%rsi
               :    9a4e:	jmpq   98ea <do_lookup_x+0x2ba>
               :    9a53:	nopl   0x0(%rax,%rax,1)
               :    9a58:	mov    %r13d,%edi
               :    9a5b:	xor    %edx,%edx
               :    9a5d:	mov    0x50(%rsp),%r9
               :    9a62:	mov    %rdi,%rax
               :    9a65:	mov    0x28(%rsp),%rcx
               :    9a6a:	div    %r12
               :    9a6d:	mov    %rdi,%rax
               :    9a70:	mov    %rdx,%rsi
               :    9a73:	xor    %edx,%edx
               :    9a75:	divq   0x38(%rsp)
               :    9a7a:	lea    0x1(%rdx),%rdi
               :    9a7e:	mov    %rdi,%r10
               :    9a81:	shl    $0x5,%r10
               :    9a85:	mov    %rsi,%rax
               :    9a88:	shl    $0x5,%rax
               :    9a8c:	lea    0x8(%rcx,%rax,1),%rax
               :    9a91:	jmp    9aa3 <do_lookup_x+0x473>
               :    9a93:	nopl   0x0(%rax,%rax,1)
               :    9a98:	add    %rdi,%rsi
               :    9a9b:	add    %r10,%rax
               :    9a9e:	cmp    %rsi,%r12
               :    9aa1:	jbe    9af0 <do_lookup_x+0x4c0>
               :    9aa3:	cmpq   $0x0,(%rax)
               :    9aa7:	lea    -0x8(%rax),%rdx
               :    9aab:	jne    9a98 <do_lookup_x+0x468>
               :    9aad:	mov    %r13d,-0x8(%rax)
               :    9ab1:	mov    %r8,(%rax)
               :    9ab4:	mov    0x18(%rsp),%rax
               :    9ab9:	mov    %r9,0x18(%rdx)
               :    9abd:	mov    %rax,0x10(%rdx)
               :    9ac1:	movzbl 0x314(%r9),%eax
               :    9ac9:	and    $0x3,%eax
               :    9acc:	cmp    $0x2,%al
               :    9ace:	jne    9a28 <do_lookup_x+0x3f8>
               :    9ad4:	orl    $0x8,0x3d4(%r9)
               :    9adc:	jmpq   9a28 <do_lookup_x+0x3f8>
               :    9ae1:	nopl   0x0(%rax)
               :    9ae8:	sub    %r12,%rsi
               :    9aeb:	jmpq   99e7 <do_lookup_x+0x3b7>
               :    9af0:	sub    %r12,%rsi
               :    9af3:	jmp    9a85 <do_lookup_x+0x455>
               :    9af5:	lea    0x1(%r14),%rdi
               :    9af9:	callq  10550 <_dl_higher_prime_number>
               :    9afe:	mov    $0x20,%edi
               :    9b03:	mov    %rax,%rsi
               :    9b06:	mov    %rax,%r14
               :    9b09:	callq  ae0 <calloc@plt>
               :    9b0e:	test   %rax,%rax
               :    9b11:	mov    %rax,%r15
               :    9b14:	je     9e1b <do_lookup_x+0x7eb>
               :    9b1a:	lea    -0x2(%r14),%rax
               :    9b1e:	test   %r12,%r12
               :    9b21:	mov    %rax,0x38(%rsp)
               :    9b26:	je     9bb9 <do_lookup_x+0x589>
               :    9b2c:	mov    0x28(%rsp),%rbx
               :    9b31:	mov    %r12,%rcx
               :    9b34:	mov    %rax,%r10
               :    9b37:	shl    $0x5,%rcx
               :    9b3b:	lea    (%rcx,%rbx,1),%r12
               :    9b3f:	mov    %rbx,%rsi
               :    9b42:	nopw   0x0(%rax,%rax,1)
               :    9b48:	mov    0x8(%rsi),%r8
               :    9b4c:	test   %r8,%r8
               :    9b4f:	je     9bb0 <do_lookup_x+0x580>
               :    9b51:	mov    (%rsi),%r9d
               :    9b54:	xor    %edx,%edx
               :    9b56:	mov    0x18(%rsi),%r11
               :    9b5a:	mov    0x10(%rsi),%rbx
               :    9b5e:	mov    %r9d,%edi
               :    9b61:	mov    %rdi,%rax
               :    9b64:	div    %r14
               :    9b67:	mov    %rdi,%rax
               :    9b6a:	mov    %rdx,%rcx
               :    9b6d:	xor    %edx,%edx
               :    9b6f:	div    %r10
               :    9b72:	add    $0x1,%rdx
               :    9b76:	mov    %rdx,%rbp
               :    9b79:	shl    $0x5,%rbp
               :    9b7d:	mov    %rcx,%rax
               :    9b80:	shl    $0x5,%rax
               :    9b84:	lea    0x8(%r15,%rax,1),%rax
               :    9b89:	jmp    9b9b <do_lookup_x+0x56b>
               :    9b8b:	nopl   0x0(%rax,%rax,1)
               :    9b90:	add    %rdx,%rcx
               :    9b93:	add    %rbp,%rax
               :    9b96:	cmp    %rcx,%r14
               :    9b99:	jbe    9bf0 <do_lookup_x+0x5c0>
               :    9b9b:	cmpq   $0x0,(%rax)
               :    9b9f:	jne    9b90 <do_lookup_x+0x560>
               :    9ba1:	mov    %r9d,-0x8(%rax)
               :    9ba5:	mov    %r8,(%rax)
               :    9ba8:	mov    %rbx,0x8(%rax)
               :    9bac:	mov    %r11,0x10(%rax)
               :    9bb0:	add    $0x20,%rsi
               :    9bb4:	cmp    %r12,%rsi
               :    9bb7:	jne    9b48 <do_lookup_x+0x518>
               :    9bb9:	mov    0x30(%rsp),%rbx
               :    9bbe:	mov    0x28(%rsp),%rdi
               :    9bc3:	mov    %r14,%r12
               :    9bc6:	callq  *0x40(%rbx)
               :    9bc9:	mov    0x217428(%rip),%rax        # 220ff8 <_GLOBAL_OFFSET_TABLE_+0x58>
               :    9bd0:	mov    %r14,0x30(%rbx)
               :    9bd4:	mov    %r15,0x28(%rbx)
               :    9bd8:	mov    %r15,0x28(%rsp)
               :    9bdd:	mov    %rax,0x40(%rbx)
               :    9be1:	jmpq   99a2 <do_lookup_x+0x372>
               :    9be6:	nopw   %cs:0x0(%rax,%rax,1)
               :    9bf0:	sub    %r14,%rcx
               :    9bf3:	jmp    9b7d <do_lookup_x+0x54d>
               :    9bf5:	mov    0x50(%rsp),%rax
               :    9bfa:	mov    0x18(%rsp),%rbx
               :    9bff:	jmpq   9956 <do_lookup_x+0x326>
               :    9c04:	test   %r12,%r12
               :    9c07:	jne    9e43 <do_lookup_x+0x813>
               :    9c0d:	mov    $0x1f,%esi
               :    9c12:	mov    $0x20,%edi
               :    9c17:	callq  ae0 <calloc@plt>
               :    9c1c:	test   %rax,%rax
               :    9c1f:	mov    %rax,%rsi
               :    9c22:	mov    %rax,0x28(%rsp)
               :    9c27:	je     9e1b <do_lookup_x+0x7eb>
               :    9c2d:	mov    0x30(%rsp),%rbx
               :    9c32:	mov    0x2173bf(%rip),%rax        # 220ff8 <_GLOBAL_OFFSET_TABLE_+0x58>
               :    9c39:	mov    $0x1f,%r12d
               :    9c3f:	movq   $0x1d,0x38(%rsp)
               :    9c48:	mov    %rsi,0x28(%rbx)
               :    9c4c:	movq   $0x1f,0x30(%rbx)
               :    9c54:	mov    %rax,0x40(%rbx)
               :    9c58:	jmpq   99a2 <do_lookup_x+0x372>
               :    9c5d:	mov    0x8(%rdi),%rdx
               :    9c61:	mov    0x30(%rdi),%rcx
               :    9c65:	cmpb   $0x0,(%rdx)
               :    9c68:	jne    9c74 <do_lookup_x+0x644>
               :    9c6a:	mov    0x21712f(%rip),%rax        # 220da0 <_dl_argv>
               :    9c71:	mov    (%rax),%rdx
               :    9c74:	mov    0x58(%rsp),%rsi
               :    9c79:	lea    0x130d0(%rip),%rdi        # 1cd50 <expected1.7915+0xffd>
               :    9c80:	xor    %eax,%eax
               :    9c82:	mov    %r8d,0x28(%rsp)
               :    9c87:	mov    %r11,0x18(%rsp)
               :    9c8c:	mov    %r9,0x10(%rsp)
               :    9c91:	callq  103d0 <_dl_debug_printf>
               :    9c96:	mov    0x50(%rsp),%rdi
               :    9c9b:	mov    0x28(%rsp),%r8d
               :    9ca0:	mov    0x18(%rsp),%r11
               :    9ca5:	mov    0x10(%rsp),%r9
               :    9caa:	jmpq   9705 <do_lookup_x+0xd5>
               :    9caf:	mov    %edx,%ecx
               :    9cb1:	mov    %r13,%rax
               :    9cb4:	xor    %edx,%edx
               :    9cb6:	div    %rcx
               :    9cb9:	mov    0x300(%rdi),%rax
               :    9cc0:	mov    (%rax,%rdx,4),%eax
               :    9cc3:	test   %eax,%eax
               :    9cc5:	je     976b <do_lookup_x+0x13b>
               :    9ccb:	mov    0x308(%rdi),%rdx
               :    9cd2:	lea    (%rdx,%rax,4),%rdx
               :    9cd6:	jmp    9ced <do_lookup_x+0x6bd>
               :    9cd8:	nopl   0x0(%rax,%rax,1)
               :    9ce0:	add    $0x4,%rdx
               :    9ce4:	and    $0x1,%ecx
               :    9ce7:	jne    976b <do_lookup_x+0x13b>
               :    9ced:	mov    (%rdx),%ecx
               :    9cef:	mov    %ecx,%eax
               :    9cf1:	xor    %r13,%rax
               :    9cf4:	shr    %rax
               :    9cf7:	jne    9ce0 <do_lookup_x+0x6b0>
               :    9cf9:	mov    0x50(%rsp),%rax
               :    9cfe:	mov    %rdx,%rsi
               :    9d01:	mov    0x8(%rsp),%r10
               :    9d06:	mov    %r8d,0x30(%rsp)
               :    9d0b:	mov    %r11,0x28(%rsp)
               :    9d10:	mov    %r9,0x18(%rsp)
               :    9d15:	mov    %rdx,0x10(%rsp)
               :    9d1a:	sub    0x308(%rax),%rsi
               :    9d21:	mov    %rsi,%rax
               :    9d24:	sar    $0x2,%rax
               :    9d28:	mov    %eax,0x78(%rsp)
               :    9d2c:	mov    %eax,%eax
               :    9d2e:	lea    (%rax,%rax,2),%rax
               :    9d32:	lea    (%rbx,%rax,8),%rdi
               :    9d36:	callq  94e0 <check_match.9440>
               :    9d3b:	test   %rax,%rax
               :    9d3e:	mov    0x18(%rsp),%r9
               :    9d43:	mov    0x28(%rsp),%r11
               :    9d48:	mov    0x30(%rsp),%r8d
               :    9d4d:	jne    97e2 <do_lookup_x+0x1b2>
               :    9d53:	mov    0x10(%rsp),%rdx
               :    9d58:	mov    (%rdx),%ecx
               :    9d5a:	jmp    9ce0 <do_lookup_x+0x6b0>
               :    9d5c:	mov    (%r11),%rax
               :    9d5f:	mov    $0xffffffff,%esi
               :    9d64:	cmp    %rsi,%rax
               :    9d67:	je     9e58 <do_lookup_x+0x828>
               :    9d6d:	mov    %edx,%ecx
               :    9d6f:	xor    %edx,%edx
               :    9d71:	div    %rcx
               :    9d74:	lea    0x0(,%rdx,4),%rax
               :    9d7c:	mov    0x308(%rdi),%rdx
               :    9d83:	mov    (%rdx,%rax,1),%eax
               :    9d86:	test   %eax,%eax
               :    9d88:	mov    %eax,0x78(%rsp)
               :    9d8c:	jne    9db7 <do_lookup_x+0x787>
               :    9d8e:	jmpq   9773 <do_lookup_x+0x143>
               :    9d93:	nopl   0x0(%rax,%rax,1)
               :    9d98:	mov    0x50(%rsp),%rax
     1 5.1e-04 :    9d9d:	mov    0x78(%rsp),%edx
               :    9da1:	mov    0x300(%rax),%rax
               :    9da8:	mov    (%rax,%rdx,4),%eax
               :    9dab:	test   %eax,%eax
               :    9dad:	mov    %eax,0x78(%rsp)
               :    9db1:	je     9773 <do_lookup_x+0x143>
               :    9db7:	lea    (%rax,%rax,2),%rax
               :    9dbb:	mov    0x8(%rsp),%r10
               :    9dc0:	mov    %r8d,0x28(%rsp)
               :    9dc5:	mov    %r11,0x18(%rsp)
               :    9dca:	mov    %r9,0x10(%rsp)
               :    9dcf:	lea    (%rbx,%rax,8),%rdi
               :    9dd3:	callq  94e0 <check_match.9440>
               :    9dd8:	test   %rax,%rax
               :    9ddb:	mov    0x10(%rsp),%r9
               :    9de0:	mov    0x18(%rsp),%r11
               :    9de5:	mov    0x28(%rsp),%r8d
               :    9dea:	je     9d98 <do_lookup_x+0x768>
               :    9dec:	jmpq   97e2 <do_lookup_x+0x1b2>
               :    9df1:	mov    0x20(%rsp),%rbx
               :    9df6:	cmpq   $0x0,(%rbx)
               :    9dfa:	jne    97f8 <do_lookup_x+0x1c8>
               :    9e00:	mov    %rax,(%rbx)
               :    9e03:	mov    0x50(%rsp),%rax
               :    9e08:	mov    %rax,0x8(%rbx)
               :    9e0c:	jmpq   97f8 <do_lookup_x+0x1c8>
               :    9e11:	mov    $0xffffffff,%eax
               :    9e16:	jmpq   9844 <do_lookup_x+0x214>
               :    9e1b:	mov    0x30(%rsp),%rdi
               :    9e20:	callq  *0x2180e2(%rip)        # 221f08 <_rtld_global+0xf08>
               :    9e26:	lea    0x11946(%rip),%rsi        # 1b773 <__GI__itoa_lower_digits+0x233>
               :    9e2d:	mov    $0x2,%edi
               :    9e32:	xor    %eax,%eax
               :    9e34:	callq  10490 <_dl_dprintf>
               :    9e39:	mov    $0x7f,%edi
               :    9e3e:	callq  18c90 <_Exit>
               :    9e43:	mov    0x30(%rsp),%rdi
               :    9e48:	callq  *0x2180ba(%rip)        # 221f08 <_rtld_global+0xf08>
               :    9e4e:	mov    0x18(%rsp),%rsi
               :    9e53:	jmpq   982e <do_lookup_x+0x1fe>
               :    9e58:	mov    0x58(%rsp),%rsi
               :    9e5d:	xor    %eax,%eax
               :    9e5f:	movzbl (%rsi),%ecx
               :    9e62:	test   %rcx,%rcx
               :    9e65:	je     9eee <do_lookup_x+0x8be>
               :    9e6b:	movzbl 0x1(%rsi),%eax
               :    9e6f:	test   %al,%al
               :    9e71:	je     9edc <do_lookup_x+0x8ac>
               :    9e73:	shl    $0x4,%rcx
               :    9e77:	add    %rax,%rcx
               :    9e7a:	movzbl 0x2(%rsi),%eax
               :    9e7e:	test   %al,%al
               :    9e80:	je     9edc <do_lookup_x+0x8ac>
               :    9e82:	shl    $0x4,%rcx
               :    9e86:	add    %rax,%rcx
               :    9e89:	movzbl 0x3(%rsi),%eax
               :    9e8d:	test   %al,%al
               :    9e8f:	je     9edc <do_lookup_x+0x8ac>
               :    9e91:	shl    $0x4,%rcx
               :    9e95:	add    %rax,%rcx
               :    9e98:	movzbl 0x4(%rsi),%eax
               :    9e9c:	test   %al,%al
               :    9e9e:	je     9edc <do_lookup_x+0x8ac>
               :    9ea0:	shl    $0x4,%rcx
               :    9ea4:	lea    0x5(%rsi),%r10
               :    9ea8:	add    %rax,%rcx
               :    9eab:	movzbl 0x5(%rsi),%eax
               :    9eaf:	test   %al,%al
               :    9eb1:	je     9ed6 <do_lookup_x+0x8a6>
               :    9eb3:	shl    $0x4,%rcx
               :    9eb7:	add    $0x1,%r10
               :    9ebb:	add    %rcx,%rax
               :    9ebe:	mov    %rax,%rcx
               :    9ec1:	and    $0xf0000000,%ecx
               :    9ec7:	shr    $0x18,%rcx
               :    9ecb:	xor    %rax,%rcx
               :    9ece:	movzbl (%r10),%eax
               :    9ed2:	test   %al,%al
               :    9ed4:	jne    9eb3 <do_lookup_x+0x883>
               :    9ed6:	and    $0xfffffff,%ecx
               :    9edc:	mov    %edx,%esi
               :    9ede:	mov    %rcx,%rax
               :    9ee1:	xor    %edx,%edx
               :    9ee3:	div    %rsi
               :    9ee6:	lea    0x0(,%rdx,4),%rax
               :    9eee:	mov    %rcx,(%r11)
               :    9ef1:	jmpq   9d7c <do_lookup_x+0x74c>
               :    9ef6:	nopw   %cs:0x0(%rax,%rax,1)
/* 
 * Command line: opannotate -e main --assembly ./aes_gcm 
 * 
 * Interpretation of command line:
 * Output annotated assembly listing with samples
 * 
 * CPU: Intel Haswell microarchitecture, speed 2.601e+06 MHz (estimated)
 * Counted CPU_CLK_UNHALTED events (Clock cycles when not halted) with a unit mask of 0x00 (No unit mask) count 100000
 */
               :
               :/usr/lib64/libc-2.17.so:     file format elf64-x86-64
               :
               :
               :Disassembly of section .text:
               :
00000000000395b0 <random_r>: /* random_r total:  99091 50.3772 */
  8695  4.4205 :   395b0:	test   %rdi,%rdi
               :   395b3:	je     39638 <random_r+0x88>
               :   395b9:	test   %rsi,%rsi
               :   395bc:	je     39638 <random_r+0x88>
     6  0.0031 :   395be:	mov    0x18(%rdi),%eax
  8730  4.4383 :   395c1:	mov    0x10(%rdi),%rdx
    75  0.0381 :   395c5:	test   %eax,%eax
               :   395c7:	je     39618 <random_r+0x68>
   265  0.1347 :   395c9:	mov    (%rdi),%rcx
    17  0.0086 :   395cc:	mov    0x8(%rdi),%r8
  7885  4.0087 :   395d0:	mov    0x28(%rdi),%r9
   148  0.0752 :   395d4:	mov    (%rcx),%eax
 14321  7.2807 :   395d6:	add    (%r8),%eax
 16466  8.3712 :   395d9:	add    $0x4,%rcx
    25  0.0127 :   395dd:	mov    %eax,-0x4(%rcx)
 14627  7.4363 :   395e0:	shr    %eax
     5  0.0025 :   395e2:	cmp    %rcx,%r9
               :   395e5:	mov    %eax,(%rsi)
  5919  3.0092 :   395e7:	jbe    39600 <random_r+0x50>
  2076  1.0554 :   395e9:	add    $0x4,%r8
     4  0.0020 :   395ed:	mov    %rcx,(%rdi)
               :   395f0:	cmp    %r8,%r9
  5833  2.9655 :   395f3:	cmova  %r8,%rdx
  2220  1.1286 :   395f7:	xor    %eax,%eax
  5706  2.9009 :   395f9:	mov    %rdx,0x8(%rdi)
  2065  1.0498 :   395fd:	retq   
               :   395fe:	xchg   %ax,%ax
  1043  0.5303 :   39600:	mov    %rdx,%rcx
   449  0.2283 :   39603:	lea    0x4(%r8),%rdx
  1057  0.5374 :   39607:	xor    %eax,%eax
               :   39609:	mov    %rcx,(%rdi)
  1214  0.6172 :   3960c:	mov    %rdx,0x8(%rdi)
   240  0.1220 :   39610:	retq   
               :   39611:	nopl   0x0(%rax)
               :   39618:	mov    (%rdx),%ecx
               :   3961a:	imul   $0x41c64e6d,%ecx,%ecx
               :   39620:	add    $0x3039,%ecx
               :   39626:	and    $0x7fffffff,%ecx
               :   3962c:	mov    %ecx,(%rdx)
               :   3962e:	mov    %ecx,(%rsi)
               :   39630:	retq   
               :   39631:	nopl   0x0(%rax)
               :   39638:	mov    0x380829(%rip),%rax        # 3b9e68 <_DYNAMIC+0x2e8>
               :   3963f:	movl   $0x16,%fs:(%rax)
               :   39646:	mov    $0xffffffff,%eax
               :   3964b:	retq   
               :   3964c:	nopl   0x0(%rax)
               :
               :/usr/lib64/libc-2.17.so:     file format elf64-x86-64
               :
               :
               :Disassembly of section .text:
               :
0000000000039350 <random>: /* random total:  56744 28.8483 */
  8172  4.1546 :   39350:	sub    $0x18,%rsp
               :   39354:	mov    $0x1,%esi
    76  0.0386 :   39359:	xor    %eax,%eax
  8036  4.0855 :   3935b:	cmpl   $0x0,0x386c52(%rip)        # 3bffb4 <__libc_multiple_threads>
    11  0.0056 :   39362:	je     39374 <random+0x24>
               :   39364:	lock cmpxchg %esi,0x383354(%rip)        # 3bc6c0 <lock>
               :   3936c:	jne    3947a <_L_lock_130>
               :   39372:	jmp    39381 <random+0x31>
    75  0.0381 :   39374:	cmpxchg %esi,0x383345(%rip)        # 3bc6c0 <lock>
 16366  8.3204 :   3937b:	jne    3947a <_L_lock_130>
     4  0.0020 :   39381:	lea    0x381358(%rip),%rdi        # 3ba6e0 <unsafe_state>
    76  0.0386 :   39388:	lea    0xc(%rsp),%rsi
     7  0.0036 :   3938d:	callq  395b0 <random_r>
     9  0.0046 :   39392:	cmpl   $0x0,0x386c1b(%rip)        # 3bffb4 <__libc_multiple_threads>
  5926  3.0127 :   39399:	je     393aa <random+0x5a>
               :   3939b:	lock decl 0x38331e(%rip)        # 3bc6c0 <lock>
               :   393a2:	jne    39499 <_L_unlock_140>
               :   393a8:	jmp    393b6 <random+0x66>
  2350  1.1947 :   393aa:	decl   0x383310(%rip)        # 3bc6c0 <lock>
  6035  3.0682 :   393b0:	jne    39499 <_L_unlock_140>
  2078  1.0564 :   393b6:	movslq 0xc(%rsp),%rax
  7523  3.8246 :   393bb:	add    $0x18,%rsp
               :   393bf:	retq   
               :
               :/usr/lib64/libc-2.17.so:     file format elf64-x86-64
               :
               :
               :Disassembly of section .text:
               :
0000000000039890 <rand>: /* rand total:  16940  8.6122 */
  8377  4.2588 :   39890:	sub    $0x8,%rsp
               :   39894:	callq  39350 <random>
  1766  0.8978 :   39899:	add    $0x8,%rsp
  6797  3.4556 :   3989d:	retq   
               :   3989e:	xchg   %ax,%ax
               :
               :/usr/lib64/libc-2.17.so:     file format elf64-x86-64
               :
               :
               :Disassembly of section .text:
               :
0000000000131b80 <_dl_addr>: /* _dl_addr total:      1 5.1e-04 */
               :  131b80:	push   %r15
               :  131b82:	push   %r14
               :  131b84:	push   %r13
               :  131b86:	mov    %rsi,%r13
               :  131b89:	push   %r12
               :  131b8b:	push   %rbp
               :  131b8c:	push   %rbx
               :  131b8d:	mov    %rdi,%rbx
               :  131b90:	sub    $0x28,%rsp
               :  131b94:	mov    0x28824d(%rip),%rax        # 3b9de8 <_DYNAMIC+0x268>
               :  131b9b:	mov    %rdx,0x10(%rsp)
               :  131ba0:	mov    %rcx,0x18(%rsp)
               :  131ba5:	lea    0x908(%rax),%rdi
               :  131bac:	callq  *0xf00(%rax)
               :  131bb2:	mov    0x28822f(%rip),%rax        # 3b9de8 <_DYNAMIC+0x268>
               :  131bb9:	mov    0x900(%rax),%r11
               :  131bc0:	test   %r11,%r11
               :  131bc3:	je     131df1 <_dl_addr+0x271>
               :  131bc9:	mov    %rax,%r9
               :  131bcc:	xor    %r10d,%r10d
               :  131bcf:	mov    (%r9),%rax
               :  131bd2:	test   %rax,%rax
               :  131bd5:	je     131ddd <_dl_addr+0x25d>
               :  131bdb:	nopl   0x0(%rax,%rax,1)
               :  131be0:	mov    0x340(%rax),%rdi
               :  131be7:	cmp    %rdi,%rbx
               :  131bea:	jb     131dd0 <_dl_addr+0x250>
               :  131bf0:	cmp    0x348(%rax),%rbx
               :  131bf7:	jae    131dd0 <_dl_addr+0x250>
               :  131bfd:	testb  $0x40,0x315(%rax)
               :  131c04:	jne    131c5a <_dl_addr+0xda>
               :  131c06:	movzwl 0x2b0(%rax),%edx
               :  131c0d:	mov    %rbx,%r8
               :  131c10:	sub    (%rax),%r8
               :  131c13:	lea    0x0(,%rdx,8),%rcx
               :  131c1b:	shl    $0x6,%rdx
               :  131c1f:	sub    %rcx,%rdx
               :  131c22:	sub    $0x38,%rdx
               :  131c26:	jmp    131c34 <_dl_addr+0xb4>
               :  131c28:	nopl   0x0(%rax,%rax,1)
               :  131c30:	sub    $0x38,%rdx
               :  131c34:	cmp    $0xffffffffffffffc8,%rdx
               :  131c38:	je     131dd0 <_dl_addr+0x250>
               :  131c3e:	mov    %rdx,%rcx
               :  131c41:	add    0x2a0(%rax),%rcx
               :  131c48:	cmpl   $0x1,(%rcx)
               :  131c4b:	jne    131c30 <_dl_addr+0xb0>
               :  131c4d:	mov    %r8,%rsi
               :  131c50:	sub    0x10(%rcx),%rsi
               :  131c54:	cmp    0x28(%rcx),%rsi
               :  131c58:	jae    131c30 <_dl_addr+0xb0>
               :  131c5a:	mov    0x8(%rax),%rdx
               :  131c5e:	mov    %rdi,0x8(%r13)
               :  131c62:	mov    %rdx,0x0(%r13)
               :  131c66:	cmpb   $0x0,(%rdx)
               :  131c69:	je     131ecc <_dl_addr+0x34c>
               :  131c6f:	mov    0x70(%rax),%rdx
               :  131c73:	cmpq   $0x0,0x298(%rax)
               :  131c7b:	mov    0x8(%rdx),%r11
               :  131c7f:	mov    0x68(%rax),%rdx
               :  131c83:	mov    0x8(%rdx),%rdi
               :  131c87:	mov    0x90(%rax),%rdx
               :  131c8e:	mov    %rdi,0x8(%rsp)
               :  131c93:	mov    0x8(%rdx),%r15d
               :  131c97:	je     131df5 <_dl_addr+0x275>
               :  131c9d:	mov    0x2ec(%rax),%esi
               :  131ca3:	test   %esi,%esi
               :  131ca5:	je     131eba <_dl_addr+0x33a>
               :  131cab:	mov    0x300(%rax),%r14
               :  131cb2:	xor    %ebp,%ebp
               :  131cb4:	xor    %r12d,%r12d
               :  131cb7:	nopw   0x0(%rax,%rax,1)
               :  131cc0:	mov    (%r14,%rbp,4),%ecx
               :  131cc4:	test   %ecx,%ecx
               :  131cc6:	je     131d5d <_dl_addr+0x1dd>
               :  131ccc:	mov    0x308(%rax),%rdi
               :  131cd3:	mov    %ecx,%edx
               :  131cd5:	lea    (%rdi,%rdx,4),%rdi
               :  131cd9:	jmp    131ce2 <_dl_addr+0x162>
               :  131cdb:	nopl   0x0(%rax,%rax,1)
               :  131ce0:	mov    %ecx,%edx
               :  131ce2:	lea    (%rdx,%rdx,2),%rdx
               :  131ce6:	lea    (%r11,%rdx,8),%rdx
               :  131cea:	movzwl 0x6(%rdx),%r9d
               :  131cef:	test   %r9w,%r9w
               :  131cf3:	jne    131cfc <_dl_addr+0x17c>
               :  131cf5:	cmpq   $0x0,0x8(%rdx)
               :  131cfa:	je     131d50 <_dl_addr+0x1d0>
               :  131cfc:	movzbl 0x4(%rdx),%r8d
               :  131d01:	and    $0xf,%r8d
               :  131d05:	cmp    $0x6,%r8b
               :  131d09:	je     131d50 <_dl_addr+0x1d0>
               :  131d0b:	mov    0x8(%rdx),%r10
               :  131d0f:	mov    %r10,%r8
               :  131d12:	add    (%rax),%r8
               :  131d15:	cmp    %r8,%rbx
               :  131d18:	jb     131d50 <_dl_addr+0x1d0>
               :  131d1a:	test   %r9w,%r9w
               :  131d1e:	je     131d29 <_dl_addr+0x1a9>
     1 5.1e-04 :  131d20:	mov    0x10(%rdx),%r9
               :  131d24:	test   %r9,%r9
               :  131d27:	jne    131d32 <_dl_addr+0x1b2>
               :  131d29:	cmp    %r8,%rbx
               :  131d2c:	je     131d3a <_dl_addr+0x1ba>
               :  131d2e:	mov    0x10(%rdx),%r9
               :  131d32:	add    %r9,%r8
               :  131d35:	cmp    %r8,%rbx
               :  131d38:	jae    131d50 <_dl_addr+0x1d0>
               :  131d3a:	test   %r12,%r12
               :  131d3d:	je     131d46 <_dl_addr+0x1c6>
               :  131d3f:	cmp    0x8(%r12),%r10
               :  131d44:	jbe    131d50 <_dl_addr+0x1d0>
               :  131d46:	cmp    (%rdx),%r15d
               :  131d49:	cmova  %rdx,%r12
               :  131d4d:	nopl   (%rax)
               :  131d50:	add    $0x4,%rdi
               :  131d54:	add    $0x1,%ecx
               :  131d57:	testb  $0x1,-0x4(%rdi)
               :  131d5b:	je     131ce0 <_dl_addr+0x160>
               :  131d5d:	add    $0x1,%rbp
               :  131d61:	cmp    %ebp,%esi
               :  131d63:	ja     131cc0 <_dl_addr+0x140>
               :  131d69:	mov    0x10(%rsp),%rbx
               :  131d6e:	test   %rbx,%rbx
               :  131d71:	je     131d76 <_dl_addr+0x1f6>
               :  131d73:	mov    %rax,(%rbx)
               :  131d76:	mov    0x18(%rsp),%rbx
               :  131d7b:	test   %rbx,%rbx
               :  131d7e:	je     131d83 <_dl_addr+0x203>
               :  131d80:	mov    %r12,(%rbx)
               :  131d83:	test   %r12,%r12
               :  131d86:	je     131ea0 <_dl_addr+0x320>
               :  131d8c:	mov    (%r12),%edx
               :  131d90:	mov    $0x1,%ebx
               :  131d95:	add    0x8(%rsp),%rdx
               :  131d9a:	mov    %rdx,0x10(%r13)
               :  131d9e:	mov    0x8(%r12),%rdx
               :  131da3:	add    (%rax),%rdx
               :  131da6:	mov    %rdx,0x18(%r13)
               :  131daa:	mov    0x288037(%rip),%rax        # 3b9de8 <_DYNAMIC+0x268>
               :  131db1:	lea    0x908(%rax),%rdi
               :  131db8:	callq  *0xf08(%rax)
               :  131dbe:	add    $0x28,%rsp
               :  131dc2:	mov    %ebx,%eax
               :  131dc4:	pop    %rbx
               :  131dc5:	pop    %rbp
               :  131dc6:	pop    %r12
               :  131dc8:	pop    %r13
               :  131dca:	pop    %r14
               :  131dcc:	pop    %r15
               :  131dce:	retq   
               :  131dcf:	nop
               :  131dd0:	mov    0x18(%rax),%rax
               :  131dd4:	test   %rax,%rax
               :  131dd7:	jne    131be0 <_dl_addr+0x60>
               :  131ddd:	add    $0x1,%r10
               :  131de1:	add    $0x90,%r9
               :  131de8:	cmp    %r11,%r10
               :  131deb:	jne    131bcf <_dl_addr+0x4f>
               :  131df1:	xor    %ebx,%ebx
               :  131df3:	jmp    131daa <_dl_addr+0x22a>
               :  131df5:	mov    0x60(%rax),%rdx
               :  131df9:	test   %rdx,%rdx
               :  131dfc:	je     131ec2 <_dl_addr+0x342>
               :  131e02:	mov    0x8(%rdx),%rdx
               :  131e06:	mov    0x4(%rdx),%edx
               :  131e09:	lea    (%rdx,%rdx,2),%rdx
               :  131e0d:	lea    (%r11,%rdx,8),%rsi
               :  131e11:	xor    %r12d,%r12d
               :  131e14:	cmp    %rsi,%r11
               :  131e17:	jb     131e2d <_dl_addr+0x2ad>
               :  131e19:	jmpq   131d69 <_dl_addr+0x1e9>
               :  131e1e:	xchg   %ax,%ax
               :  131e20:	add    $0x18,%r11
               :  131e24:	cmp    %rsi,%r11
               :  131e27:	jae    131d69 <_dl_addr+0x1e9>
               :  131e2d:	movzbl 0x4(%r11),%edx
               :  131e32:	mov    %edx,%ecx
               :  131e34:	shr    $0x4,%cl
               :  131e37:	sub    $0x1,%ecx
               :  131e3a:	cmp    $0x1,%cl
               :  131e3d:	ja     131e20 <_dl_addr+0x2a0>
               :  131e3f:	and    $0xf,%edx
               :  131e42:	cmp    $0x6,%dl
               :  131e45:	je     131e20 <_dl_addr+0x2a0>
               :  131e47:	cmpw   $0x0,0x6(%r11)
               :  131e4d:	mov    0x8(%r11),%rcx
               :  131e51:	je     131e8d <_dl_addr+0x30d>
               :  131e53:	mov    %rcx,%rdx
               :  131e56:	add    (%rax),%rdx
               :  131e59:	cmp    %rdx,%rbx
               :  131e5c:	jb     131e20 <_dl_addr+0x2a0>
               :  131e5e:	mov    0x10(%r11),%rdi
               :  131e62:	test   %rdi,%rdi
               :  131e65:	jne    131e70 <_dl_addr+0x2f0>
               :  131e67:	cmp    %rdx,%rbx
               :  131e6a:	je     131e78 <_dl_addr+0x2f8>
               :  131e6c:	mov    0x10(%r11),%rdi
               :  131e70:	add    %rdi,%rdx
               :  131e73:	cmp    %rdx,%rbx
               :  131e76:	jae    131e20 <_dl_addr+0x2a0>
               :  131e78:	test   %r12,%r12
               :  131e7b:	je     131e84 <_dl_addr+0x304>
               :  131e7d:	cmp    0x8(%r12),%rcx
               :  131e82:	jbe    131e20 <_dl_addr+0x2a0>
               :  131e84:	cmp    (%r11),%r15d
               :  131e87:	cmova  %r11,%r12
               :  131e8b:	jmp    131e20 <_dl_addr+0x2a0>
               :  131e8d:	test   %rcx,%rcx
               :  131e90:	je     131e20 <_dl_addr+0x2a0>
               :  131e92:	mov    %rcx,%rdx
               :  131e95:	add    (%rax),%rdx
               :  131e98:	cmp    %rdx,%rbx
               :  131e9b:	jae    131e67 <_dl_addr+0x2e7>
               :  131e9d:	jmp    131e20 <_dl_addr+0x2a0>
               :  131e9f:	nop
               :  131ea0:	movq   $0x0,0x10(%r13)
               :  131ea8:	movq   $0x0,0x18(%r13)
               :  131eb0:	mov    $0x1,%ebx
               :  131eb5:	jmpq   131daa <_dl_addr+0x22a>
               :  131eba:	xor    %r12d,%r12d
               :  131ebd:	jmpq   131d69 <_dl_addr+0x1e9>
               :  131ec2:	mov    0x8(%rsp),%rsi
               :  131ec7:	jmpq   131e11 <_dl_addr+0x291>
               :  131ecc:	testb  $0x3,0x314(%rax)
               :  131ed3:	jne    131c6f <_dl_addr+0xef>
               :  131ed9:	mov    0x2880f8(%rip),%rdx        # 3b9fd8 <_DYNAMIC+0x458>
               :  131ee0:	mov    (%rdx),%rdx
               :  131ee3:	mov    (%rdx),%rdx
               :  131ee6:	mov    %rdx,0x0(%r13)
               :  131eea:	jmpq   131c6f <_dl_addr+0xef>
               :  131eef:	nop
