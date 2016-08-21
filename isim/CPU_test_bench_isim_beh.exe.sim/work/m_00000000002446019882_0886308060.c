/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Processor-Design/ALU.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {4U, 0U};
static unsigned int ng6[] = {5U, 0U};
static unsigned int ng7[] = {6U, 0U};
static int ng8[] = {8, 0};
static unsigned int ng9[] = {7U, 0U};
static unsigned int ng10[] = {8U, 0U};
static int ng11[] = {1, 0};
static unsigned int ng12[] = {9U, 0U};
static unsigned int ng13[] = {10U, 0U};
static unsigned int ng14[] = {11U, 0U};
static unsigned int ng15[] = {12U, 0U};
static unsigned int ng16[] = {13U, 0U};



static void Always_30_0(char *t0)
{
    char t9[8];
    char t40[8];
    char t50[8];
    char t64[8];
    char t95[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t51;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    int t87;
    int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    char *t100;
    char *t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    char *t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    char *t123;

LAB0:    t1 = (t0 + 4752U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 5320);
    *((int *)t2) = 1;
    t3 = (t0 + 4784);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(31, ng0);

LAB5:    xsi_set_current_line(32, ng0);
    t4 = (t0 + 3272U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t4, 4);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng16)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB33;

LAB34:
LAB36:
LAB35:    xsi_set_current_line(90, ng0);

LAB73:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 3832);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 16);

LAB37:    goto LAB2;

LAB7:    xsi_set_current_line(33, ng0);

LAB38:    xsi_set_current_line(34, ng0);
    t7 = (t0 + 2952U);
    t8 = *((char **)t7);
    t7 = (t0 + 3832);
    xsi_vlogvar_assign_value(t7, t8, 0, 0, 16);
    goto LAB37;

LAB9:    xsi_set_current_line(37, ng0);

LAB39:    xsi_set_current_line(38, ng0);
    t3 = (t0 + 3112U);
    t4 = *((char **)t3);
    t3 = (t0 + 3832);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB37;

LAB11:    xsi_set_current_line(41, ng0);

LAB40:    xsi_set_current_line(42, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    t3 = (t0 + 3112U);
    t7 = *((char **)t3);
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 16, t4, 16, t7, 16);
    t3 = (t0 + 3832);
    xsi_vlogvar_assign_value(t3, t9, 0, 0, 16);
    goto LAB37;

LAB13:    xsi_set_current_line(45, ng0);

LAB41:    xsi_set_current_line(46, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    t3 = (t0 + 3112U);
    t7 = *((char **)t3);
    memset(t9, 0, 8);
    xsi_vlog_unsigned_minus(t9, 16, t4, 16, t7, 16);
    t3 = (t0 + 3832);
    xsi_vlogvar_assign_value(t3, t9, 0, 0, 16);
    goto LAB37;

LAB15:    xsi_set_current_line(49, ng0);

LAB42:    xsi_set_current_line(50, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng2)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 16, t4, 16, t3, 16);
    t7 = (t0 + 3832);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 16);
    goto LAB37;

LAB17:    xsi_set_current_line(53, ng0);

LAB43:    xsi_set_current_line(54, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 3832);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB37;

LAB19:    xsi_set_current_line(57, ng0);

LAB44:    xsi_set_current_line(58, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng8)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_lshift(t9, 16, t4, 16, t3, 32);
    t7 = (t0 + 3832);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 16);
    goto LAB37;

LAB21:    xsi_set_current_line(61, ng0);

LAB45:    xsi_set_current_line(62, ng0);
    t3 = (t0 + 3112U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng8)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_lshift(t9, 16, t4, 16, t3, 32);
    t7 = (t0 + 3832);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 16);
    goto LAB37;

LAB23:    xsi_set_current_line(65, ng0);

LAB46:    xsi_set_current_line(66, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng11)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_rshift(t9, 16, t4, 16, t3, 32);
    t7 = (t0 + 3832);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 16);
    goto LAB37;

LAB25:    xsi_set_current_line(69, ng0);

LAB47:    xsi_set_current_line(70, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng11)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_lshift(t9, 16, t4, 16, t3, 32);
    t7 = (t0 + 3832);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 16);
    goto LAB37;

LAB27:    xsi_set_current_line(73, ng0);

LAB48:    xsi_set_current_line(74, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    t3 = (t0 + 3112U);
    t7 = *((char **)t3);
    t10 = *((unsigned int *)t4);
    t11 = *((unsigned int *)t7);
    t12 = (t10 & t11);
    *((unsigned int *)t9) = t12;
    t3 = (t4 + 4);
    t8 = (t7 + 4);
    t13 = (t9 + 4);
    t14 = *((unsigned int *)t3);
    t15 = *((unsigned int *)t8);
    t16 = (t14 | t15);
    *((unsigned int *)t13) = t16;
    t17 = *((unsigned int *)t13);
    t18 = (t17 != 0);
    if (t18 == 1)
        goto LAB49;

LAB50:
LAB51:    t39 = (t0 + 3832);
    xsi_vlogvar_assign_value(t39, t9, 0, 0, 16);
    goto LAB37;

LAB29:    xsi_set_current_line(77, ng0);

LAB52:    xsi_set_current_line(78, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    t3 = (t0 + 3112U);
    t7 = *((char **)t3);
    t10 = *((unsigned int *)t4);
    t11 = *((unsigned int *)t7);
    t12 = (t10 | t11);
    *((unsigned int *)t9) = t12;
    t3 = (t4 + 4);
    t8 = (t7 + 4);
    t13 = (t9 + 4);
    t14 = *((unsigned int *)t3);
    t15 = *((unsigned int *)t8);
    t16 = (t14 | t15);
    *((unsigned int *)t13) = t16;
    t17 = *((unsigned int *)t13);
    t18 = (t17 != 0);
    if (t18 == 1)
        goto LAB53;

LAB54:
LAB55:    t39 = (t0 + 3832);
    xsi_vlogvar_assign_value(t39, t9, 0, 0, 16);
    goto LAB37;

LAB31:    xsi_set_current_line(81, ng0);

LAB56:    xsi_set_current_line(82, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t9 + 4);
    t7 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (~(t10));
    *((unsigned int *)t9) = t11;
    *((unsigned int *)t3) = 0;
    if (*((unsigned int *)t7) != 0)
        goto LAB58;

LAB57:    t17 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t17 & 65535U);
    t18 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t18 & 65535U);
    t8 = (t0 + 3112U);
    t13 = *((char **)t8);
    t19 = *((unsigned int *)t9);
    t20 = *((unsigned int *)t13);
    t23 = (t19 & t20);
    *((unsigned int *)t40) = t23;
    t8 = (t9 + 4);
    t21 = (t13 + 4);
    t22 = (t40 + 4);
    t24 = *((unsigned int *)t8);
    t25 = *((unsigned int *)t21);
    t26 = (t24 | t25);
    *((unsigned int *)t22) = t26;
    t27 = *((unsigned int *)t22);
    t28 = (t27 != 0);
    if (t28 == 1)
        goto LAB59;

LAB60:
LAB61:    t51 = (t0 + 3112U);
    t52 = *((char **)t51);
    memset(t50, 0, 8);
    t51 = (t50 + 4);
    t53 = (t52 + 4);
    t54 = *((unsigned int *)t52);
    t55 = (~(t54));
    *((unsigned int *)t50) = t55;
    *((unsigned int *)t51) = 0;
    if (*((unsigned int *)t53) != 0)
        goto LAB63;

LAB62:    t60 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t60 & 65535U);
    t61 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t61 & 65535U);
    t62 = (t0 + 2952U);
    t63 = *((char **)t62);
    t65 = *((unsigned int *)t50);
    t66 = *((unsigned int *)t63);
    t67 = (t65 & t66);
    *((unsigned int *)t64) = t67;
    t62 = (t50 + 4);
    t68 = (t63 + 4);
    t69 = (t64 + 4);
    t70 = *((unsigned int *)t62);
    t71 = *((unsigned int *)t68);
    t72 = (t70 | t71);
    *((unsigned int *)t69) = t72;
    t73 = *((unsigned int *)t69);
    t74 = (t73 != 0);
    if (t74 == 1)
        goto LAB64;

LAB65:
LAB66:    t96 = *((unsigned int *)t40);
    t97 = *((unsigned int *)t64);
    t98 = (t96 | t97);
    *((unsigned int *)t95) = t98;
    t99 = (t40 + 4);
    t100 = (t64 + 4);
    t101 = (t95 + 4);
    t102 = *((unsigned int *)t99);
    t103 = *((unsigned int *)t100);
    t104 = (t102 | t103);
    *((unsigned int *)t101) = t104;
    t105 = *((unsigned int *)t101);
    t106 = (t105 != 0);
    if (t106 == 1)
        goto LAB67;

LAB68:
LAB69:    t123 = (t0 + 3832);
    xsi_vlogvar_assign_value(t123, t95, 0, 0, 16);
    goto LAB37;

LAB33:    xsi_set_current_line(85, ng0);

LAB70:    xsi_set_current_line(86, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t9 + 4);
    t7 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (~(t10));
    *((unsigned int *)t9) = t11;
    *((unsigned int *)t3) = 0;
    if (*((unsigned int *)t7) != 0)
        goto LAB72;

LAB71:    t17 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t17 & 65535U);
    t18 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t18 & 65535U);
    t8 = (t0 + 3832);
    xsi_vlogvar_assign_value(t8, t9, 0, 0, 16);
    goto LAB37;

LAB49:    t19 = *((unsigned int *)t9);
    t20 = *((unsigned int *)t13);
    *((unsigned int *)t9) = (t19 | t20);
    t21 = (t4 + 4);
    t22 = (t7 + 4);
    t23 = *((unsigned int *)t4);
    t24 = (~(t23));
    t25 = *((unsigned int *)t21);
    t26 = (~(t25));
    t27 = *((unsigned int *)t7);
    t28 = (~(t27));
    t29 = *((unsigned int *)t22);
    t30 = (~(t29));
    t31 = (t24 & t26);
    t32 = (t28 & t30);
    t33 = (~(t31));
    t34 = (~(t32));
    t35 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t35 & t33);
    t36 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t36 & t34);
    t37 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t37 & t33);
    t38 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t38 & t34);
    goto LAB51;

LAB53:    t19 = *((unsigned int *)t9);
    t20 = *((unsigned int *)t13);
    *((unsigned int *)t9) = (t19 | t20);
    t21 = (t4 + 4);
    t22 = (t7 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t31 = (t25 & t24);
    t26 = *((unsigned int *)t22);
    t27 = (~(t26));
    t28 = *((unsigned int *)t7);
    t32 = (t28 & t27);
    t29 = (~(t31));
    t30 = (~(t32));
    t33 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t33 & t29);
    t34 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t34 & t30);
    goto LAB55;

LAB58:    t12 = *((unsigned int *)t9);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t9) = (t12 | t14);
    t15 = *((unsigned int *)t3);
    t16 = *((unsigned int *)t7);
    *((unsigned int *)t3) = (t15 | t16);
    goto LAB57;

LAB59:    t29 = *((unsigned int *)t40);
    t30 = *((unsigned int *)t22);
    *((unsigned int *)t40) = (t29 | t30);
    t39 = (t9 + 4);
    t41 = (t13 + 4);
    t33 = *((unsigned int *)t9);
    t34 = (~(t33));
    t35 = *((unsigned int *)t39);
    t36 = (~(t35));
    t37 = *((unsigned int *)t13);
    t38 = (~(t37));
    t42 = *((unsigned int *)t41);
    t43 = (~(t42));
    t31 = (t34 & t36);
    t32 = (t38 & t43);
    t44 = (~(t31));
    t45 = (~(t32));
    t46 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t46 & t44);
    t47 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t47 & t45);
    t48 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t48 & t44);
    t49 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t49 & t45);
    goto LAB61;

LAB63:    t56 = *((unsigned int *)t50);
    t57 = *((unsigned int *)t53);
    *((unsigned int *)t50) = (t56 | t57);
    t58 = *((unsigned int *)t51);
    t59 = *((unsigned int *)t53);
    *((unsigned int *)t51) = (t58 | t59);
    goto LAB62;

LAB64:    t75 = *((unsigned int *)t64);
    t76 = *((unsigned int *)t69);
    *((unsigned int *)t64) = (t75 | t76);
    t77 = (t50 + 4);
    t78 = (t63 + 4);
    t79 = *((unsigned int *)t50);
    t80 = (~(t79));
    t81 = *((unsigned int *)t77);
    t82 = (~(t81));
    t83 = *((unsigned int *)t63);
    t84 = (~(t83));
    t85 = *((unsigned int *)t78);
    t86 = (~(t85));
    t87 = (t80 & t82);
    t88 = (t84 & t86);
    t89 = (~(t87));
    t90 = (~(t88));
    t91 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t91 & t89);
    t92 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t92 & t90);
    t93 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t93 & t89);
    t94 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t94 & t90);
    goto LAB66;

LAB67:    t107 = *((unsigned int *)t95);
    t108 = *((unsigned int *)t101);
    *((unsigned int *)t95) = (t107 | t108);
    t109 = (t40 + 4);
    t110 = (t64 + 4);
    t111 = *((unsigned int *)t109);
    t112 = (~(t111));
    t113 = *((unsigned int *)t40);
    t114 = (t113 & t112);
    t115 = *((unsigned int *)t110);
    t116 = (~(t115));
    t117 = *((unsigned int *)t64);
    t118 = (t117 & t116);
    t119 = (~(t114));
    t120 = (~(t118));
    t121 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t121 & t119);
    t122 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t122 & t120);
    goto LAB69;

LAB72:    t12 = *((unsigned int *)t9);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t9) = (t12 | t14);
    t15 = *((unsigned int *)t3);
    t16 = *((unsigned int *)t7);
    *((unsigned int *)t3) = (t15 | t16);
    goto LAB71;

}

static void Cont_96_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;

LAB0:    t1 = (t0 + 5000U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 3832);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB7;

LAB4:    if (t20 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t8) = 1;

LAB7:    memset(t4, 0, 8);
    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t24) != 0)
        goto LAB10;

LAB11:    t31 = (t4 + 4);
    t32 = *((unsigned int *)t4);
    t33 = *((unsigned int *)t31);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB12;

LAB13:    t36 = *((unsigned int *)t4);
    t37 = (~(t36));
    t38 = *((unsigned int *)t31);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t31) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t40, 8);

LAB20:    t41 = (t0 + 5416);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    memset(t45, 0, 8);
    t46 = 1U;
    t47 = t46;
    t48 = (t3 + 4);
    t49 = *((unsigned int *)t3);
    t46 = (t46 & t49);
    t50 = *((unsigned int *)t48);
    t47 = (t47 & t50);
    t51 = (t45 + 4);
    t52 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t52 | t46);
    t53 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t53 | t47);
    xsi_driver_vfirst_trans(t41, 0, 0);
    t54 = (t0 + 5336);
    *((int *)t54) = 1;

LAB1:    return;
LAB6:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t30 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB11;

LAB12:    t35 = ((char*)((ng2)));
    goto LAB13;

LAB14:    t40 = ((char*)((ng1)));
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 1, t35, 1, t40, 1);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

}


extern void work_m_00000000002446019882_0886308060_init()
{
	static char *pe[] = {(void *)Always_30_0,(void *)Cont_96_1};
	xsi_register_didat("work_m_00000000002446019882_0886308060", "isim/CPU_test_bench_isim_beh.exe.sim/work/m_00000000002446019882_0886308060.didat");
	xsi_register_executes(pe);
}
